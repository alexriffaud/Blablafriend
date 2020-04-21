import QtQuick 2.4

Item {
    id: element1
    width: 200
    height: 30
    property alias textInput: textInput
    property alias element: element

    Rectangle {
        id: rectangle
        x: 65
        width: 135
        color: "#ffffff"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        MouseArea {
            id: mouseArea
            anchors.fill: parent
        }
    }

    Row {
        id: row
        spacing: 50
        anchors.fill: parent

        Text {
            id: element
            color: "#f5f4f4"
            text: qsTr("Text")
            anchors.verticalCenterOffset: 0
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
        }

        TextInput {
            id: textInput
            width: 80
            height: 20
            text: qsTr("Text Input")
            anchors.verticalCenterOffset: 3
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
        }
    }
}

/*##^##
Designer {
    D{i:1;anchors_height:50;anchors_y:0}D{i:2;anchors_height:400;anchors_width:200;anchors_x:23;anchors_y:17}
}
##^##*/

