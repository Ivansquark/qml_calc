#ifndef CPPLISTMODEL_H
#define CPPLISTMODEL_H

#include <QAbstractListModel>
#include <QModelIndex>
#include <QDebug>

class CppListModel: public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        TextRole = Qt::UserRole + 1,
        CellWidth
    };
    CppListModel(QObject* parent = nullptr);
    ~CppListModel();

    virtual int rowCount(const QModelIndex &parent = QModelIndex()) const;
    virtual QVariant data(const QModelIndex &index, int role=Qt::DisplayRole) const;
    virtual QHash<int, QByteArray> roleNames() const;
    virtual bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole);
    Q_INVOKABLE void calc1ButClicked(QVariant x);
    __forceinline Q_INVOKABLE void zeroes() {
        setZeroes();
    }
private:
    void init();
    QHash<QModelIndex, QVariant> text_data;
    QString* receivedStr{nullptr};
    QString* threatData{nullptr};

    __forceinline void setZeroes() {
        setData(index(0),"0",TextRole);
        setData(index(1),"0",TextRole);
    }

};

#endif // CPPLISTMODEL_H
