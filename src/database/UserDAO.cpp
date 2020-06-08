#include "UserDAO.h"

UserDAO::UserDAO(QNetworkAccessManager *manager, QNetworkRequest *request, QString &address)
{
    _manager = manager;
    _request = request;
    _address = address;
}

void UserDAO::connect(QString &name, QString &password)
{
    _request->setUrl(QUrl(_address + "login/"+name+"/"+password));
    _manager->get(*_request);
}
