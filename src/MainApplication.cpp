#include "MainApplication.h"

MainApplication::MainApplication(QQmlApplicationEngine *engine) :
    _modelApplication(),
    _databaseApplication(&_modelApplication)
{
    _engine = engine;
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

bool MainApplication::makeData(QString email, QString login, QString lastname, QString firstname, QString birthday, QString city, QString password1, QString password2, QString description)
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

        _modelApplication.currentUser()->setLogin(login);
        _modelApplication.currentUser()->setEmail(email);
        _modelApplication.currentUser()->setLastname(lastname);
        _modelApplication.currentUser()->setFirstname(firstname);
        _modelApplication.currentUser()->setBirthday(QDate(birthday.split("-")[0].toInt(),birthday.split("-")[1].toInt(),birthday.split("-")[2].toInt()));
        _modelApplication.currentUser()->setCity(city);
        _modelApplication.currentUser()->setDescription(description);

        QJsonDocument doc(user);
        QByteArray bytes = doc.toJson();

        _databaseApplication.postRequest(bytes);

        return true;
    }
}
