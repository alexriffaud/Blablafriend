#ifndef MAINAPPLICATION_H
#define MAINAPPLICATION_H

#include <QQmlApplicationEngine>
#include <QDebug>
#include <QJsonObject>
#include <QJsonDocument>

#include "DatabaseApplication.h"
#include "ModelApplication.h"

class MainApplication : public QObject
{
    Q_OBJECT
public:
    MainApplication(QQmlApplicationEngine *engine);

    Q_INVOKABLE void login(const QString &login, const QString &password);
    Q_INVOKABLE bool makeData(QString email, QString login, QString lastname, QString firstname, QString birthday, QString city, QString password1, QString password2, QString description);

    DatabaseApplication *getDatabaseApplication();
    Q_INVOKABLE User *getCurrentUser();

    Q_INVOKABLE ModelApplication *getModelApplication();

private:
    ModelApplication        _modelApplication;
    DatabaseApplication     _databaseApplication;

    QQmlApplicationEngine   *_engine;
};

#endif // MAINAPPLICATION_H
