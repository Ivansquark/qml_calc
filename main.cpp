#include "cpp_interface.h"
#include "cpptablemodel.h"
#include "cpplistmodel.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    cpp_interface interface;
    CppTableModel cppTableModel;
    CppListModel cppListModel;
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<cpp_interface>("cppInterface",1,0,"Interface");
    qmlRegisterType<CppTableModel>("cppTableModel",1,0,"CppModel");
    qmlRegisterType<CppListModel>("cppListModel",1,0,"CppListModel");
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    //engine.rootContext()->setContextProperty("interface",&interface);
    engine.load(url);

    return app.exec();
}
