#include "UserDAO.h"

UserDAO::UserDAO(QNetworkAccessManager *manager, QNetworkRequest *request)
{
    _manager = manager;
    _request = request;
}



void UserDAO::setAddress(const QString &address)
{
    _address = address;
}
