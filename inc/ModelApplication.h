#ifndef MODELAPPLICATION_H
#define MODELAPPLICATION_H

#include <QList>
#include <QObject>

#include "User.h"
#include "Event.h"

class ModelApplication
{
public:
    ModelApplication();
    ~ModelApplication();

    QList<Event> *events();
    void setEvents(const QList<Event> &events);

    Q_INVOKABLE User *currentUser();

    QList<User> *users();

private:
    QList<Event>   _allEvents;
    User           _currentUser;
    QList<User>    _users;
};

#endif // MODELAPPLICATION_H
