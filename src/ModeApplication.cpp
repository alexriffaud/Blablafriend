#include "ModelApplication.h"

ModelApplication::ModelApplication()
{

}

QList<Event> *ModelApplication::events()
{
    return& _events;
}

void ModelApplication::setEvents(const QList<Event> &events)
{
    _events = events;
}

User *ModelApplication::currentUser()
{
    return &_currentUser;
}

void ModelApplication::setCurrentUser(const User &currentUser)
{
    _currentUser = currentUser;
}

QList<User> *ModelApplication::users()
{
    return &_users;
}

void ModelApplication::setUsers(const QList<User> &users)
{
    _users = users;
}
