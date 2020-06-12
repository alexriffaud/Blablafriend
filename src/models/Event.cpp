#include "Event.h"

Event::Event()
{

}

Event::Event(int id, QString name, QDate date, QString description, QString localization)
{
    _ID = id;
    _name = name;
    _date = date;
    _localization = localization;
    _description = description;
}

int Event::ID() const
{
    return _ID;
}

void Event::setID(int ID)
{
    _ID = ID;
}

QString Event::name() const
{
    return _name;
}

void Event::setName(const QString &name)
{
    _name = name;
}

QDate Event::date() const
{
    return _date;
}

void Event::setDate(const QDate &date)
{
    _date = date;
}

QString Event::description() const
{
    return _description;
}

void Event::setDescription(const QString &description)
{
    _description = description;
}

QString Event::localization() const
{
    return _localization;
}

void Event::setLocalization(const QString &localization)
{
    _localization = localization;
}
