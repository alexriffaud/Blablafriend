import QtQuick 2.4
import QtQuick.Dialogs 1.2

EventsViewForm {
    id: eventsView
    anchors.fill: parent
    Item {
        id: item
        width: 400
        height: 400
        anchors.fill: parent
        property alias listView: listView
        clip: true

        Rectangle {
            clip: true
            id: rectangle
            anchors.topMargin: 0
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
            clip: true

            model: modelEvents
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
                        item.visible = false
                        eventView.visible = true
                        eventView.name.text = model.item.name
                        eventView.localization.text = model.item.localization
                        eventView.date.text = model.item.date
                        eventView.hour.text = model.item.hour
                        eventView.author.text = model.item.author
                        eventView.description.text = model.item.description
                        eventView.idevent.text = model.item.id

                        databaseApp.getEventParticipate(model.item.id)
                        eventView.checkAuth()
                    }
                }
            }
        }
    }
    EventView {
        clip: true
        id: eventView
        anchors.fill: parent
        visible: false

        buttonBBF.textButton.text: "Participer"
        buttonBBF1.textButton.text: "Retour"
        buttonBBF1.mouseArea.onClicked: {
            eventsView.visible = true
            eventView.visible = false
        }



        function checkAuth()
        {
            if(mainApp.checkAuthor())
            {
                buttonBBF.rectangle.color = "grey"
                buttonBBF.mouseArea.visible = false
            }
            else
            {
                buttonBBF.textButton.text = "Participer"
                buttonBBF.rectangle.color = "#063d5b"
                buttonBBF.mouseArea.visible = true
            }
        }

        MessageDialog {
            id: messageDialogConfirmation
            title: "Confirmation"
            text: "Vous allez participer à l'évènement " + eventView.name.text

            standardButtons: StandardButton.Ok
            onAccepted: {
                messageDialogConfirmation.close()
            }
        }
    }
}
    /*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
