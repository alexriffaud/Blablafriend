#include "ModelApplication.h"

ModelApplication::ModelApplication() :
    _events(),
    _currentUser(),
    _users()
{

}

ModelApplication::~ModelApplication()
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

QList<User> *ModelApplication::users()
{
    return &_users;
}
