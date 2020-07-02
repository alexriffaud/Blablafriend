import QtQuick 2.4
import QtQuick.Dialogs 1.2

SignUpViewForm
{
    lineEdit.labelText.text: "Email"
    lineEdit1.labelText.text: "Pseudo"
    lineEdit2.labelText.text: "Nom"
    lineEdit3.labelText.text: "Prénom"
    lineEdit5.labelText.text: "Ville"
    lineEdit6.labelText.text: "Password"
    lineEdit7.labelText.text: "Password"
    lineEdit9.labelText.text: "Description"
    lineEdit4.labelText.text: "Date de naissance"
    lineEdit4.textInput.validator: RegExpValidator { regExp: /[0-9]{2}\-[0-9]{2}\-[0-9]{4}/}


    lineEdit6.textInput.echoMode: "Password"
    lineEdit7.textInput.echoMode: "Password"

    buttonForm.textButton.text: "Valider"

    lineEdit.textInput.text : "Email"
    lineEdit1.textInput.text : "Pseudo"
    lineEdit2.textInput.text : "Nom"
    lineEdit3.textInput.text : "Prénom"
    lineEdit4.textInput.text : "01-01-2000"
    lineEdit5.textInput.text : "Paris"
    lineEdit9.textInput.text : "Description"
    lineEdit7.textInput.text : ""
}
