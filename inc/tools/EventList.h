#ifndef EVENTLISTE_H
#define EVENTLISTE_H

#include <QAbstractListModel>
#include <QVector>

#include "Event.h"

class EventList : public QAbstractListModel
{
    Q_OBJECT
public:
    int rowCount(const QModelIndex&) const override;
    QVariant data(const QModelIndex& index, int role) const override;

    QObject * findObject(int id);

public slots:
    void insert(QObject* item);
    void remove(QObject* item);
    void updateEventItem(Event *event);

protected:
    QHash<int, QByteArray> roleNames() const override;

private:
    QVector<QObject*> _items;
};

#endif // EVENTLISTE_H
