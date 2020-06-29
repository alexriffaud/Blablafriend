import QtQuick 2.4

Item {
    width: 400
    height: 800
    property alias buttonBBF: buttonBBF
    property alias rectangle3: rectangle3
    property alias element4: element4
    property alias image: image
    property alias element5: element5
    property alias element3: element3
    property alias element2: element2
    property alias element1: element1
    property alias element: element

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

        Rectangle {
            id: rectangle2
            x: 259
            width: 133
            height: 126
            color: "#00000000"
            anchors.top: parent.top
            anchors.topMargin: 56
            anchors.right: parent.right
            anchors.rightMargin: 8
            border.color: "#fbfbfb"

            Image {
                id: image
                anchors.fill: parent
                source: "../res/logob.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Text {
            id: element
            color: "#fdfdfd"
            text: qsTr("Nom Prenom")
            anchors.top: parent.top
            anchors.topMargin: 56
            anchors.left: parent.left
            anchors.leftMargin: 8
            font.pixelSize: 18
        }

        Text {
            id: element1
            x: 9
            y: 1
            color: "#fdfdfd"
            text: qsTr("Ville")
            anchors.left: parent.left
            anchors.topMargin: 84
            font.pixelSize: 18
            anchors.leftMargin: 8
            anchors.top: parent.top
        }

        Text {
            id: element2
            x: -4
            y: 1
            color: "#fdfdfd"
            text: qsTr("Pseudo")
            anchors.left: parent.left
            anchors.topMargin: 112
            font.pixelSize: 18
            anchors.leftMargin: 8
            anchors.top: parent.top
        }

        Text {
            id: element3
            x: -5
            y: 5
            color: "#fdfdfd"
            text: qsTr("Email")
            anchors.left: parent.left
            anchors.topMargin: 140
            font.pixelSize: 18
            anchors.leftMargin: 8
            anchors.top: parent.top
        }

        Text {
            id: element5
            x: 5
            y: -4
            color: "#fdfdfd"
            text: qsTr("Description")
            anchors.left: parent.left
            anchors.topMargin: 199
            font.pixelSize: 18
            anchors.leftMargin: 8
            anchors.top: parent.top
        }

        Rectangle {
            id: rectangle1
            height: 40
            color: "#ffffff"
            anchors.top: parent.top
            anchors.topMargin: 251
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
        }

        ListView {
            id: listView
            opacity: 0
            visible: true
            highlightRangeMode: ListView.NoHighlightRange
            highlightFollowsCurrentItem: true
            anchors.top: parent.top
            anchors.topMargin: 297
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8

            delegate: Item {
                x: 5
                width: 80
                height: 40
                Row {
                    id: row1
                    Rectangle {
                        width: 40
                        height: 40
                        color: colorCode
                    }

                    Text {
                        text: name
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                    spacing: 10
                }
            }
        }

        Rectangle {
            id: rectangle3
            x: 249
            width: 29
            height: 29
            color: "#ffffff"
            radius: 1
            anchors.top: parent.top
            anchors.topMargin: 49
            anchors.right: parent.right
            anchors.rightMargin: 122
            border.width: 1
        }

        ButtonBBF {
            id: buttonBBF
            x: 150
            y: 751
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 19
        }
    }

    Text {
        id: element4
        x: 9
        y: 1
        color: "#fdfdfd"
        text: qsTr("Date de naissance")
        anchors.left: parent.left
        anchors.topMargin: 169
        font.pixelSize: 18
        anchors.leftMargin: 8
        anchors.top: parent.top
    }
}

/*##^##
Designer {
    D{i:7;anchors_height:112;anchors_width:135;anchors_x:129;anchors_y:"-23"}D{i:6;anchors_y:56}
D{i:8;anchors_x:8;anchors_y:28}D{i:9;anchors_x:8;anchors_y:28}D{i:10;anchors_x:8;anchors_y:28}
D{i:11;anchors_x:8;anchors_y:28}D{i:12;anchors_x:8;anchors_y:28}D{i:13;anchors_width:400;anchors_x:0;anchors_y:251}
D{i:14;anchors_height:495;anchors_width:384;anchors_x:8;anchors_y:297}D{i:24;anchors_x:8;anchors_y:49}
D{i:25;anchors_x:8;anchors_y:28}
}
##^##*/

