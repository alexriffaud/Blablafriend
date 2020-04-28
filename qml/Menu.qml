import QtQuick 2.4
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4

Item
{
    property int indexMenu: 1 


    anchors.fill: parent
    //! [orientation]
    readonly property bool inPortrait: parent.width < parent.height
    //! [orientation]

    ToolBar
    {
        id: overlayHeader

        z: 1
        width: parent.width
        RowLayout
        {
            width: parent.width
            ToolButton
            {
                id: toolButton
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40
                text: qsTr("⋮")
                onClicked:
                {
                    if(!drawer.visible)
                    {
                        drawer.open()
                    }
                    else
                    {
                        drawer.close()
                    }
                }
            }

            Rectangle
            {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredWidth: 300
                Layout.preferredHeight: 40
                color: "#00000000"
                Text
                {
                    anchors.centerIn: parent
                    id: label
                    text: "Blablafriend"

                }
            }
        }
    }

    Drawer
    {
        id: drawer

        y: overlayHeader.height
        width: parent.width / 2
        height: parent.height - overlayHeader.height

        modal: inPortrait
        interactive: inPortrait
        position: inPortrait ? 0 : 1
        visible: !inPortrait

        ListView
        {
            id: listView
            anchors.fill: parent
            headerPositioning: ListView.OverlayHeader
            header: Pane
            {
                id: header
                z: 2
                width: parent.width

                contentHeight: logo.height

                Image
                {
                    id: logo
                    width: parent.width
                    source: "../res/logob2.png"
                    height: parent.width
                }

                MenuSeparator
                {
                    parent: header
                    width: parent.width
                    anchors.verticalCenter: parent.bottom
                    visible: !listView.atYBeginning
                }
            }

            model: MenuModel {}

            delegate: ItemDelegate
            {
                text: name
                width: parent.width
                MouseArea {
                    id: mousearea1
                    anchors.fill: parent
                    onClicked: {
                        indexMenu = number
                    }
                }
            }
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }
}


