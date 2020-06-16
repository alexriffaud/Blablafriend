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

        buttonBBF1.mouseArea.onClicked:
        {
            addEditEvent.visible = false;
        }

        buttonBBF.mouseArea.onClicked:
        {
            mainApp.makeEventData(lineEdit.textInput.text, lineEdit1.textInput.text, lineEdit3.textInput.text, lineEdit2.textInput.text)
            addEditEvent.visible = false;
        }
    }
}
