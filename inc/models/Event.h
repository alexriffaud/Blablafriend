#ifndef EVENT_H
#define EVENT_H

#include <QObject>
#include <QDate>

class Event
{
public:
    Event();
    Event(int id, QString name, QDate date, QString description, QString localization);

    int ID() const;
    void setID(int ID);

    QString name() const;
    void setName(const QString &name);

    QDate date() const;
    void setDate(const QDate &date);

    QString description() const;
    void setDescription(const QString &description);

    QString localization() const;
    void setLocalization(const QString &localization);

private:
    int     _ID;
    QString _name;
    QDate   _date;
    QString _description;
    QString _localization;
};

#endif // EVENT_H
