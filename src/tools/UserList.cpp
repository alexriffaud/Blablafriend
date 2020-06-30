#include "inc/tools/UserList.h"

int UserList::rowCount(const QModelIndex&) const
{
    return _items.size();
}

QVariant UserList::data(const QModelIndex& index, int /*role*/) const
{
    QObject* item = _items.at(index.row());
    return QVariant::fromValue(item);
}

void UserList::insert(QObject* item)
{
    beginInsertRows(QModelIndex(), 0, 0);
    _items.push_front(item);
    endInsertRows();
}

void UserList::remove(QObject* item)
{
    for (int i = 0; i < _items.size(); ++i)
    {
        if (_items.at(i) == item)
        {
            beginRemoveRows(QModelIndex(), i, i);
            _items.remove(i);
            endRemoveRows();
            break;
        }
    }
}

QHash<int, QByteArray> UserList::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Qt::UserRole + 1] = "item";
    return roles;
}

QVector<QObject *> *UserList::items()
{
    return &_items;
}

void UserList::updateEventItem(Event* event)
{
    int i = 0;
    for (i = 0; i < _items.size(); ++i)
    {
        Event *event2 = (Event *)_items.at(i);
        if (event2->ID() == event->ID())
        {
            _items[i] = event;
            dataChanged(index(i), index(i));
            break;
        }
    }
}

QObject *UserList::findObject(int id)
{
    QObject *object = nullptr;
    for (int i = 0; i < _items.size(); ++i)
    {
        Event *event = (Event *)_items.at(i);
        if (event->ID() == id)
        {
            object = _items.at(i);
        }
    }
    return object;
}

void UserList::clear()
{
    for (int i = 0; i < _items.size(); i++)
    {
        beginRemoveRows(QModelIndex(), i, i);
        _items.remove(i);
        endRemoveRows();
    }
}

int UserList::size()
{
    int s = 0;
    for (int i = 0; i < _items.size(); i++)
    {
        s++;
    }
    return s;
}

QObject * UserList::at(int index)
{
    QObject *object = nullptr;
    for (int i = 0; i < _items.size(); i++)
    {
        if(index == i)
        {
            object = _items.at(i);
        }
    }
    return object;
}
