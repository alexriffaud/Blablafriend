#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDir>
#include <QIcon>
#include "MainApplication.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    // Create Logs directory
    QDir dir;
    if (!dir.exists("logs")) {
        dir.mkdir("logs");
    }

    //Setting up app icon
    app.setWindowIcon(QIcon("qrc:/res/logo"));


    QQmlApplicationEngine engine;
    MainApplication mainApp(&engine);
    engine.rootContext()->setContextProperty("mainApp", &mainApp);
    engine.rootContext()->setContextProperty("databaseApp", mainApp.getDatabaseApplication());
    engine.rootContext()->setContextProperty("currentUser", mainApp.getModelApplication()->currentUser());
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
