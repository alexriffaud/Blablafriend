#include "MainApplication.h"

MainApplication::MainApplication(QQmlApplicationEngine *engine) :
    _modelApplication(),
    _databaseApplication(&_modelApplication)
{
    _engine = engine;
    _databaseApplication.getAllEvents();
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

User *MainApplication::getCurrentUser()
{
    return _modelApplication.currentUser();
}

ModelApplication *MainApplication::getModelApplication()
{
    return &_modelApplication;
}

bool MainApplication::makeUserData(QString email, QString login, QString lastname, QString firstname, QString birthday, QString city, QString password1, QString password2, QString description)
{
    qDebug() << "MainApplication::makeData";

    if(password1 != password2)
    {
        return false;
    }
    else
    {
        QJsonObject user;
        user["login"] = login;
        user["firstname"] = firstname;
        user["lastname"] = lastname;
        user["email"] = email;
        user["city"] = city;
        user["birthday"] = birthday;
        user["password"] = password1;
        user["localization"] = QString("");
        user["description"] = description;
        user["islogged"] = 0;

        _databaseApplication.connect(login, password1);

        QJsonDocument doc(user);
        QByteArray bytes = doc.toJson();

        _databaseApplication.postUserRequest(bytes);

        return true;
    }
}

bool MainApplication::makeEventData(QString name, QString description, QString date, QString localization)
{
    qDebug() << "MainApplication::makeEventData";

    QJsonObject event;
    event["name"] = name;
    event["description"] = description;
    event["date"] = date;
    event["localization"] = localization;
    event["idUser"] = _modelApplication.currentUser()->ID();

    QJsonDocument doc(event);
    QByteArray bytes = doc.toJson();

    _databaseApplication.postEventRequest(bytes);

    return true;

}

bool MainApplication::editEventData(QString name, QString description, QString date, QString localization, int id)
{
    qDebug() << "MainApplication::makeEventData";

    QJsonObject event;
    event["name"] = name;
    event["description"] = description;
    event["date"] = date;
    event["localization"] = localization;
    event["idUser"] = _modelApplication.currentUser()->ID();


    Event *eventEdit = (Event *)_modelApplication.userEvents()->findObject(id);

    QString dateString = date.split("T")[0];
    QDate dateR = QDate(dateString.split("-")[0].toInt(),dateString.split("-")[1].toInt(),dateString.split("-")[2].toInt());
    eventEdit->setDate(dateR);
    eventEdit->setName(name);
    eventEdit->setLocalization(localization);
    eventEdit->setDescription(description);

    _modelApplication.userEvents()->updateEventItem(eventEdit);

    QJsonDocument doc(event);
    QByteArray bytes = doc.toJson();

    _databaseApplication.putEventRequest(bytes, id);

    return true;

}
