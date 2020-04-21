import QtQuick 2.4

LineEditForm
{
    property bool firstClick: true
    mouseArea.focus: true
    textInput.focus: false
    textInput.visible: false
    mouseArea.onClicked:
    {
        if(firstClick === false)
        {
            //do nothing
        }
        else
        {
            textInput.text = ""
            firstClick = false
            mouseArea.visible = false
            textInput.focus = true
            textInput.visible = true
        }
    }
}
