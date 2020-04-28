import QtQuick 2.4

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
    }

    ListView {
        anchors.fill: parent

        model: modelMyEvents
        delegate: Rectangle {
            height: 25
            width: 100
            color: model.modelData.color
            Text {
                text: name
            }
        }
    }
}
