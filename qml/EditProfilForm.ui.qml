import QtQuick 2.4

Item {
    width: 260
    height: 311
    property alias lineEdit4: lineEdit4
    property alias idStock: idStock
    property alias lineEdit3: lineEdit3
    property alias buttonBBF1: buttonBBF1
    property alias buttonBBF: buttonBBF
    property alias element: element
    property alias lineEdit2: lineEdit2
    property alias lineEdit1: lineEdit1
    property alias lineEdit: lineEdit

    Rectangle {
        id: rectangle
        width: 260
        color: "#ffffff"
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
        opacity: 0.8
        anchors.fill: parent
    }

    Rectangle {
        id: rectangle1
        width: 260
        color: "#00000000"
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
        anchors.fill: parent

        Text {
            id: element
            text: qsTr("Editer le profil")
            anchors.right: parent.right
            anchors.rightMargin: 236
            anchors.top: parent.top
            anchors.topMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 8
            font.pixelSize: 16
        }

        LineEdit {
            id: lineEdit
            x: 8
            anchors.horizontalCenterOffset: 10
            anchors.top: parent.top
            anchors.topMargin: 31
            anchors.horizontalCenter: parent.horizontalCenter
        }

        LineEdit {
            id: lineEdit1
            x: 8
            anchors.horizontalCenterOffset: 10
            anchors.top: parent.top
            anchors.topMargin: 67
            anchors.horizontalCenter: parent.horizontalCenter
        }

        LineEdit {
            id: lineEdit2
            x: 8
            anchors.horizontalCenterOffset: 10
            anchors.top: parent.top
            anchors.topMargin: 144
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ButtonBBF {
            id: buttonBBF
            y: 272
            anchors.left: parent.left
            anchors.leftMargin: 8
        }

        ButtonBBF {
            id: buttonBBF1
            x: 146
            y: 272
            anchors.right: parent.right
            anchors.rightMargin: 14
        }

        LineEdit {
            id: lineEdit3
            x: 1
            y: 6
            anchors.horizontalCenterOffset: 10
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 108
        }

        Text {
            id: idStock
            x: 217
            y: 11
            text: qsTr("Text")
            visible: false
            font.pixelSize: 12
        }

        LineEdit {
            id: lineEdit4
            x: 2
            y: 9
            anchors.top: parent.top
            anchors.topMargin: 180
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 10
        }
    }
}
