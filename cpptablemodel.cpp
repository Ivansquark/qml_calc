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
            return 90;
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
                setData(i,"transparent",ColorRole);
            }
            setData(index,"skyblue",ColorRole);
        }
        return false;
    }
    case ColorRole:
        color_data.insert(index,value);
        emit dataChanged(index,index);
        return false;
    case TextRole: {
        text_data.insert(index,value);
        emit dataChanged(index,index);
        return false;
    }
    case Qt::DisplayRole:
        return true;
    default:
        return true;
    }
    return false;
}

void CppTableModel::calcButClicked(QVariant x) {
    QString tempStr = x.toString();
    if(tempStr == "Reverse" && *receivedStr != "") {
        receivedStr->chop(1);
        setData(index(0,1),*receivedStr,TextRole);
        return;
    } else return;
    *receivedStr += tempStr;
    switch(dec_hex_bin_state) {
    case 0: {
        setData(index(0,1),*receivedStr,TextRole);
    } break;
    case 1: {

    } break;
    case 2: {

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
    setData(index(1,0),"transparent",ColorRole);
    setData(index(2,0),"transparent",ColorRole);
    setData(index(0,1),"transparent",ColorRole);
    setData(index(1,1),"transparent",ColorRole);
    setData(index(2,1),"transparent",ColorRole);
}
