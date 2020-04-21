import QtQuick 2.4

Item {
    width: 100
    height: 30
    property alias textButton: textButton
    property alias mouseArea: mouseArea
    property alias rectangle1: rectangle1

    Rectangle {
        id: rectangle
        color: "#063d5b"
        anchors.fill: parent
    }

    Text {
        id: textButton
        color: "#fbfbfb"
        text: qsTr("Button")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
        font.pixelSize: 15
    }

    Rectangle {
        id: rectangle1
        color: "#aecffb"
        anchors.fill: parent
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }
}
