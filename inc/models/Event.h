#ifndef EVENT_H
#define EVENT_H

#include <QObject>
#include <QDate>

class Event : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int id MEMBER _ID)
    Q_PROPERTY(QString name MEMBER _name)
    Q_PROPERTY(QString date MEMBER _date)
    Q_PROPERTY(QString description MEMBER _description)
    Q_PROPERTY(QString localization MEMBER _localization)
    Q_PROPERTY(QString author MEMBER _author)
    Q_PROPERTY(QString hour MEMBER _hour)

public:
    Event();
    Event(int id, QString name, QDate date, QString description, QString localization, QString author, QString hour);
    Event(QString name, QDate date, QString description, QString localization, QString author, QString hour);

    ~Event();

    int ID() const;
    void setID(int ID);

    QString name() const;
    void setName(const QString &name);

    QString date() const;
    void setDate(const QDate &date);

    QString description() const;
    void setDescription(const QString &description);

    QString localization() const;
    void setLocalization(const QString &localization);

    QString author() const;
    void setAuthor(const QString &author);

    QString hour() const;
    void setHour(const QString &hour);

private:
    int     _ID;
    QString _name;
    QString   _date;
    QString _description;
    QString _localization;
    QString _author;
    QString _hour;
};

Q_DECLARE_METATYPE(Event *)

#endif // EVENT_H
