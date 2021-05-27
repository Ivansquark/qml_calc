#include "cpp_interface.h"

cpp_interface::cpp_interface(QObject* parent) : QObject(parent) {
    init();
}

QVariant cpp_interface::convertToBin(const QVariant &str, const int& caseIndex)
{
    QString temp=str.toString();
    switch(caseIndex) {
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
    QVariant a(temp);
    return a;
}

QVariant cpp_interface::convertToHex(const QVariant &str, const int& caseIndex)
{
    QString temp=str.toString();
    switch(caseIndex) {
    case 0: {
        bool ok;
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
    QVariant a(temp);
    return a;
}

QVariant cpp_interface::convertToDec(const QVariant &str, const int& caseIndex)
{
    QString temp=str.toString();
    switch(caseIndex) {
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
    QVariant a(temp);
    return a;
}

void cpp_interface::init() {
    result = new QString;
}

