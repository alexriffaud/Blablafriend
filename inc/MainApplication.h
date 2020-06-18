#ifndef MAINAPPLICATION_H
#define MAINAPPLICATION_H

#include <QQmlApplicationEngine>
#include <QDebug>
#include <QJsonObject>
#include <QJsonDocument>
#include <QQmlContext>
#include <QThread>

#include "DatabaseApplication.h"
#include "ModelApplication.h"

class MainApplication : public QObject
{
    Q_OBJECT
public:
    MainApplication(QQmlApplicationEngine *engine);

    Q_INVOKABLE void login(const QString &login, const QString &password);
    Q_INVOKABLE bool makeUserData(QString email, QString login, QString lastname, QString firstname, QString birthday, QString city, QString password1, QString password2, QString description);
    Q_INVOKABLE bool makeEventData(QString name, QString description, QString date, QString localization);
    Q_INVOKABLE bool editEventData(QString name, QString description, QString date, QString localization, int id);

    DatabaseApplication *getDatabaseApplication();
    Q_INVOKABLE User *getCurrentUser();

    Q_INVOKABLE ModelApplication *getModelApplication();

private:
    ModelApplication        _modelApplication;
    DatabaseApplication     _databaseApplication;

    QQmlApplicationEngine   *_engine;
};

#endif // MAINAPPLICATION_H
