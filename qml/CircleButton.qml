import QtQuick 2.0

Item
{
    id: circleButton
    height: 40
    width: 40

    Rectangle
    {
        id: background
        anchors.fill: parent
        color: "#003a5e"
        border.width: 1
        border.color: "black"
        radius: parent.width*0.5

        Text
        {
            id: plus
            anchors.centerIn: parent
            text: qsTr("+")
            color: "white"
            font.pointSize: 25
            font.bold: true
        }

        MouseArea
        {
           id: area
           anchors.fill: parent
        }
    }
}
