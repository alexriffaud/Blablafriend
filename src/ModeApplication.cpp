#include "ModelApplication.h"

ModelApplication::ModelApplication() :
    _allEvents(),
    _userEvents(),
    _userList(),
    _currentUser(),
    _users()
{

}

ModelApplication::~ModelApplication()
{

}

EventList *ModelApplication::events()
{
    return &_allEvents;
}

User *ModelApplication::currentUser()
{
    return &_currentUser;
}

QList<User> *ModelApplication::users()
{
    return &_users;
}

EventList *ModelApplication::userEvents()
{
    return &_userEvents;
}

UserList *ModelApplication::userList()
{
    return &_userList;
}
