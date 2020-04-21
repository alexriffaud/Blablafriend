import QtQuick 2.4
import QtQuick.Controls 2.13

Item {
    width: 400
    height: 400
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

        Text {
            id: element
            color: "#fbfbfb"
            text: qsTr("License")
            anchors.top: parent.top
            anchors.topMargin: 21
            anchors.right: parent.right
            anchors.rightMargin: 161
            anchors.left: parent.left
            anchors.leftMargin: 161
            font.pixelSize: 24
        }

        ScrollView {
            id: scrollView
            anchors.top: parent.top
            anchors.topMargin: 63
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 8

            Text {
                id: element1
                color: "#fbfbfb"
                text: qsTr("Text")
                styleColor: "#fbfbfb"
                font.pixelSize: 12
            }

            ButtonBBF {
                id: buttonBBF
                x: 60
                y: 272
            }

            ButtonBBF {
                id: buttonBBF1
                x: 208
                y: 272
            }
        }
    }
}
