import QtQuick 2.4

Item {
    width: 260
    height: 311
    property alias buttonBBF1: buttonBBF1
    property alias buttonBBF: buttonBBF
    property alias element: element
    property alias lineEdit2: lineEdit2
    property alias datepicker: datepicker
    property alias lineEdit1: lineEdit1
    property alias lineEdit: lineEdit

    Rectangle {
        id: rectangle
        width: 260
        color: "#ffffff"
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
        opacity: 0.3
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
            text: qsTr("Ajouter un évènement")
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
            anchors.top: parent.top
            anchors.topMargin: 55
            anchors.horizontalCenter: parent.horizontalCenter


        }

        LineEdit {
            id: lineEdit1
            x: 8
            anchors.top: parent.top
            anchors.topMargin: 103
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Datepicker {
            id: datepicker
            x: 7
            width: 247
            height: 39
            anchors.top: parent.top
            anchors.topMargin: 146
            anchors.horizontalCenter: parent.horizontalCenter
        }

        LineEdit {
            id: lineEdit2
            x: 8
            anchors.top: parent.top
            anchors.topMargin: 204
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
    }
}

/*##^## Designer {
    D{i:1;anchors_height:200;anchors_width:200;anchors_x:65;anchors_y:75}D{i:3;anchors_x:8;anchors_y:8}
D{i:4;anchors_y:55}D{i:5;anchors_y:103}D{i:6;anchors_y:146}D{i:7;anchors_y:204}D{i:8;anchors_x:8}
D{i:9;anchors_x:152}D{i:2;anchors_height:200;anchors_width:200}
}
 ##^##*/
