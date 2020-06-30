#include "User.h"

User::User()
{

}

User::User(QString login)
{
    _login = login;
}

User::~User()
{

}

int User::ID() const
{
    return _ID;
}

void User::setID(int ID)
{
    _ID = ID;
}

QString User::login()
{
    return _login;
}

void User::setLogin(const QString &login)
{
    _login = login;
}

QString User::email() const
{
    return _email;
}

QString User::lastname() const
{
    return _lastname;
}

void User::setLastname(const QString &lastname)
{
    _lastname = lastname;
}

QString User::firstname() const
{
    return _firstname;
}

void User::setFirstname(const QString &firstname)
{
    _firstname = firstname;
}

QString User::description() const
{
    return _description;
}

void User::setDescription(const QString &description)
{
    _description = description;
}

QString User::city() const
{
    return _city;
}

void User::setCity(const QString &city)
{
    _city = city;
}

QString User::localization() const
{
    return _localization;
}

void User::setLocalization(const QString &localization)
{
    _localization = localization;
}

int User::isLogged() const
{
    return _isLogged;
}

void User::setIsLogged(int isLogged)
{
    _isLogged = isLogged;
}

QString User::birthday() const
{
    return _birthday.toString("dd/MM/yyyy");
}

void User::setBirthday(const QDate &birthday)
{
    _birthday = birthday;
}

void User::setEmail(const QString &email)
{
    _email = email;
}

QString User::fullName()
{
    return _lastname.toUpper() + " " + _firstname;
}
