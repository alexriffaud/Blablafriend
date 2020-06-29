import QtQuick 2.4

ProfilViewForm
{
    rectangle3.radius: rectangle3.width*0.5
    buttonBBF.textButton.text: "Editer"

    buttonBBF.mouseArea.onClicked: {
        editProfil.visible = true

        editProfil.lineEdit.textInput.text = currentUser.lastname()
        editProfil.lineEdit1.textInput.text = currentUser.firstname()
        editProfil.lineEdit2.textInput.text = currentUser.city()
        editProfil.lineEdit3.textInput.text = currentUser.login()
        editProfil.lineEdit4.textInput.text = currentUser.description()
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

            mainApp.makeUserUpdateData(editProfil.lineEdit3.textInput.text, editProfil.lineEdit.textInput.text, editProfil.lineEdit1.textInput.text, editProfil.lineEdit2.textInput.text, editProfil.lineEdit4.textInput.text)

            editProfil.visible = false;

            profilView.element.text = editProfil.lineEdit.textInput.text.toUpperCase() + " " + editProfil.lineEdit1.textInput.text
            profilView.element1.text = editProfil.lineEdit2.textInput.text
            profilView.element2.text = editProfil.lineEdit3.textInput.text
            profilView.element5.text = editProfil.lineEdit4.textInput.text
        }
    }
}
