#ifndef CPPTABLEMODEL_H
#define CPPTABLEMODEL_H

#include <QAbstractTableModel>
#include <QModelIndexList>
#include <QDebug>

class CppTableModel: public QAbstractTableModel
{
    Q_OBJECT
public:
    //! user roles that implements cells functionality
    enum Roles {
        ColorRole = Qt::UserRole + 1,
        TextRole,
        SetColorRole,
        CellWidth
    };
    CppTableModel(QObject* parent = nullptr);
    ~CppTableModel();
    //Q_PROPERTY(int number MEMBER m_number CONSTANT)
    virtual int columnCount(const QModelIndex &parent = QModelIndex()) const;
    virtual QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const ;
    virtual int rowCount(const QModelIndex &parent = QModelIndex()) const;
    virtual QHash<int, QByteArray> roleNames() const;
    virtual Qt::ItemFlags flags(const QModelIndex &index) const;
    virtual bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole);

    //Q_INVOKABLE void add();
    Q_INVOKABLE void calcButClicked(QVariant x);
    __forceinline Q_INVOKABLE void zeroes() {
        setZeroes();
    }
    //int number(int row, int col) const;
private:
    QHash<QModelIndex, QVariant> text_data;
    QHash<QModelIndex, QVariant> color_data;
    QModelIndex* init_index{nullptr};
    QString* receivedStr{nullptr};
    quint8 dec_hex_bin_state=0;
    int m_number=100;
    int rows=3;
    int cols=2;

    void init();
    __forceinline void setZeroes() {
        setData(index(0,1),"0",TextRole);
        setData(index(1,1),"0",TextRole);
        setData(index(2,1),"0",TextRole);
    }
    QString convertToBin(const QVariant& str);
    QString convertToHex(const QVariant& str);
    QString convertToDec(const QVariant& str);
};

#endif // CPPTABLEMODEL_H
