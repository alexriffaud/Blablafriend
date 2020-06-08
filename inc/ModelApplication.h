#ifndef MODELAPPLICATION_H
#define MODELAPPLICATION_H

#include <QList>

#include "User.h"
#include "Event.h"

class ModelApplication
{
public:
    ModelApplication();

    QList<Event> *events();
    void setEvents(const QList<Event> &events);

    User *currentUser();
    void setCurrentUser(const User &currentUser);

    QList<User> *users();
    void setUsers(const QList<User> &users);

private:
    QList<Event>   _events;
    User           _currentUser;
    QList<User>    _users;
};

#endif // MODELAPPLICATION_H
