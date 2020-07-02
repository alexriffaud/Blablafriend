import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

Window
{
    visible: true
    width: 350
    height: 600
    title: qsTr("Blablafriend")

//    width: Screen.desktopAvailableWidth
//    height: Screen.desktopAvailableHeight


    Rectangle
    {
        id: background
        anchors.fill: parent
        color: "black"
        visible: true
    }

    Splashscreen
    {
        id: spashScreen
        anchors.fill: parent


        function swipe()
        {
            loginView.opacity = 0
            loginView.visible = true
            animations.start()
        }

        Timer
        {
            interval: 500; running: true; repeat: false
            onTriggered: spashScreen.swipe()
        }

        ParallelAnimation
        {
            id: animations
            running: false
            OpacityAnimator
            {
                id: fadeOut
                target: spashScreen;
                from: 1;
                to: 0;
                duration: 1000
                running: false
            }
            OpacityAnimator
            {
                id: fadeIn
                target: loginView;
                from: 0;
                to: 1;
                duration: 1000
                running: false
            }
        }
    }

    LoginView
    {
        id: loginView
        visible: false
        anchors.fill: parent

        function login(username, password)
        {
            mainApp.login(username,password)
        }

        Connections
        {
            target: databaseApp
            onChangeLoginState:
            {
                if(databaseApp.isConnected() === true)
                {
                    profilView.element.text = currentUser.fullName()
                    profilView.element1.text = currentUser.city()
                    profilView.element2.text = currentUser.login()
                    profilView.element3.text = currentUser.email()
                    profilView.element4.text = currentUser.birthday()
                    profilView.element5.text = currentUser.description()

                    profilView.rectangle3.color = "green"

                    swipe2()
                }
                else
                {
                    messageDialog.show(qsTr("Login ou mot de passe invalide"))
                }
            }

            function swipe2()
            {
                profilView.opacity = 0
                profilView.visible = true
                menu.visible = true
                animations5.start()
            }
        }

        mouseArea.onClicked:
        {
            loginView.swipe()
        }



        function swipe()
        {
            licenceView.opacity = 0
            licenceView.visible = true
            animations3.start()
        }


        mouseArea1.onClicked:
        {

             login(lineEdit.textInput.text, lineEdit1.textInput.text)
        }



        MessageDialog {
            id: messageDialog
            title: qsTr("Error login")
            function show(message) {
                messageDialog.text = message;
                messageDialog.open();
            }
        }

    }

    ParallelAnimation
    {
        id: animations2
        running: false
        OpacityAnimator
        {
            id: fadeOut2
            target: loginView;
            from: 1;
            to: 0;
            duration: 500
            running: false
        }
        OpacityAnimator
        {
            id: fadeIn2
            target: signupView;
            from: 0;
            to: 1;
            duration: 500
            running: false
        }
    }

    LicenceView
    {
        id: licenceView
        anchors.fill: parent
        visible: false
        opacity: 0

        mouseArea.onClicked:
        {
             licenceView.swipe()
        }

        function swipe()
        {
            signupView.opacity = 0
            signupView.visible = true
            animations2.start()
        }
    }

    SignUpView
    {
       id: signupView
       visible: false
       anchors.fill: parent

       mouseArea.onClicked:
       {
           if(lineEdit.textInput.text === "" ||
                   lineEdit1.textInput.text === "" ||
                   lineEdit2.textInput.text === "" ||
                   lineEdit3.textInput.text === "" ||
                   lineEdit5.textInput.text === "" ||
                   lineEdit6.textInput.text === "" ||
                   lineEdit7.textInput.text === "")
           {
               messageDialog.show(qsTr("Erreur, un ou plusieurs champs sont invalides"))
           }
           else
           {
               if(mainApp.makeUserData(lineEdit.textInput.text,
                                   lineEdit1.textInput.text,
                                   lineEdit2.textInput.text,
                                   lineEdit3.textInput.text,
                                   lineEdit4.textInput.text,
                                   lineEdit5.textInput.text,
                                   lineEdit6.textInput.text,
                                   lineEdit7.textInput.text,
                                   lineEdit9.textInput.text))
               {
                   profilView.element.text = lineEdit2.textInput.text.toUpperCase() + " " + lineEdit3.textInput.text
                   profilView.element1.text = lineEdit5.textInput.text
                   profilView.element2.text = lineEdit1.textInput.text
                   profilView.element3.text = lineEdit.textInput.text
                   profilView.element4.text = lineEdit4.textInput.text
                   profilView.element5.text = lineEdit9.textInput.text

                   profilView.rectangle3.color = "green"

                   signupView.swipe()
               }
               else
               {
                   messageDialog.show(qsTr("Erreur, les mots de passe doivent être identiques"))
               }
               console.log("wtf")
           }
       }


       function swipe()
       {
           profilView.opacity = 0
           profilView.visible = true
           menu.visible = true
           animations4.start()

       }
    }

    ParallelAnimation
    {
        id: animations3
        running: false
        OpacityAnimator
        {
            id: fadeOut3
            target: signupView;
            from: 1;
            to: 0;
            duration: 500
            running: false
        }
        OpacityAnimator
        {
            id: fadeIn3
            target: licenceView;
            from: 0;
            to: 1;
            duration: 500
            running: false
        }
    }



    ParallelAnimation
    {
        id: animations4
        running: false
        OpacityAnimator
        {
            id: fadeOut4
            target: licenceView;
            from: 1;
            to: 0;
            duration: 500
            running: false
        }
        OpacityAnimator
        {
            id: fadeIn4
            target: profilView;
            from: 0;
            to: 1;
            duration: 500
            running: false
        }
    }

    ParallelAnimation
    {
        id: animations5
        running: false
        OpacityAnimator
        {
            id: fadeOut5
            target: loginView;
            from: 1;
            to: 0;
            duration: 500
            running: false
        }
        OpacityAnimator
        {
            id: fadeIn5
            target: profilView;
            from: 0;
            to: 1;
            duration: 500
            running: false
        }
    }

    ProfilView
    {
        id: profilView
        anchors.fill: parent
        visible: false
        opacity: 0
    }

    MapView
    {
       id: mapView
       anchors.fill: parent
       visible: false
       opacity: 0
    }

    ParametersView
    {
        id: parametersView
        anchors.fill: parent
        visible: false
        opacity: 0
    }

    MyEventsView
    {
        id: myEventsView
        anchors.fill: parent
        visible: false
        opacity: 0
    }

    EventsView
    {
        id: eventsView
        anchors.fill: parent
        visible: false
        opacity: 0
    }

    MessageDialog {
        id: messageDialogQuit
        title: "Déconnexion"
        text: "Voulez-vous déconnecter de l'application."

        standardButtons: StandardButton.Yes | StandardButton.Abort
        onAccepted: {
            Qt.quit()
        }
        onRejected: {
            messageDialogQuit.close()
        }
    }

    Menu {
        id: menu
        visible: false
        onIndexMenuChanged :
        {
            followMenu(indexMenu)
        }

        function followMenu(index)
        {
            menu.drawer.close()
            switch(index)
            {
            case 1:
                parametersView.visible = false
                myEventsView.visible = false
                eventsView.visible = false
                mapView.visible = false
                profilView.visible = true
                profilView.opacity = 1
                break
            case 2:
                parametersView.visible = false
                myEventsView.visible = false
                eventsView.visible = false
                profilView.visible = false
                mapView.visible = true
                mapView.opacity = 1
                mapView.positionSource.start()
                break
            case 3:
                parametersView.visible = false
                eventsView.visible = false
                mapView.visible = false
                profilView.visible = false
                myEventsView.visible = true
                myEventsView.opacity = 1
                break
            case 4:
                parametersView.visible = false
                myEventsView.visible = false
                mapView.visible = false
                profilView.visible = false
                eventsView.visible = true
                eventsView.opacity = 1
                break
            case 5:
                myEventsView.visible = false
                eventsView.visible = false
                mapView.visible = false
                profilView.visible = false
                parametersView.visible = true
                parametersView.opacity = 1
                break
            case 6:
                messageDialogQuit.open()
                break
            }
        }
    }
}
