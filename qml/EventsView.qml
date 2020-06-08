import QtQuick 2.4

EventsViewForm {

    circleButton.area.onClicked:
    {
        addEditEvent.visible = true
        addEditEvent.element.text = "Ajouter un évènement"
    }

    AddEditEvent
    {
        id: addEditEvent
        anchors.centerIn: parent
        visible: false
    }
}
