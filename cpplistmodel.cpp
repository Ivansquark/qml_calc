#include "cpplistmodel.h"

CppListModel::CppListModel(QObject* parent): QAbstractListModel(parent) {
    init();
}
CppListModel::~CppListModel() {

}

bool CppListModel::isEnabled()
{
    return dotPressedFlag;
}

void CppListModel::setEnabled(bool value)
{
    dotPressedFlag = value;
}

int CppListModel::rowCount(const QModelIndex &parent) const
{
    return 2;
}

QVariant CppListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    };
    switch (role) {
    case Qt::DisplayRole:
        //return QString("%1, %2").arg(index.column()).arg(index.row());
    case TextRole: {
        return text_data.value(index,QVariant());
    }
    case CellWidth:
        return 100;
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> CppListModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[TextRole] = "text";
    roles[CellWidth] = "cellWidth";
    return roles;
}

bool CppListModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(!index.isValid()) return false;
    switch(role) {
    case TextRole: {
        text_data.insert(index,value);
        emit dataChanged(index,index);
        return true;
    }
    default: return false;
    }
    return false;
}

void CppListModel::calc1ButClicked(QVariant x)
{
    QString tempStr = x.toString();
    //qDebug() << tempStr;
    if(tempStr == "C") {
        zeroes();
        countState = CountingState::FIRST;
        return;
    }

    if (countState == CountingState::FIRST) {
        if((tempStr != "=") and (tempStr != "-") and (tempStr != "+") and (tempStr != "*") and
                (tempStr != "/") and (tempStr != "sqrt") and (tempStr != "<")) {
            if(*secondOperator == ""){
                *receivedStr += tempStr; *threatData += tempStr;
            } else if (*secondOperator == "=") {
                setZeroesValues();
                *receivedStr += tempStr; *threatData += tempStr;
            } else {
                *receivedStr += tempStr; *threatData += tempStr;
            }
            printData(*threatData,*receivedStr);
        } else if (tempStr == "="){  // skipping
        } else if (tempStr == "<") { // deleting one symbol or skipping
            if (*secondOperator == "=") {
                *secondOperator = "";
                zeroes();
                return;
            }
            if(*receivedStr != "") {
                //threatData->chop(1);
                if(receivedStr->data()[receivedStr->size()-1] == "."){
                    emit sendDotDisable();
                    qDebug()<<"receivedStr->data()[receivedStr->size()-1]"<< receivedStr->data()[receivedStr->size()-1];
                }
                receivedStr->chop(1);
                threatData->chop(1);
                printData(*receivedStr, *threatData);
            }
        } else if (tempStr == "sqrt") { // binary operator
            if(*receivedStr != "") {
                if (*secondOperator == "=") {
                    *secondOperator = "";
                    *receivedStr = *firstStr;
                } else {
                    *firstStr = *receivedStr;
                }
                *firstOperator = "sqrt";
                countState = CountingState::OPERATOR2;
            } else if (*firstOperator == "sqrt") {
                *threatData =  *firstStr;
                countState = CountingState::OPERATOR2;
            } else {
                zeroes();
            }
        } else {
            //receive first operator (+,-,/,*)
            if(*secondOperator == "=") {
                *secondOperator = "";
                *firstOperator = tempStr;
                *receivedStr = *threatData;
                *threatData += tempStr;
                printData(*firstOperator, *threatData);
                countState = CountingState::OPERATOR;
                return;
            }
            if(*receivedStr == "") { //operator next for operator
                if (*firstOperator == "sqrt") {
                    *firstOperator = tempStr;
                    *receivedStr = *firstStr;
                    *threatData = *firstStr + *firstOperator;
                    countState = CountingState::OPERATOR;
                } else {
                    *firstOperator = tempStr;
                    *receivedStr = *threatData;
                    *threatData += tempStr;
                }
                qDebug() << "threatData" << *threatData;
                countState = CountingState::OPERATOR; // received operator
            } else { //receive first operator if first data exists
                *firstOperator = tempStr;
                *threatData += tempStr;
                countState = CountingState::OPERATOR;
            }
        }
    }
    if (countState == CountingState::OPERATOR) { //! operator parsing
        *firstStr = *receivedStr;
        *receivedStr = "";
        printData(*firstOperator,*threatData);
        *threatData = "";
        countState = CountingState::SECOND;
    }
    if (countState == CountingState::SECOND) {
        if((tempStr != "=") and (tempStr != "-") and (tempStr != "+") and (tempStr != "*") and
                (tempStr != "/") and (tempStr != "sqrt") and (tempStr != "<")) {
            *receivedStr += tempStr; *threatData += tempStr;
            *secondStr=*receivedStr;
            printData(*receivedStr, *firstStr+*firstOperator+*secondStr);
            qDebug()<<*firstStr+*firstOperator+*threatData;
        } else if (tempStr == "="){
            if(*receivedStr == "") {
                QString temp = *threatData; temp.chop(1);
                printData(*threatData,tempStr);
                *secondOperator = "=";
                countState = CountingState::OPERATOR2;
            } else {
                *secondOperator = tempStr;
                *threatData += "=";
                countState = CountingState::OPERATOR2;
            }
        } else if(tempStr == "sqrt") {
            if(*receivedStr != "") {
                *secondStr = *receivedStr;
                *secondOperator = "sqrt";
                qDebug() << "secondOperator";
                countState = CountingState::OPERATOR;
            } else {
                zeroes();
                countState = CountingState::OPERATOR2;
            }
            //*secondOperator = tempStr;
        } else if (tempStr == "<") { // deleting one symbol or skipping
            if(*receivedStr != "") {
                if(receivedStr->data()[receivedStr->size()-1] == "."){
                    emit sendDotDisable();
                }
                *threatData = *firstStr + *firstOperator + *receivedStr;
                receivedStr->chop(1);
                threatData->chop(1);
                *secondStr = *receivedStr;
                printData(*receivedStr, *threatData);
                *threatData = "";
            }
        } else {
            if(*receivedStr != "") {
                *secondOperator = tempStr;
                countState = CountingState::OPERATOR2; // received operator
            }
        }
    }
    if (countState == CountingState::OPERATOR2) {
        double res = 0;
        qDebug() << "res";
        first = firstStr->toDouble();
        second = secondStr->toDouble();
        *threatData = *firstStr + *firstOperator + *secondStr + *secondOperator;
        qDebug()<<"first second"<<first<<second;
        if(*firstOperator == "sqrt") {
            //qDebug() << "res";
            res = sqrt(first);
            second=0;
            *firstStr = QString::number(res,'g',12);
            *threatData = "\u221A" + QString::number(first);
            printData(*firstStr, *threatData);
            *receivedStr = "";
            //setZeroesValues();
            countState = CountingState::FIRST;
        } else if(*firstOperator == "*") {
            res = first * second;
        } else if(*firstOperator == "/") {
            res = first / second;
        } else if(*firstOperator == "+") {
            res = first + second;
        } else if(*firstOperator == "-") {
            res = first - second;
        } else {
            *receivedStr = "";
        }
        if(*secondOperator == "=") {
            printData(QString::number(res), *threatData);
            *firstStr = QString::number(res);
            *threatData = QString::number(res);
            //setZeroesValues();
            countState = CountingState::FIRST;
        } else if(*secondOperator == "sqrt") {
            *threatData = QString::number(res,'g',12);
            res = sqrt(res);
            tempStr = QString::number(res,'g',12);
            *threatData = "\u221A" + *threatData;
            printData(tempStr,*threatData);
            *receivedStr = ""; *threatData = tempStr;
            setZeroesValues();
            countState = CountingState::FIRST;
        } else if(*secondOperator != ""){
            *firstStr = QString::number(res);
            *threatData=*firstStr+*secondOperator;
            tempStr = *secondOperator;
            printData(tempStr, *threatData);
            *threatData = ""; *receivedStr = ""; *secondStr = "";
            *firstOperator = *secondOperator; *secondOperator = "";
            //*receivedStr = *firstStr+*secondOperator;
            countState = CountingState::SECOND;
        }
    }
}

void CppListModel::init() {
    firstStr = new QString;
    secondStr = new QString;
    resStr = new QString;
    receivedStr = new QString;
    threatData = new QString;
    firstOperator = new QString;
    secondOperator = new QString;
    setData(index(0),"0",TextRole);
    setData(index(1),"0",TextRole);
}

void CppListModel::printData(const QString &receive, const QString &threat)
{
    setData(index(0),threat,TextRole);
    setData(index(1),receive,TextRole);
}
