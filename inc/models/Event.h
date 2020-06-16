#ifndef EVENT_H
#define EVENT_H

#include <QObject>
#include <QDate>

class Event : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name MEMBER _name)
    Q_PROPERTY(QDate date MEMBER _date)
    Q_PROPERTY(QString description MEMBER _description)
    Q_PROPERTY(QString localization MEMBER _localization)
    Q_PROPERTY(QString author MEMBER _author)

public:
    Event();
    Event(int id, QString name, QDate date, QString description, QString localization, QString author);
    Event(QString name, QDate date, QString description, QString localization, QString author);

    ~Event();

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

    QString author() const;
    void setAuthor(const QString &author);

private:
    int     _ID;
    QString _name;
    QDate   _date;
    QString _description;
    QString _localization;
    QString _author;
};

Q_DECLARE_METATYPE(Event *)

#endif // EVENT_H
