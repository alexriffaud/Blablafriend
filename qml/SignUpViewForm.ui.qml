import QtQuick 2.4
import QtQuick.Controls 2.12

Item {
    width: 400
    height: 600
    property alias lineEdit4: lineEdit4
    property alias lineEdit9: lineEdit9
    property alias mouseArea: mouseArea
    property alias buttonForm: buttonForm
    property alias lineEdit7: lineEdit7
    property alias lineEdit6: lineEdit6
    property alias lineEdit5: lineEdit5
    property alias lineEdit3: lineEdit3
    property alias lineEdit2: lineEdit2
    property alias lineEdit1: lineEdit1
    property alias lineEdit: lineEdit

    Rectangle {
        id: rectangle
        anchors.fill: parent
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

        Text {
            id: element
            x: 139
            y: 29
            color: "#ffffff"
            text: qsTr("Inscription")
            font.pixelSize: 26
        }

        ScrollView {
            id: scrollView
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 94
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8

            LineEdit {
                id: lineEdit
                height: 30
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

            LineEdit {
                id: lineEdit1
                height: 30
                anchors.top: parent.top
                anchors.topMargin: 48
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

            LineEdit {
                id: lineEdit2
                height: 30
                anchors.top: parent.top
                anchors.topMargin: 97
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

            LineEdit {
                id: lineEdit3
                height: 30
                anchors.top: parent.top
                anchors.topMargin: 149
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

            LineEdit {
                id: lineEdit5
                height: 30
                anchors.top: parent.top
                anchors.topMargin: 252
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

            LineEdit {
                id: lineEdit6
                height: 30
                anchors.top: parent.top
                anchors.topMargin: 352
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

            LineEdit {
                id: lineEdit7
                height: 30
                anchors.top: parent.top
                anchors.topMargin: 403
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

            ButtonBBF {
                id: buttonForm
                x: 142
                anchors.top: parent.top
                anchors.topMargin: 454
                anchors.horizontalCenter: parent.horizontalCenter
                textButton.text: "Valider"
            }

            MouseArea {
                id: mouseArea
                y: 445
                height: 47
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 6
                anchors.right: parent.right
                anchors.rightMargin: 128
                anchors.left: parent.left
                anchors.leftMargin: 128
            }

            LineEdit {
                id: lineEdit9
                x: 0
                y: 5
                height: 30
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 302
                anchors.rightMargin: 0
                anchors.right: parent.right
                anchors.left: parent.left
            }

            LineEdit {
                id: lineEdit4
                x: 0
                y: 200
                width: 384
                height: 30
            }

        }
    }
}

/*##^##
Designer {
    D{i:8;anchors_width:384}D{i:9;anchors_width:384;anchors_x:0;anchors_y:57}D{i:10;anchors_width:384;anchors_x:0;anchors_y:113}
D{i:11;anchors_width:384;anchors_x:0;anchors_y:171}D{i:12;anchors_width:384;anchors_x:0;anchors_y:282}
D{i:13;anchors_width:384;anchors_x:0;anchors_y:335}D{i:14;anchors_width:384;anchors_x:0;anchors_y:388}
D{i:15;anchors_y:454}D{i:17;anchors_width:384;anchors_x:0;anchors_y:335}D{i:18;anchors_width:246;anchors_x:117;anchors_y:193}
D{i:19;anchors_x:0;anchors_y:206}D{i:7;anchors_height:498;anchors_width:384;anchors_x:8;anchors_y:94}
}
##^##*/

