import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 350
    height: 600
    title: qsTr("Blablafriend")

    Image {
        id: background
        source: "../res/background-login.jpg"
    }

    ColumnLayout {
        width: parent.width
        height: parent.height
        spacing: 2

        Rectangle {
            id: firstFrame
            Layout.preferredWidth: 40
            Layout.preferredHeight: 200
            Layout.fillWidth: true
            color: "transparent"

            Text {
                id: title
                text: qsTr("Blablafriend")
                font.family: "Calibri"
                color: "white"
                font.pixelSize: 40
                anchors.centerIn: parent
            }
        }
        Rectangle {
            id: secondFrame
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"

            ColumnLayout {
                width: parent.width
                height: parent.height
                spacing: 5

                Rectangle {
                    Layout.preferredWidth: 130
                    Layout.preferredHeight: 40
                    color: "black"
                    opacity: 0.5
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: login
                        text: qsTr("Connexion")
                        anchors.centerIn: parent
                        color: "white"
                    }
                }

                Rectangle {
                    Layout.preferredWidth: 130
                    Layout.preferredHeight: 40
                    color: "black"
                    opacity: 0.5
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: signin
                        text: qsTr("Inscription")
                        anchors.centerIn: parent
                        color: "white"
                    }
                }
            }
        }
    }
}
