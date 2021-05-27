#ifndef CPP_INTERFACE_H
#define CPP_INTERFACE_H

#include <QObject>
#include <QVariant>
#include <QDebug>

class cpp_interface: public QObject
{
    Q_OBJECT
public:
    cpp_interface(QObject* parent = nullptr);

public:
    Q_INVOKABLE QVariant convertToBin(const QVariant& str, const int& caseIndex);
    Q_INVOKABLE QVariant convertToHex(const QVariant& str, const int& caseIndex);
    Q_INVOKABLE QVariant convertToDec(const QVariant& str, const int& caseIndex);
    QString* result{nullptr};
private:
    void init();
};

#endif // CPP_INTERFACE_H
