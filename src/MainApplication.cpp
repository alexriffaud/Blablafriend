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
        QDate dateR = QDate(birthday.split("-")[2].toInt(),birthday.split("-")[1].toInt(),birthday.split("-")[0].toInt());

        QJsonObject user;
        user["login"] = login;
        user["firstname"] = firstname;
        user["lastname"] = lastname;
        user["email"] = email;
        user["city"] = city;
        user["birthday"] = dateR.toString("yyyy-MM-dd");
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

bool MainApplication::makeEventData(QString name, QString description, QString date, QString localization, QString hour)
{
    qDebug() << "MainApplication::makeEventData";

    QDate dateR = QDate(date.split("-")[2].toInt(),date.split("-")[1].toInt(),date.split("-")[0].toInt());
    QJsonObject event;
    event["name"] = name;
    event["description"] = description;
    event["date"] = dateR.toString("yyyy-MM-dd");
    event["localization"] = localization;
    event["idUser"] = _modelApplication.currentUser()->ID();
    event["hour"] = hour;



    QJsonDocument doc(event);
    QByteArray bytes = doc.toJson();

    _databaseApplication.postEventRequest(bytes);

    return true;

}

bool MainApplication::editEventData(QString name, QString description, QString date, QString localization, int id, QString hour)
{
    qDebug() << "MainApplication::makeEventData";

    QJsonObject event;
    event["name"] = name;
    event["description"] = description;
    event["date"] = date;
    event["localization"] = localization;
    event["idUser"] = _modelApplication.currentUser()->ID();
    event["hour"] = hour;


    Event *eventEdit = (Event *)_modelApplication.userEvents()->findObject(id);

    QString dateString = date.split("T")[0];
    QDate dateR = QDate(dateString.split("-")[2].toInt(),dateString.split("-")[1].toInt(),dateString.split("-")[0].toInt());
    eventEdit->setDate(dateR);
    eventEdit->setName(name);
    eventEdit->setLocalization(localization);
    eventEdit->setDescription(description);
    eventEdit->setHour(hour);

    _modelApplication.userEvents()->updateEventItem(eventEdit);

    QJsonDocument doc(event);
    QByteArray bytes = doc.toJson();

    _databaseApplication.putEventRequest(bytes, id);

    return true;

}


bool MainApplication::makeUserUpdateData(QString login, QString lastname, QString firstname, QString city, QString description)
{
    qDebug() << "MainApplication::makeUserUpdateData";

    QJsonObject user;
    user["login"] = login;
    user["firstname"] = firstname;
    user["lastname"] = lastname;
    user["city"] = city;
    user["description"] = description;

    _modelApplication.currentUser()->setLogin(login);
    _modelApplication.currentUser()->setLastname(lastname);
    _modelApplication.currentUser()->setFirstname(firstname);
    _modelApplication.currentUser()->setCity(city);
    _modelApplication.currentUser()->setDescription(description);

    QJsonDocument doc(user);
    QByteArray bytes = doc.toJson();

    _databaseApplication.putUserRequest(bytes, _modelApplication.currentUser()->ID());

    return true;
}
