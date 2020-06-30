import QtQuick 2.4

Item {
    id: element2
    property alias name: name
    width: 400
    height: 400
    property alias idevent: idevent
    property alias listView: listView
    property alias author: author
    property alias hour: hour
    property alias date: date
    property alias localization: localization
    property alias description: description
    property alias buttonBBF1: buttonBBF1
    property alias buttonBBF: buttonBBF

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

        ButtonBBF {
            id: buttonBBF
            y: 362
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 31
        }

        ButtonBBF {
            id: buttonBBF1
            x: 265
            y: 362
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            anchors.right: parent.right
            anchors.rightMargin: 35
        }

        Text {
            id: name
            color: "#ffffff"
            text: qsTr("Name")
            anchors.top: parent.top
            anchors.topMargin: 62
            anchors.left: parent.left
            anchors.leftMargin: 8
            font.pixelSize: 16
        }

        Text {
            id: element1
            color: "#ffffff"
            text: qsTr("Description :")
            anchors.top: parent.top
            anchors.topMargin: 212
            anchors.left: parent.left
            anchors.leftMargin: 8
            font.pixelSize: 12
        }

        Text {
            id: description
            height: 28
            color: "#ffffff"
            text: qsTr("Text")
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 232
            anchors.left: parent.left
            anchors.leftMargin: 8
            font.pixelSize: 12
        }

        Text {
            id: element3
            color: "#ffffff"
            text: qsTr("Lieu :")
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 104
            font.pixelSize: 12
        }

        Text {
            id: localization
            width: 23
            height: 14
            color: "#ffffff"
            text: qsTr("Text")
            anchors.top: parent.top
            anchors.topMargin: 104
            anchors.left: parent.left
            anchors.leftMargin: 70
            font.pixelSize: 12
        }

        Text {
            id: element5
            color: "#ffffff"
            text: qsTr("Date :")
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 132
            font.pixelSize: 12
        }

        Text {
            id: date
            color: "#ffffff"
            text: qsTr("Text")
            anchors.left: parent.left
            anchors.leftMargin: 70
            anchors.top: parent.top
            anchors.topMargin: 132
            font.pixelSize: 12
        }

        Text {
            id: element7
            color: "#ffffff"
            text: qsTr("Heure :")
            anchors.top: parent.top
            anchors.topMargin: 157
            anchors.left: parent.left
            anchors.leftMargin: 8
            font.pixelSize: 12
        }

        Text {
            id: hour
            color: "#ffffff"
            text: qsTr("Text")
            anchors.left: parent.left
            anchors.leftMargin: 70
            anchors.top: parent.top
            anchors.topMargin: 157
            font.pixelSize: 12
        }

        Text {
            id: author
            color: "#ffffff"
            text: qsTr("Text")
            anchors.left: parent.left
            anchors.leftMargin: 70
            anchors.top: parent.top
            anchors.topMargin: 182
            font.pixelSize: 12
        }

        ListView {
            id: listView
            anchors.top: parent.top
            anchors.topMargin: 281
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 56
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 8
            spacing: 5

            model: modelParticipateEvent
            delegate: Rectangle {
                height: 30
                width: parent.width
                color: "transparent"
                border.width: 2
                border.color: "white"
                Column {
                    Text {
                        text: model.item.loginUser
                        color: "white"
                        x: 15
                        y: 15
                    }
                }
            }
        }

        Text {
            id: idevent
            x: 369
            y: 19
            text: qsTr("Text")
            visible: false
            font.pixelSize: 12
        }

        Text {
            id: element4
            color: "#ffffff"
            text: qsTr("Liste des participants")
            anchors.top: parent.top
            anchors.topMargin: 261
            anchors.left: parent.left
            anchors.leftMargin: 8
            font.pixelSize: 12
        }
    }

    Text {
        id: element
        color: "#ffffff"
        text: qsTr("Créateur :")
        anchors.top: parent.top
        anchors.topMargin: 182
        anchors.left: parent.left
        anchors.leftMargin: 8
        font.pixelSize: 12
    }
}




/*##^## Designer {
    D{i:3;anchors_height:63;anchors_width:384;anchors_x:8;anchors_y:281}D{i:6;anchors_x:76}
D{i:7;anchors_x:265}D{i:8;anchors_x:8;anchors_y:22}D{i:9;anchors_x:8;anchors_y:52}
D{i:10;anchors_width:384;anchors_x:8;anchors_y:193}D{i:11;anchors_x:76;anchors_y:52}
D{i:12;anchors_x:265;anchors_y:52}D{i:13;anchors_x:8;anchors_y:22}D{i:14;anchors_x:8;anchors_y:52}
D{i:15;anchors_width:384;anchors_x:8;anchors_y:193}D{i:16;anchors_x:8;anchors_y:52}
D{i:17;anchors_x:59;anchors_y:52}D{i:18;anchors_height:63;anchors_width:384;anchors_x:70;anchors_y:182}
D{i:22;anchors_x:8;anchors_y:132}D{i:23;anchors_x:8;anchors_y:132}
}
 ##^##*/
