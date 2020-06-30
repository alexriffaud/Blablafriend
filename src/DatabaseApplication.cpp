#include "DatabaseApplication.h"

DatabaseApplication::DatabaseApplication(ModelApplication *modelApplication)
{
    _modelApplication = modelApplication;
    _address = "http://env-4709756.hidora.com/";
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
            getUserEvents();
            emit changeLoginState();
            break;
        }
        case Request::CREATEUSER:
        {
            qDebug() << "Request::CREATEUSER";

            break;
        }
        case Request::ALLEVENTS:
        {
            qDebug() << "Request::ALLEVENTS";
            parseAllEvents(reply);
            break;
        }
        case Request::USEREVENTS:
        {
            qDebug() << "Request::USEREVENTS";
            parseUserEvents(reply);
            break;
        }
        case Request::CREATEEVENT:
        {
            qDebug() << "Request::CREATEEVENT";
            parseEvent(reply);
            break;
        }
        case Request::EVENT:
        {
            qDebug() << "Request::EVENT";
            parseEvent(reply);
            break;
        }
        case Request::UPDATEUSER:
        {
            qDebug() << "Request::UPDATEUSER";
            parseEvent(reply);
            break;
        }
        case Request::EVENTPARTICIPATE:
        {
            qDebug() << "Request::EVENTPARTICIPATE";
            parseParticipateEvent(reply);
            break;
        }
        case Request::ADDEVENTPARTICIPATE:
        {
            qDebug() << "Request::ADDEVENTPARTICIPATE";

            break;
        }
        default:
        {
            break;
        }
    }

    return result;
}


void DatabaseApplication::postUserRequest(QByteArray & postData)
{
    qDebug() << "DatabaseApplication::postUserRequest";

    _requestNum = Request::CREATEUSER;

    QUrl url(_address + "user");
    QNetworkRequest request(url);

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    QObject::connect(manager, SIGNAL(finished(QNetworkReply*)),
                     this, SLOT(onResult(QNetworkReply*)));

    manager->post(request, postData);
}

void DatabaseApplication::postParticipateRequest(QByteArray & postData, int idEvent, int idUser)
{
    qDebug() << "DatabaseApplication::postParticipateRequest";

    _requestNum = Request::ADDEVENTPARTICIPATE;

    QUrl url(_address + "participate/"+QString::number(idUser) +"/"+ QString::number(idEvent));
    QNetworkRequest request(url);

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    QObject::connect(manager, SIGNAL(finished(QNetworkReply*)),
                     this, SLOT(onResult(QNetworkReply*)));

    manager->post(request, postData);
}


void DatabaseApplication::postEventRequest(QByteArray & postData)
{
    qDebug() << "DatabaseApplication::postEventRequest";

    _requestNum = Request::CREATEEVENT;

    QUrl url(_address + "addevent");
    QNetworkRequest request(url);

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    QObject::connect(manager, SIGNAL(finished(QNetworkReply*)),
                     this, SLOT(onResult(QNetworkReply*)));

    manager->post(request, postData);
}

void DatabaseApplication::putEventRequest(QByteArray & postData, int id)
{
    qDebug() << "DatabaseApplication::putEventRequest";

    _requestNum = Request::CREATEEVENT;

    QUrl url(_address + "eventEdit/"+QString::number(id));
    QNetworkRequest request(url);

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    QObject::connect(manager, SIGNAL(finished(QNetworkReply*)),
                     this, SLOT(onResult(QNetworkReply*)));

    manager->put(request, postData);
}

void DatabaseApplication::putUserRequest(QByteArray & postData, int id)
{
    qDebug() << "DatabaseApplication::putUserRequest";

    _requestNum = Request::UPDATEUSER;

    QUrl url(_address + "user/"+QString::number(id));
    QNetworkRequest request(url);

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    QObject::connect(manager, SIGNAL(finished(QNetworkReply*)),
                     this, SLOT(onResult(QNetworkReply*)));

    manager->put(request, postData);
}

void DatabaseApplication::getAllEvents()
{
    qDebug() << "DatabaseApplication::getAllEvents";

    _requestNum = Request::ALLEVENTS;

    QNetworkAccessManager * mgr = new QNetworkAccessManager(this);

    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),this,SLOT(onResult(QNetworkReply*)));
    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),mgr,SLOT(deleteLater()));

    _request.setUrl(QUrl(_address + "Allevents"));
    mgr->get(_request);
}

void DatabaseApplication::getEventParticipate(int id)
{
    qDebug() << "DatabaseApplication::getEventParticipate";

    _requestNum = Request::EVENTPARTICIPATE;

    QNetworkAccessManager * mgr = new QNetworkAccessManager(this);

    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),this,SLOT(onResult(QNetworkReply*)));
    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),mgr,SLOT(deleteLater()));

    _request.setUrl(QUrl(_address + "participate/"+QString::number(id)));
    mgr->get(_request);
}

bool DatabaseApplication::parseParticipateEvent(QNetworkReply *reply)
{
    qDebug() << "DatabaseApplication::parseParticipateEvent";

    QString data = reply->readAll();

    QJsonDocument jsonDoc = QJsonDocument::fromJson(data.toUtf8());
    QJsonArray jsonArray = jsonDoc.array();

    _modelApplication->userList()->clear();

    foreach (const QJsonValue & value, jsonArray)
    {
        QJsonObject obj = value.toObject();

        _modelApplication->userList()->insert(new User(obj["login"].toString()));
    }
    return true;
}

void DatabaseApplication::deleteEvent(int id)
{
    qDebug() << "DatabaseApplication::deleteEvent";

    _requestNum = Request::DELETEEVENT;

    QNetworkAccessManager * mgr = new QNetworkAccessManager(this);


    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),this,SLOT(onResult(QNetworkReply*)));
    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),mgr,SLOT(deleteLater()));

    _request.setUrl(QUrl(_address + "event/"+QString::number(id)));
    mgr->deleteResource(_request);

    _modelApplication->userEvents()->remove(_modelApplication->userEvents()->findObject(id));
}


void DatabaseApplication::getEvent(QString name, int idUser, QString description)
{
    qDebug() << "DatabaseApplication::getEvent";

    _requestNum = Request::EVENT;

    QNetworkAccessManager * mgr = new QNetworkAccessManager(this);

    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),this,SLOT(onResult(QNetworkReply*)));
    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),mgr,SLOT(deleteLater()));

    _request.setUrl(QUrl(_address + QString::number(idUser)+"/"+name+"/"+description));
    mgr->get(_request);
}

void DatabaseApplication::getUserEvents()
{
    qDebug() << "DatabaseApplication::getUserEvents";

    _requestNum = Request::USEREVENTS;

    QNetworkAccessManager * mgr = new QNetworkAccessManager(this);

    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),this,SLOT(onResult(QNetworkReply*)));
    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),mgr,SLOT(deleteLater()));

    _request.setUrl(QUrl(_address + "events/"+ QString::number(_modelApplication->currentUser()->ID())));
    mgr->get(_request);
}


bool DatabaseApplication::parseAllEvents(QNetworkReply *reply)
{
    qDebug() << "DatabaseApplication::parseAllEvents";

    QString data = reply->readAll();

    bool result = false;
    if (reply->error() || data.size() < 5)
    {
        result = false;
    }
    else
    {
        QJsonDocument jsonDoc = QJsonDocument::fromJson(data.toUtf8());
        QJsonArray jsonArray = jsonDoc.array();

        foreach (const QJsonValue & value, jsonArray)
        {
            QJsonObject obj = value.toObject();

            QString dateString = obj["date"].toString().split("T")[0];
            QDate date = QDate(dateString.split("-")[0].toInt(),dateString.split("-")[1].toInt(),dateString.split("-")[2].toInt());

            _modelApplication->events()->insert(new Event(obj["id"].toInt(), obj["name"].toString(), date, obj["description"].toString(), obj["localization"].toString(), obj["login"].toString(), obj["hour"].toString()));
        }

        result = true;
    }
    return result;
}

bool DatabaseApplication::parseEvent(QNetworkReply *reply)
{
    qDebug() << "DatabaseApplication::parseEvent";

    QString data = reply->readAll();

    bool result = false;
    if (reply->error() || data.size() < 5)
    {
        result = false;
    }
    else
    {
        QJsonDocument jsonDoc = QJsonDocument::fromJson(data.toUtf8());
        QJsonArray jsonArray = jsonDoc.array();

        foreach (const QJsonValue & value, jsonArray)
        {
            QJsonObject obj = value.toObject();

            QString dateString = obj["date"].toString().split("T")[0];
            QDate date = QDate(dateString.split("-")[0].toInt(),dateString.split("-")[1].toInt(),dateString.split("-")[2].toInt());

            _modelApplication->events()->insert(new Event(obj["id"].toInt(), obj["name"].toString(), date, obj["description"].toString(), obj["localization"].toString(), obj["login"].toString(), obj["hour"].toString()));
            _modelApplication->userEvents()->insert(new Event(obj["id"].toInt(), obj["name"].toString(), date, obj["description"].toString(), obj["localization"].toString(), obj["login"].toString(), obj["hour"].toString()));

        }

        result = true;
    }
    return result;
}

bool DatabaseApplication::parseUserEvents(QNetworkReply *reply)
{
    qDebug() << "DatabaseApplication::parseUserEvents";

    QString data = reply->readAll();

    bool result = false;
    if (reply->error() || data.size() < 5)
    {
        result = false;
    }
    else
    {
        QJsonDocument jsonDoc = QJsonDocument::fromJson(data.toUtf8());
        QJsonArray jsonArray = jsonDoc.array();

        foreach (const QJsonValue & value, jsonArray)
        {
            QJsonObject obj = value.toObject();

            QString dateString = obj["date"].toString().split("T")[0];
            QDate date = QDate(dateString.split("-")[0].toInt(),dateString.split("-")[1].toInt(),dateString.split("-")[2].toInt());

            _modelApplication->userEvents()->insert(new Event(obj["id"].toInt(), obj["name"].toString(), date, obj["description"].toString(), obj["localization"].toString(), obj["login"].toString(), obj["hour"].toString()));
        }

        result = true;
    }
    return result;
}

bool DatabaseApplication::isConnected() const
{
    return _isConnected;
}

void DatabaseApplication::disconnect()
{
    qDebug() << "DatabaseApplication::disconnect";

    _requestNum = Request::DISCONNECT;

    QUrl url(_address + "disconnectuser/" + QString::number(_modelApplication->currentUser()->ID()));
    QNetworkRequest request(url);

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    QObject::connect(manager, SIGNAL(finished(QNetworkReply*)),
                     this, SLOT(onResult(QNetworkReply*)));

    QByteArray postData;

    manager->put(request, postData);
}

bool DatabaseApplication::isDBConnected()
{
    qDebug() << "DatabaseApplication::isDBConnected";

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
    qDebug() << "DatabaseApplication::testParser";

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
    qDebug() << "DatabaseApplication::connect";

    _requestNum = Request::CONNECT;

    QNetworkAccessManager * mgr = new QNetworkAccessManager(this);

    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),this,SLOT(onResult(QNetworkReply*)));
    QObject::connect(mgr,SIGNAL(finished(QNetworkReply*)),mgr,SLOT(deleteLater()));

    _request.setUrl(QUrl(_address + "login/"+name+"/"+password));
    mgr->get(_request);
}

bool DatabaseApplication::connectParser(QNetworkReply *reply)
{
    qDebug() << "DatabaseApplication::connectParser";

    QString data = reply->readAll();

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

        //getAllEvents();

        result = true;
    }
    return result;
}
