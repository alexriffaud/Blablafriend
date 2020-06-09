#ifndef MAINAPPLICATION_H
#define MAINAPPLICATION_H

#include <QQmlApplicationEngine>
#include <QDebug>
#include <qqml.h>

#include "DatabaseApplication.h"
#include "ModelApplication.h"

class MainApplication : public QObject
{
    Q_OBJECT
public:
    MainApplication(QQmlApplicationEngine *engine);

    Q_INVOKABLE void login(const QString &login, const QString &password);

    DatabaseApplication *getDatabaseApplication();

private:
    ModelApplication        _modelApplication;
    DatabaseApplication     _databaseApplication;

    QQmlApplicationEngine   *_engine;
};

#endif // MAINAPPLICATION_H
