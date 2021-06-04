#ifndef CPPLISTMODEL_H
#define CPPLISTMODEL_H

#include <QAbstractListModel>
#include <QModelIndex>
#include <QDebug>
#include <QtMath>

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
    inline Q_INVOKABLE void zeroes() {
        setZeroes();
    }
private:
    void init();
    inline void printData(const QString &receive, const QString &threat);
    QHash<QModelIndex, QVariant> text_data;
    QString* receivedStr{nullptr};
    QString* threatData{nullptr};
    QString* firstOperator{nullptr};
    QString* secondOperator{nullptr};
    double first = 0;
    double second = 0;
    enum class CountingState {
        FIRST = 0,
        OPERATOR = 1,
        SECOND = 2,
        START_COUNT = 3
    };
    CountingState countState = CountingState::FIRST;
    bool startCountFlag = false;
    bool startOperatorFlag = false;
    inline void setZeroes() {
        first = 0; second = 0;
        *receivedStr = "";
        *threatData = "";
        setData(index(0),"0",TextRole);
        setData(index(1),"0",TextRole);
    }

};

#endif // CPPLISTMODEL_H
