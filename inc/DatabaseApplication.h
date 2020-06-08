#ifndef DATABASEAPPLICATION_H
#define DATABASEAPPLICATION_H

#include <QObject>
#include <QString>
#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>

#include "UserDAO.h"
#include "Enums.h"

class DatabaseApplication : public QObject
{
    Q_OBJECT
public:
    DatabaseApplication();

    void test();

    bool isConnected() const;

private slots:
    QVariant onResult(QNetworkReply *reply);

private:
    //DAO
    UserDAO                 _userDAO;

    //Network
    QNetworkAccessManager   _manager;
    QNetworkRequest         _request;

    //API
    QString                 _address;
    Request                 _requestNum;

    bool                    _connection;
};

#endif // DATABASEAPPLICATION_H
