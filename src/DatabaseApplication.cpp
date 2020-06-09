#include "DatabaseApplication.h"

DatabaseApplication::DatabaseApplication() :
    _userDAO(&_manager, &_request)
{
    _address = "http://localhost:3000/";
    _userDAO.setAddress(_address);
    _connectionState = false;
    _isConnected = false;
    QObject::connect(&_manager, SIGNAL(finished(QNetworkReply*)), this, SLOT(onResult(QNetworkReply*)));
}

QVariant DatabaseApplication::onResult(QNetworkReply *reply)
{
    QVariant result;
        //Check request
    switch(_requestNum)
    {
        case Request::TEST:
        {
            qDebug() << "Request::TEST";
            _connectionState = testParser(reply);
            result = _connectionState;
            break;
        }
        case Request::CONNECT:
        {
            qDebug() << "Request::CONNECT";
            _isConnected = connectParser(reply);
            result = _isConnected;
            emit changeLoginState();
            break;
        }
        default:
        {
            break;
        }
    }

    return result;
}

void DatabaseApplication::postRequest(QByteArray & postData)
{
    QUrl url = QUrl(_address +"/");

    QHttpMultiPart http;

    QHttpPart receiptPart;
    receiptPart.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant("form-data; name=\"data\""));
    receiptPart.setBody(postData);

    http.append(receiptPart);

    _manager.post(QNetworkRequest(url), &http);
}

bool DatabaseApplication::isConnected() const
{
    return _isConnected;
}

UserDAO *DatabaseApplication::userDAO()
{
    return &_userDAO;
}

bool DatabaseApplication::isDBConnected()
{
    test();
    return _connectionState;
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

void DatabaseApplication::connect(QString name, QString password)
{
    _requestNum = Request::CONNECT;

    _request.setUrl(QUrl(_address + "login/"+name+"/"+password));
    _manager.get(_request);
}

bool DatabaseApplication::connectParser(QNetworkReply *reply)
{
    bool result = false;
    if (reply->error())
    {
        result = false;
    }
    else
    {
        QString data = reply->readAll();
        QJsonDocument jsonResponse = QJsonDocument::fromJson(data.toUtf8());
        QJsonObject jsonObject = jsonResponse.object();

        if(data.size() > 5)
        {
            result = true;
        }
        else
        {
            result = false;
        }

    }
    return result;
}
