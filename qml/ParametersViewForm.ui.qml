import QtQuick 2.4
import QtQuick.Controls 2.12

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
            text: qsTr("Visibilité du profil")
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 58
            styleColor: "#fbfbfb"
            font.pixelSize: 12
        }

        Switch {
            id: element1
            x: 191
            anchors.right: parent.right
            anchors.rightMargin: 135
            anchors.top: parent.top
            anchors.topMargin: 45
        }

        Text {
            id: element2
            x: -7
            y: 4
            width: 63
            height: 15
            color: "#fbfbfb"
            text: qsTr("Localisation")
            anchors.left: parent.left
            anchors.topMargin: 108
            font.pixelSize: 12
            anchors.top: parent.top
            styleColor: "#fbfbfb"
            anchors.leftMargin: 8
        }

        Switch {
            id: element3
            x: 191
            y: 2
            anchors.topMargin: 95
            anchors.right: parent.right
            anchors.rightMargin: 135
            anchors.top: parent.top
        }
    }
}
