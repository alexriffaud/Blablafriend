#include "DatabaseApplication.h"

DatabaseApplication::DatabaseApplication() :
    _userDAO(&_manager, &_request, _address)
{
    _address = "http://localhost:3000/";
    _connection = false;
    QObject::connect(&_manager, SIGNAL(finished(QNetworkReply*)), this, SLOT(onResult(QNetworkReply*)));
}

QVariant DatabaseApplication::onResult(QNetworkReply *reply)
{
    QVariant result;
    //Check error
    if (reply->error())
    {
        qDebug() << reply->errorString();
        result = false;
    }
    else
    {
        //Check request
        switch(_requestNum)
        {
            case Request::TEST:
            {
                _connection = testParser(reply);

                break;
            }
            default:
            {
                break;
            }
        }
    }

    return result;
}

UserDAO *DatabaseApplication::userDAO()
{
    return &_userDAO;
}

bool DatabaseApplication::isConnected()
{
    test();
    return _connection;
}

void DatabaseApplication::test()
{
    _requestNum = Request::TEST;

    _request.setUrl(QUrl(_address + "test"));
    _manager.get(_request);
}

bool DatabaseApplication::testParser(QNetworkReply *reply)
{
    if (reply->error())
    {
        return false;
    }
    else
    {
        return true;
    }
}
