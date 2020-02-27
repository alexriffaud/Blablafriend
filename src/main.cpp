#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>
#include <QIcon>
#include "inc/MainApplication.h"

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
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    MainApplication mainApp;

    return app.exec();
}
