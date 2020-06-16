#ifndef MODELAPPLICATION_H
#define MODELAPPLICATION_H

#include <QList>
#include <QObject>

#include "User.h"
#include "Event.h"
#include "EventList.h"

class ModelApplication : public QObject
{
    Q_OBJECT
public:
    ModelApplication();
    ~ModelApplication();

    Q_INVOKABLE EventList *events();

    Q_INVOKABLE User *currentUser();

    QList<User> *users();

    Q_INVOKABLE EventList *userEvents();

private:
    EventList           _allEvents;
    EventList           _userEvents;
    User                _currentUser;
    QList<User>         _users;
};

#endif // MODELAPPLICATION_H
