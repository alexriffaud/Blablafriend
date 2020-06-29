import QtQuick 2.4
import QtQuick.Dialogs 1.2

MyEventsViewForm {
     anchors.fill: parent

    Item {
        id: item
        anchors.fill: parent

        property alias circleButton: circleButton
        property alias listView: listView

        Rectangle {
            id: rectangle
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#36388d"
                }

                GradientStop {
                    position: 0.997
                    color: "#357ca4"
                }

                GradientStop {
                    position: 1
                    color: "#357ca4"
                }
            }
            anchors.fill: parent
        }

        ListView {
            id: listView
            anchors.topMargin: 50
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            spacing: 5

            model: modelUserEvents
            delegate: Rectangle {
                height: 130
                width: parent.width
                color: "transparent"
                border.width: 2
                border.color: "white"
                Column {
                    Text {
                        text: " "
                        x: 10
                    }
                    Text {
                        text: '<b>Name:</b> ' + model.item.name
                        color: "white"
                        x: 10
                    }
                    Text {
                        text: '<b>Date:</b> ' + model.item.date
                        color: "white"
                        x: 10
                    }
                    Text {
                        text: '<b>Heure:</b> ' + model.item.hour
                        color: "white"
                        x: 10
                    }
                    Text {
                        text: '<b>Description:</b> ' + model.item.description
                        color: "white"
                        x: 10
                    }
                    Text {
                        text: '<b>Créateur:</b> ' + model.item.author
                        color: "white"
                        x: 10
                    }
                }

                MouseArea {
                    id: mousearea1
                    anchors.fill: parent

                    onClicked: {
                        editEvent.element.text = "Modifier un évènement"
                        editEvent.visible = true

                        editEvent.idStock.text = model.item.id
                        editEvent.lineEdit.textInput.text = model.item.name
                        editEvent.lineEdit1.textInput.text = model.item.description
                        editEvent.lineEdit2.textInput.text = model.item.localization
                        editEvent.lineEdit3.textInput.text = model.item.date.split('T')[0]
                        editEvent.lineEdit4.textInput.text = model.item.hour

                    }

                    onPressAndHold: {
                        messageDialogQuit.open()
                    }
                }

                MessageDialog {
                    id: messageDialogQuit
                    title: "Suppresion"
                    text: "Voulez-vous supprimer l'évènement " + model.item.name

                    standardButtons: StandardButton.Ok | StandardButton.Cancel
                    onAccepted: {
                        console.log("delete")
                        databaseApp.deleteEvent(model.item.id)
                    }
                    onRejected: {
                        messageDialogQuit.close()
                    }
                }
            }
        }



        CircleButton {
            id: circleButton
            x: 342
            y: 342
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            anchors.right: parent.right
            anchors.rightMargin: 8

            area.onClicked:
            {
                addEvent.visible = true
                addEvent.element.text = "Ajouter un évènement"
                addEvent.focus = true

                addEvent.lineEdit.textInput.text = ""
                addEvent.lineEdit1.textInput.text = ""
                addEvent.lineEdit2.textInput.text = ""
                addEvent.lineEdit3.textInput.text = ""
                addEvent.lineEdit4.textInput.text = ""
            }
        }
    }

    AddEditEvent
    {
        id: addEvent
        anchors.centerIn: parent
        visible: false

        lineEdit.textInput.text : " "
        lineEdit1.textInput.text : " "
        lineEdit2.textInput.text : " "
        lineEdit3.textInput.text : " "
        lineEdit4.textInput.text : " "

        buttonBBF1.mouseArea.onClicked:
        {
            addEvent.visible = false;

        }

        buttonBBF.mouseArea.onClicked:
        {
            mainApp.makeEventData(lineEdit.textInput.text, lineEdit1.textInput.text, lineEdit3.textInput.text, lineEdit2.textInput.text, lineEdit4.textInput.text)
            addEvent.visible = false;
        }
    }

    AddEditEvent
    {
        id: editEvent
        anchors.centerIn: parent
        visible: false

        lineEdit.textInput.text : " "
        lineEdit1.textInput.text : " "
        lineEdit2.textInput.text : " "
        lineEdit3.textInput.text : " "
        lineEdit4.textInput.text : " "

        buttonBBF1.mouseArea.onClicked:
        {
            editEvent.visible = false;

        }

        buttonBBF.mouseArea.onClicked:
        {
            mainApp.editEventData(lineEdit.textInput.text, lineEdit1.textInput.text, lineEdit3.textInput.text, lineEdit2.textInput.text, parseInt(idStock.text), lineEdit4.textInput.text)
            editEvent.visible = false;
        }
    }
}
