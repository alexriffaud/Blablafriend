import QtQuick 2.4

Item {
    width: 400
    height: 400
    property alias imageSource: image.source

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
            x: 90
            y: 89
            width: 220
            height: 223
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "../res/logob.png"
        }
    }
}

/*##^##
Designer {
    D{i:1;anchors_height:200;anchors_width:200;anchors_x:88;anchors_y:90}
}
##^##*/
