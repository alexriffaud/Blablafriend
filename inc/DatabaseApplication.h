#ifndef DATABASEAPPLICATION_H
#define DATABASEAPPLICATION_H

#include <QObject>
#include <QString>
#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QHttpMultiPart>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

#include "ModelApplication.h"
#include "Enums.h"

class DatabaseApplication : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool _isConnected MEMBER _isConnected NOTIFY changeLoginState)
public:
    DatabaseApplication(ModelApplication *modelApplication);

    void test();
    bool testParser(QNetworkReply *reply);

    bool isDBConnected();

    void connect(QString name, QString password);
    bool connectParser(QNetworkReply *reply);

    void postUserRequest(QByteArray & postData);

    void getAllEvents();
    bool parseAllEvents(QNetworkReply *reply);

    void getUserEvents();
    bool parseUserEvents(QNetworkReply *reply);

    void postEventRequest(QByteArray & postData);
    void getEvent();
    bool parseEvent(QNetworkReply *reply);

    void getEvent(QString name, int idUser, QString description);

    Q_INVOKABLE void deleteEvent(int id);

    Q_INVOKABLE bool isConnected() const;
    Q_INVOKABLE void disconnect();

private slots:
    QVariant onResult(QNetworkReply *reply);

signals:
    void changeLoginState();

private:
    //App
    ModelApplication        *_modelApplication;

    //Network
    QNetworkRequest         _request;

    //API
    QString                 _address;
    Request                 _requestNum;

    bool                    _connectionState;
    bool                    _isConnected;
};

#endif // DATABASEAPPLICATION_H
