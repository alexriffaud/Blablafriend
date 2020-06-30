#ifndef USERLIST_H
#define USERLIST_H

#include <QAbstractListModel>
#include <QVector>

#include "User.h"

class UserList : public QAbstractListModel
{
    Q_OBJECT
public:
    int rowCount(const QModelIndex&) const override;
    QVariant data(const QModelIndex& index, int role) const override;

    QObject * findObject(int id);

    QVector<QObject *> *items();

public slots:
    void insert(QObject* item);
    void remove(QObject* item);
    void updateEventItem(Event *event);
    void clear();
    int size();
    QObject * at(int index);


protected:
    QHash<int, QByteArray> roleNames() const override;

private:
    QVector<QObject*> _items;
};

#endif // USERLIST_H
