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
    qDebug()<<x;
    *receivedStr = x.toString();
    setData(index(1),*receivedStr,TextRole);
    *threatData += *receivedStr;
    setData(index(0),*threatData,TextRole);
}

void CppListModel::init() {
    receivedStr = new QString;
    threatData = new QString;
    setData(index(0),"0",TextRole);
    setData(index(1),"0",TextRole);
}
