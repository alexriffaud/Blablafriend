import QtQuick 2.4

AddEditEventForm {
    lineEdit.labelText.text: "Nom"
    lineEdit1.labelText.text: "Description"
    lineEdit2.labelText.text: "Localisation"
    lineEdit3.labelText.text: "Date"
    lineEdit4.labelText.text: "Heure"
    lineEdit3.textInput.validator: RegExpValidator { regExp: /[0-9]{2}\-[0-9]{2}\-[0-9]{4}/}

    lineEdit.labelText.color: "black"
    lineEdit1.labelText.color: "black"
    lineEdit2.labelText.color: "black"
    lineEdit3.labelText.color: "black"
    lineEdit4.labelText.color: "black"

    buttonBBF.textButton.text: "Valider"
    buttonBBF1.textButton.text: "Annuler"
}
