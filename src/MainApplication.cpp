#include "MainApplication.h"

MainApplication::MainApplication(QQmlApplicationEngine *engine) :
    _modelApplication(),
    _databaseApplication()
{
    _engine = engine;
}

bool MainApplication::login(const QString &login, const QString &password)
{
    qDebug() << "MainApplication::login";

    if(_databaseApplication.isConnected())
    {
        qDebug() << "ok";
        return true;
    }
    else
    {
        qDebug() << "fail";
        return false;
    }
}
