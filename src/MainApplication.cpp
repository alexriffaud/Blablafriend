#include "MainApplication.h"

MainApplication::MainApplication(QQmlApplicationEngine *engine) :
    _modelApplication(),
    _databaseApplication()
{
    _engine = engine;
}

void MainApplication::login(const QString &login, const QString &password)
{
    qDebug() << "MainApplication::login";

    _databaseApplication.connect(login, password);

}

DatabaseApplication *MainApplication::getDatabaseApplication()
{
    return &_databaseApplication;
}
