import QtQuick 2.4

Item {
    width: 400
    height: 400
    property alias lineEdit1: lineEdit1
    property alias lineEdit: lineEdit
    Rectangle {
        id: rectangle
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

        Image {
            id: image
            height: 190
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.right: parent.right
            anchors.rightMargin: 102
            anchors.left: parent.left
            anchors.leftMargin: 102
            fillMode: Image.PreserveAspectFit
            source: "../res/logob.png"

            Column {
                id: column
                x: 0
                y: 194
                width: 200
                height: 136
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20

                LineEdit {
                    id: lineEdit
                }

                LineEdit {
                    id: lineEdit1
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:7;anchors_width:200;anchors_x:8}D{i:6;anchors_width:100;anchors_x:150;anchors_y:21}
}
##^##*/

