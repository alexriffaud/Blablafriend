import QtQuick 2.4
import QtQuick.Controls 2.13

Item {
    width: 400
    height: 600
    property alias buttonForm: buttonForm
    property alias lineEdit7: lineEdit7
    property alias lineEdit6: lineEdit6
    property alias lineEdit5: lineEdit5
    property alias lineEdit4: lineEdit4
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
                width: 384
                height: 30
            }

            LineEdit {
                id: lineEdit1
                x: 0
                y: 57
                width: 384
                height: 30
            }

            LineEdit {
                id: lineEdit2
                x: 0
                y: 113
                width: 384
                height: 30
            }

            LineEdit {
                id: lineEdit3
                x: 0
                y: 171
                width: 384
                height: 30
            }

            LineEdit {
                id: lineEdit4
                x: 0
                y: 226
                width: 384
                height: 30
            }

            LineEdit {
                id: lineEdit5
                x: 0
                y: 282
                width: 384
                height: 30
            }

            LineEdit {
                id: lineEdit6
                x: 0
                y: 335
                width: 384
                height: 30
            }

            LineEdit {
                id: lineEdit7
                x: 0
                y: 388
                width: 384
                height: 30
            }

            ButtonQML {
                id: buttonForm
                x: 142
                y: 454
            }
        }
    }
}

/*##^##
Designer {
    D{i:7;anchors_height:498;anchors_width:384;anchors_x:8;anchors_y:94}
}
##^##*/

