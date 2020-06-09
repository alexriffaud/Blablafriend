#ifndef DATABASEAPPLICATION_H
#define DATABASEAPPLICATION_H

#include <QObject>
#include <QString>
#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QHttpMultiPart>

#include "UserDAO.h"
#include "Enums.h"

class DatabaseApplication : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool _isConnected MEMBER _isConnected NOTIFY changeLoginState)
public:
    DatabaseApplication();

    void test();
    bool testParser(QNetworkReply *reply);

    bool isDBConnected();

    void connect(QString name, QString password);
    bool connectParser(QNetworkReply *reply);

    void postRequest(QByteArray & postData);

    UserDAO *userDAO();

    Q_INVOKABLE bool isConnected() const;

private slots:
    QVariant onResult(QNetworkReply *reply);

signals:
    void changeLoginState();

private:
    //DAO
    UserDAO                 _userDAO;

    //Network
    QNetworkAccessManager   _manager;
    QNetworkRequest         _request;

    //API
    QString                 _address;
    Request                 _requestNum;

    bool                    _connectionState;
    bool                    _isConnected;
};

#endif // DATABASEAPPLICATION_H
