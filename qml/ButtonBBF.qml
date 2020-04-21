import QtQuick 2.4

ButtonBBFForm {
    rectangle1.visible: false
    mouseArea.onClicked:
    {
        rectangle1.visible = true
        textButton.color = "black"
        timer.start()
        textButton.color = "white"
    }

    Timer
    {
        id: timer
        interval: 100; running: false; repeat: false
        onTriggered: rectangle1.visible = false
    }
}
