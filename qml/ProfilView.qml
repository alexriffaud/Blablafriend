import QtQuick 2.4

ProfilViewForm
{
    rectangle3.radius: rectangle3.width*0.5
    buttonBBF.textButton.text: "Editer"

    buttonBBF.mouseArea.onClicked: {
        editProfil.visible = true
    }

    EditProfil {
        id: editProfil
        anchors.centerIn: parent
        visible: false

        buttonBBF1.mouseArea.onClicked:
        {
            editProfil.visible = false;
        }

        buttonBBF.mouseArea.onClicked:
        {

            addEditEvent.visible = false;
        }
    }
}
