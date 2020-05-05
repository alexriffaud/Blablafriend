import QtQuick 2.4

Item {
    width: 400
    height: 400
    property alias lineEdit2: lineEdit2
    property alias buttonBBF: buttonBBF
    property alias buttonBBF1: buttonBBF1
    property alias lineEdit: lineEdit
    property alias lineEdit1: lineEdit1
    property alias datepicker: datepicker

    Rectangle {
        id: rectangle
        color: "#acb5b5"
        anchors.fill: parent

        Text {
            id: element
            x: 116
            y: 13
            text: qsTr("Ajouter un événement")
            font.bold: true
            font.pixelSize: 15
        }

        LineEdit {
            id: lineEdit
            anchors.right: parent.right
            anchors.rightMargin: 100
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.top: parent.top
            anchors.topMargin: 52
        }

        LineEdit {
            id: lineEdit1
            anchors.right: parent.right
            anchors.rightMargin: 100
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.top: parent.top
            anchors.topMargin: 100
        }

        Datepicker {
            id: datepicker
            height: 40
            anchors.top: parent.top
            anchors.topMargin: 159
            anchors.right: parent.right
            anchors.rightMargin: 76
            anchors.left: parent.left
            anchors.leftMargin: 76
        }

        LineEdit {
            id: lineEdit2
            x: 100
            y: 228
        }

        ButtonBBF {
            id: buttonBBF
            x: 76
            y: 348
        }

        ButtonBBF {
            id: buttonBBF1
            x: 224
            y: 348
        }
    }
}



