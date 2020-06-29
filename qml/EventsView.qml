import QtQuick 2.4

EventsViewForm {
    anchors.fill: parent
    Item {
        id: item
        width: 400
        height: 400
        anchors.fill: parent
        property alias listView: listView

        Rectangle {
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
                        visible: true

                    }
                }

                EventView {
                    id: eventView
                    visible: false
                }
            }
        }
    }
}
    /*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
