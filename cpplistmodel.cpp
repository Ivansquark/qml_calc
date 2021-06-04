#include "cpplistmodel.h"

CppListModel::CppListModel(QObject* parent): QAbstractListModel(parent) {
    init();
}
CppListModel::~CppListModel() {

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
        return;
    }

    if (countState == CountingState::FIRST) {
        if((tempStr != "=") and (tempStr != "-") and (tempStr != "+") and (tempStr != "*") and
                (tempStr != "/") and (tempStr != "sqrt") and (tempStr != "<")) {
            if(*secondOperator == "" or *secondOperator == "="){
                *receivedStr += tempStr; *threatData += tempStr;
            } else{
                *receivedStr += tempStr; *threatData += tempStr;
            }
            printData(*threatData,*receivedStr);
        } else if (tempStr == "="){  // skipping
        } else if (tempStr == "<") { // deleting one symbol or skipping
            if(*receivedStr != "") {
                //threatData->chop(1);
                receivedStr->chop(1);
                printData(*threatData,*receivedStr);
            }
        } else if (tempStr == "sqrt") { // binary operator
            if(*receivedStr != "") {
                first = receivedStr->toDouble();
                *firstOperator = "sqrt";
                qDebug() << "firstOperator";
                countState = CountingState::START_COUNT;
            } else {
                zeroes();
            }
        } else { //receive first operator
            if(*receivedStr == "") { //operator next for operator
                *firstOperator = tempStr;
                *receivedStr = *threatData;
                *threatData += tempStr;
                qDebug() << "threatData" << *threatData;
                countState = CountingState::OPERATOR; // received operator
            } else { //receive first operator if first data exists
                *firstOperator = tempStr;
                *threatData +=tempStr;
                countState = CountingState::OPERATOR;
            }
        }
    }
    if (countState == CountingState::OPERATOR) { //! operator parsing
        first = receivedStr->toDouble();
        *receivedStr = "";
        printData(*firstOperator,*threatData);
        countState = CountingState::SECOND;
    }
    if (countState == CountingState::SECOND) {
        if((tempStr != "=") and (tempStr != "-") and (tempStr != "+") and (tempStr != "*") and
                (tempStr != "/") and (tempStr != "sqrt") and (tempStr != "<")) {
            *receivedStr += tempStr; *threatData += tempStr;
            printData(*receivedStr,*threatData);
        } else if (tempStr == "="){
            if(*receivedStr == "") {
                QString temp = *threatData; temp.chop(1);
                second = temp.toDouble();
                printData(*threatData,tempStr);
                *secondOperator = "=";
                countState = CountingState::START_COUNT;
            } else {
                second = receivedStr->toDouble();
                *secondOperator = tempStr;
                *threatData += "=";
                //*secondOperator = "=";
                countState = CountingState::START_COUNT;
            }
        } else if(tempStr == "sqrt") {
            second = receivedStr->toDouble();
            *secondOperator = tempStr;
            countState = CountingState::START_COUNT;
        } else if (tempStr == "<") { // deleting one symbol or skipping
            if(*receivedStr != "") {
                threatData->chop(1);
                receivedStr->chop(1);
                printData(*threatData,*receivedStr);
            }
        } else {
            if(*receivedStr != "") {
                second = receivedStr->toDouble();
                *secondOperator = tempStr; *threatData += "=";
                countState = CountingState::START_COUNT; // received operator
            }
        }
    }
    if (countState == CountingState::START_COUNT) {
        double res = 0;
        qDebug() << "res";
        if(*firstOperator == "sqrt") {
            //qDebug() << "res";
            res = sqrt(first);
            second=0;
            tempStr = QString::number(res,'g',12);
            *threatData = "\u221A" + QString::number(first);
            printData(tempStr, *threatData);
            *receivedStr = ""; *threatData = tempStr;
            countState = CountingState::FIRST;
        } else if(*firstOperator == "*") {
            res = first * second;
            tempStr = QString::number(res,'g',12);
            printData(tempStr,*threatData);
            *receivedStr = ""; *threatData = tempStr;
            countState = CountingState::FIRST;
        } else if(*firstOperator == "/") {
            res = first / second;
            tempStr = QString::number(res,'g',12);
            printData(tempStr,*threatData);
            *receivedStr = ""; *threatData = tempStr;
            countState = CountingState::FIRST;
        } else if(*firstOperator == "+") {
            res = first + second;
            qDebug() << "first" << first <<"second"<<second<< "res"<<res;
            qDebug() << "firstOP" << *firstOperator <<"secondOP"<<*secondOperator;
            tempStr = QString::number(res,'g',12);
            printData(tempStr,*threatData);
            *receivedStr = ""; *threatData = "";
            countState = CountingState::FIRST;
        } else if(*firstOperator == "-") {
            res = first - second;
            tempStr = QString::number(res,'g',12);
            printData(tempStr,*threatData);
            *receivedStr = ""; *threatData = "";;
            countState = CountingState::FIRST;
        } else {
            *receivedStr = "";
            countState = CountingState::FIRST; // received operator
        }
        if(*secondOperator == "=") {
            *receivedStr = ""; *threatData = "";
        } else if(*secondOperator == "sqrt") {
            res = sqrt(res);
            tempStr = QString::number(res,'g',12);
            *threatData = "\u221A" + *threatData;
            printData(tempStr,*threatData);
            *receivedStr = ""; *threatData = tempStr;
            countState = CountingState::FIRST;
        } else if(*secondOperator != ""){
            //qDebug()<<"secondOperator";
            //*receivedStr = "";
            //*threatData=QString::number(res);
            //tempStr=*secondOperator;
            //printData(*threatData, tempStr);
            //countState = CountingState::FIRST;
        }
    }
}

void CppListModel::init() {
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
