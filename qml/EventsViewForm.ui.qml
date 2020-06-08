import QtQuick 2.4

Item {
    width: 400
    height: 400
    property alias circleButton: circleButton

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
    }

    ListView {
        id: listView
        anchors.fill: parent

        model: modelEvents
        delegate: Rectangle {
            height: 25
            width: 100
            color: model.modelData.color
            Text {
                text: name
            }
        }

        CircleButton {
            id: circleButton
            x: 342
            y: 342
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            anchors.right: parent.right
            anchors.rightMargin: 8
        }
    }
}
