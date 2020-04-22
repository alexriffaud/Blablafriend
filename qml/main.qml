import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

Window
{
    visible: true
    width: 350
    height: 600
    title: qsTr("Blablafriend")

//    width: Screen.desktopAvailableWidth
//    height: Screen.desktopAvailableHeight

    Rectangle {
        id: background
        anchors.fill: parent
        color: "black"
        visible: true
    }

    Splashscreen
    {
        id: spashScreen
        anchors.fill: parent


        function wait()
        {
            loginView.opacity = 0
            loginView.visible = true
            animations.start()
        }

        Timer
        {
            interval: 500; running: true; repeat: false
            onTriggered: spashScreen.wait()
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
            if(mainApp.login(username,password) === true)
            {
                customerView.visible = true
                loginView.visible = false
                customerView.initData()
            }
            else
            {
                messageDialog.show(qsTr("Username or password invalid"))
            }
        }

        mouseArea.onClicked:
        {
            loginView.swipe()
        }

        function swipe()
        {
            signupView.opacity = 0
            signupView.visible = true
            animations2.start()
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

    SignUpView
    {
       id: signupView
       visible: false
       anchors.fill: parent

       mouseArea.onClicked:
       {
            signupView.swipe()
       }

       function swipe()
       {
           licenceView.opacity = 0
           licenceView.visible = true
           animations3.start()
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

    LicenceView
    {
        id: licenceView
        anchors.fill: parent
        visible: false
        opacity: 0
    }
}
