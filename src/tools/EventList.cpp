#include "inc/tools/EventList.h"

int EventList::rowCount(const QModelIndex&) const
{
    return _items.size();
}

QVariant EventList::data(const QModelIndex& index, int /*role*/) const
{
    QObject* item = _items.at(index.row());
    return QVariant::fromValue(item);
}

void EventList::insert(QObject* item)
{
    beginInsertRows(QModelIndex(), 0, 0);
    _items.push_front(item);
    endInsertRows();
}

void EventList::remove(QObject* item)
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

QHash<int, QByteArray> EventList::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Qt::UserRole + 1] = "item";
    return roles;
}

void EventList::updateEventItem(Event* event)
{
//    int id = event->ID();
//    auto iter = std::find_if(_items.begin(), _items.end(), [id](Event* item)
//    {
//            return item->ID() == id;
//    });

//    if(iter != _items.end())
//    {
//        int indx = _items.indexOf(*iter);
//        _items[indx] = event;
//        dataChanged(index(indx), index(indx));
//    }
}

QObject *EventList::findObject(int id)
{
    for (int i = 0; i < _items.size(); ++i)
    {
        Event *event = (Event *)_items.at(i);
        if (event->ID() == id)
        {
            return _items.at(i);
        }
    }
}
