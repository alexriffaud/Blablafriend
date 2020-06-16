#ifndef USER_H
#define USER_H

#include <QString>
#include <QDate>
#include <QObject>
#include <QList>

#include "Event.h"

class User : public QObject
{
    Q_OBJECT
public:
    User();
    ~User();

    int ID() const;
    void setID(int ID);

    Q_INVOKABLE QString login();
    void setLogin(const QString &login);

    Q_INVOKABLE QString email() const;
    void setEmail(const QString &email);

    Q_INVOKABLE QString lastname() const;
    void setLastname(const QString &lastname);

    Q_INVOKABLE QString firstname() const;
    void setFirstname(const QString &firstname);

    Q_INVOKABLE QString description() const;
    void setDescription(const QString &description);

    Q_INVOKABLE QString city() const;
    void setCity(const QString &city);

    QString localization() const;
    void setLocalization(const QString &localization);

    int isLogged() const;
    void setIsLogged(int isLogged);

    Q_INVOKABLE QString birthday() const;
    void setBirthday(const QDate &birthday);

    Q_INVOKABLE QString fullName();

private:
    int     _ID;
    QString _login;
    QString _email;
    QString _firstname;
    QString _lastname;
    QString _description;
    QString _city;
    QString _localization;
    int     _isLogged;
    QDate   _birthday;
};

#endif // USER_H
