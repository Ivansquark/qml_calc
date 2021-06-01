#include "cpptablemodel.h"

CppTableModel::CppTableModel(QObject* parent): QAbstractTableModel(parent)
{
    init();
}
CppTableModel::~CppTableModel() {

}

int CppTableModel::columnCount(const QModelIndex &parent) const
{
    return cols;
}

QVariant CppTableModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    };
    switch (role) {
    case Qt::DisplayRole:
        //return QString("%1, %2").arg(index.column()).arg(index.row());
    case ColorRole:
        return color_data.value(index,QVariant());
    case TextRole: {
        return text_data.value(index,QVariant());
    }
    case CellWidth:
        if(index.column()==0) {
            return 80;
        } else {
            return 12;
        }
        //return QString("%1, %2").arg(index.column()).arg(index.row());
    default:
        return QVariant();
    }
}

int CppTableModel::rowCount(const QModelIndex &parent) const
{
    return rows;
}

QHash<int, QByteArray> CppTableModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractTableModel::roleNames();
    roles[ColorRole] = "color";
    roles[TextRole] = "text";
    roles[SetColorRole] = "setColor";
    roles[CellWidth] = "cellWidth";
    return roles;
}

Qt::ItemFlags CppTableModel::flags(const QModelIndex &index) const
{
    static int i; i++;
    qDebug()<<"FLAGS"<<i;
    if (!index.isValid())
        return Qt::ItemIsEnabled;
    return QAbstractTableModel::flags(index) | Qt::ItemIsSelectable;
}

bool CppTableModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    switch (role) {
    case SetColorRole: {
        if(index.column() == 0) {
            for(QModelIndex i: color_data.keys()) {
                setData(i,"grey",ColorRole);
            }
            setData(index,"skyblue",ColorRole);
            switch(index.row()) {
            case 0: dec_hex_bin_state = 0; *receivedStr=""; setZeroes(); break;
            case 1: dec_hex_bin_state = 1; *receivedStr=""; setZeroes(); break;
            case 2: dec_hex_bin_state = 2; *receivedStr=""; setZeroes(); break;
            default: break;
            }
        return true;
        }
    }
    case ColorRole:
        color_data.insert(index,value);
        emit dataChanged(index,index);
        return true;
    case TextRole: {
        text_data.insert(index,value);
        emit dataChanged(index,index);
        return true;
    }
    case Qt::DisplayRole:
        return true;
    default:
        return false;
    }
    return false;
}

void CppTableModel::calcButClicked(QVariant x) {
    QString tempStr = x.toString();

    if(tempStr == "<" && *receivedStr != "") {
        receivedStr->chop(1);
    } else if(tempStr == "<") {
        return;
    } else {
        *receivedStr += tempStr;
    }
    switch(dec_hex_bin_state) {
    case 0: {
        setData(index(0,1),*receivedStr,TextRole);
        setData(index(1,1), convertToHex(*receivedStr),TextRole);
        setData(index(2,1), convertToBin(*receivedStr),TextRole);
    } break;
    case 1: {
        setData(index(0,1), convertToDec(*receivedStr), TextRole);
        setData(index(1,1),*receivedStr,TextRole);
        setData(index(2,1), convertToBin(*receivedStr),TextRole);
    } break;
    case 2: {
        setData(index(0,1), convertToDec(*receivedStr), TextRole);
        setData(index(1,1), convertToHex(*receivedStr),TextRole);
        setData(index(2,1),*receivedStr,TextRole);
    } break;
    default: break;
    }
}



//void CppTableModel::add()
//{
//    rows=rows+1;
//    QModelIndex index = createIndex(rows, cols, static_cast<void *>(nullptr));
//    beginInsertRows(QModelIndex(), text_data.size(), text_data.size());
//    text_data.insert(QModelIndex(),"1");
//    endInsertRows();
//    emit dataChanged(index, index);
//}



//int CppTableModel::number(int row, int col) const
//{
//    return (10*row+col*10);
//}

void CppTableModel::init()
{
    receivedStr = new QString;
    setData(index(0,0),"DEC",TextRole);
    setData(index(1,0),"HEX",TextRole);
    setData(index(2,0),"BIN",TextRole);
    setData(index(0,1),"0",TextRole);
    setData(index(1,1),"0",TextRole);
    setData(index(2,1),"0",TextRole);
    setData(index(0,0),"skyblue",ColorRole);
    setData(index(1,0),"grey",ColorRole);
    setData(index(2,0),"grey",ColorRole);
    setData(index(0,1),"grey",ColorRole);
    setData(index(1,1),"grey",ColorRole);
    setData(index(2,1),"grey",ColorRole);
}

QString CppTableModel::convertToBin(const QVariant &str) {
    QString temp=str.toString();
    switch(dec_hex_bin_state) {
    case 0: {
        qulonglong bin = temp.toULongLong();
        temp = QString::number(bin,2);
    } break;
    case 1: {
        bool ok;
        temp = QString::number(temp.toLongLong(&ok, 16),10);
        qulonglong bin = temp.toULongLong();
        temp = QString::number(bin,2);
    } break;
    case 2: {

    } break;
    default: break;
    }
    return temp;
}

QString CppTableModel::convertToHex(const QVariant &str) {
    QString temp=str.toString();
    switch(dec_hex_bin_state) {
    case 0: {
        temp = QString::number(temp.toLongLong(),16);
    }break;
    case 1: {

    } break;
    case 2: {
        bool ok;
        temp = QString::number(temp.toLongLong(&ok, 2),16);
    } break;
    default: break;
    }
    return temp;
}

QString CppTableModel::convertToDec(const QVariant &str) {
    QString temp=str.toString();
    switch(dec_hex_bin_state) {
    case 0: {

    } break;
    case 1: {
        bool ok;
        temp = QString::number(temp.toLongLong(&ok, 16),10);
    } break;
    case 2: {
        bool ok;
        temp = QString::number(temp.toLongLong(&ok, 2),10);
    } break;
    default: break;
    }
    return temp;
}
