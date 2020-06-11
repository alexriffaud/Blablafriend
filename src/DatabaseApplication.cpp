#include "DatabaseApplication.h"

DatabaseApplication::DatabaseApplication(ModelApplication *modelApplication)
{
    _modelApplication = modelApplication;
    _address = "http://localhost:3000/";
    _connectionState = false;
    _isConnected = false;
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
        case Request::CREATEUSER:
        {
            qDebug() << "Request::CREATEUSER";

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
    qDebug() << "DatabaseApplication::postRequest";

    _requestNum = Request::CREATEUSER;

    QUrl url(_address + "user");
    QNetworkRequest request(url);

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    QObject::connect(manager, SIGNAL(finished(QNetworkReply*)),
                     this, SLOT(onResult(QNetworkReply*)));

    // FIXME for debug
    qDebug() << "Sync" << QString::fromUtf8(postData.data(), postData.size());

    manager->post(request, postData);
}

bool DatabaseApplication::isConnected() const
{
    return _isConnected;
}

bool DatabaseApplication::isDBConnected()
{
    test();
    return _connectionState;
}

void DatabaseApplication::test()
{
    _requestNum = Request::TEST;

    QNetworkAccessManager * mgr = new QNetworkAccessManager(this);

    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),this,SLOT(onResult(QNetworkReply*)));
    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),mgr,SLOT(deleteLater()));

    _request.setUrl(QUrl(_address + "test"));
    mgr->get(_request);
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

    QNetworkAccessManager * mgr = new QNetworkAccessManager(this);

    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),this,SLOT(onResult(QNetworkReply*)));
    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),mgr,SLOT(deleteLater()));

    _request.setUrl(QUrl(_address + "login/"+name+"/"+password));
    mgr->get(_request);
}

bool DatabaseApplication::connectParser(QNetworkReply *reply)
{
    QString data = reply->readAll();
    qDebug() << data;

    bool result = false;
    if (reply->error() || data.size() < 5)
    {
        result = false;
    }
    else
    {
        data.replace("[", "");
        data.replace("]", "");
        data.replace("{", "");
        data.replace("}", "");
        data.replace(':', "");
        data.replace(",", "");
        data.replace('"', "/");
        data.replace("//", "/");

        data.remove(0,1);

        QStringList dataSplitted = data.split("/");

        _modelApplication->currentUser()->setID(dataSplitted[1].toInt());
        _modelApplication->currentUser()->setLogin(dataSplitted[3]);
        _modelApplication->currentUser()->setEmail(dataSplitted[9]);
        _modelApplication->currentUser()->setLastname(dataSplitted[7]);
        _modelApplication->currentUser()->setFirstname(dataSplitted[5]);

        QString birthday = dataSplitted[13].split("T")[0];
        _modelApplication->currentUser()->setBirthday(QDate(birthday.split("-")[0].toInt(),birthday.split("-")[1].toInt(),birthday.split("-")[2].toInt()));
        _modelApplication->currentUser()->setCity(dataSplitted[11]);
        _modelApplication->currentUser()->setDescription(dataSplitted[19]);

        result = true;
    }
    return result;
}
