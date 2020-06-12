#include "ModelApplication.h"

ModelApplication::ModelApplication() :
    _allEvents(),
    _currentUser(),
    _users()
{

}

ModelApplication::~ModelApplication()
{

}

QList<Event> *ModelApplication::events()
{
    return& _allEvents;
}

void ModelApplication::setEvents(const QList<Event> &events)
{
    _allEvents = events;
}

User *ModelApplication::currentUser()
{
    return &_currentUser;
}

QList<User> *ModelApplication::users()
{
    return &_users;
}
