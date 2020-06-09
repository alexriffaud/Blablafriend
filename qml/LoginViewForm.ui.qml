import QtQuick 2.4

Item {
    id: element
    width: 400
    height: 600
    property alias lineEdit1: lineEdit1
    property alias lineEdit: lineEdit
    property alias element1: element1
    property alias button: button
    property alias mouseArea: mouseArea
    property alias mouseArea1: mouseArea1

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
        }

        LineEdit {
            id: lineEdit
            y: 226
            anchors.right: parent.right
            anchors.rightMargin: 100
            anchors.left: parent.left
            anchors.leftMargin: 100

            labelText.text: "Username"
        }

        LineEdit {
            id: lineEdit1
            y: 271
            anchors.right: parent.right
            anchors.rightMargin: 100
            anchors.left: parent.left
            anchors.leftMargin: 100

            labelText.text: "Password"
            textInput.echoMode: "Password"
        }

        ButtonBBF {
            id: button
            x: 150
            y: 352
            width: 101
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            textButton.text: "Connexion"
        }

        Text {
            id: element1
            x: 172
            y: 442
            color: "#fbfbfb"
            text: qsTr("Inscription")
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 12
        }

        MouseArea {
            id: mouseArea
            x: 151
            y: 423
            width: 100
            height: 56
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea {
            id: mouseArea1
            x: 138
            y: 339
            width: 124
            height: 59
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}

/*##^##
Designer {
    D{i:6;anchors_width:100;anchors_x:150;anchors_y:21}D{i:7;anchors_y:226}D{i:8;anchors_y:271}
}
##^##*/

