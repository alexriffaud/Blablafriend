#include "DatabaseApplication.h"

DatabaseApplication::DatabaseApplication() :
    _userDAO()
{
    _address = "http://localhost:3000/";
    _connection = false;
    QObject::connect(&_manager, SIGNAL(finished(QNetworkReply*)), this, SLOT(onResult(QNetworkReply*)));
}

QVariant DatabaseApplication::onResult(QNetworkReply *reply)
{
    //Check error
    if (reply->error())
    {
        qDebug() << reply->errorString();
        return false;
    }

    //Check request
    switch(_requestNum)
    {
        case Request::TEST:
        {
            break;
        }
        default:
        {
            break;
        }
    }

    QString answer = reply->readAll();
    qDebug() << answer;
    return answer;
}

bool DatabaseApplication::isConnected() const
{
    return _connection;
}

void DatabaseApplication::test()
{
    _requestNum = Request::TEST;

    _request.setUrl(QUrl(_address + "test"));
    _manager.get(_request);
}

