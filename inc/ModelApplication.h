#ifndef MODELAPPLICATION_H
#define MODELAPPLICATION_H

#include <QList>
#include <QObject>

#include "User.h"
#include "Event.h"
#include "EventList.h"
#include "UserList.h"

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

    Q_INVOKABLE UserList *userList();

private:
    EventList           _allEvents;
    EventList           _userEvents;
    UserList            _userList;
    User                _currentUser;
    QList<User>         _users;

};

#endif // MODELAPPLICATION_H
