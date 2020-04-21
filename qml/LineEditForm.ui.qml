import QtQuick 2.4

Item {
    id: element1
    width: 200
    height: 30
    property alias mouseArea: mouseArea
    property alias textInput: textInput
    property alias labelText: labelText

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.left: parent.left
        anchors.leftMargin: 65
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

    TextInput {
        id: textInput
        text: qsTr("Text Input")
        anchors.left: parent.left
        anchors.leftMargin: 73
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 2
        anchors.right: parent.right
        anchors.rightMargin: 7
        font.pixelSize: 12
    }

    Text {
        id: labelText
        color: "#f5f4f4"
        text: qsTr("Text")
        anchors.right: parent.right
        anchors.rightMargin: 177
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 0
        font.pixelSize: 12
    }
}

/*##^##
Designer {
    D{i:2;anchors_height:400;anchors_width:200;anchors_x:23;anchors_y:17}D{i:1;anchors_height:50;anchors_width:135;anchors_x:65;anchors_y:0}
D{i:3;anchors_height:20;anchors_width:120;anchors_x:73;anchors_y:8}D{i:4;anchors_x:0;anchors_y:8}
}
##^##*/

