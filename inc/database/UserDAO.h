#ifndef USERDAO_H
#define USERDAO_H

#include <QObject>
#include <QString>
#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>

#include "Enums.h"

class UserDAO
{
public:
    UserDAO(QNetworkAccessManager *manager,QNetworkRequest *request, QString &address);

    void connect(QString &name, QString &password);

private:
    //Network
    QNetworkAccessManager   *_manager;
    QNetworkRequest         *_request;

    QString                 _address;
};

#endif // USERDAO_H
