import QtQuick 2.4
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.12
import QtLocation 5.6
import QtPositioning 5.6

MapViewForm {
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
            anchors.fill: parent
            ToolButton {
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

            Label
            {
                id: label
                anchors.centerIn: parent
                text: "Blablafriend"
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
                    source: "../res/logob.png"
                    fillMode: implicitWidth > width ? Image.PreserveAspectFit : Image.Pad
                }

                MenuSeparator
                {
                    parent: header
                    width: parent.width
                    anchors.verticalCenter: parent.bottom
                    visible: !listView.atYBeginning
                }
            }

            model: 10

            delegate: ItemDelegate
            {
                text: qsTr("Title %1").arg(index + 1)
                width: parent.width
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    Plugin
    {
        id: mapPlugin
        name: "osm" // "mapboxgl", "esri", ...
        // specify plugin parameters if necessary
        // PluginParameter {
        //     name:
        //     value:
        // }
    }

    Map
    {
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(59.91, 10.75) // Oslo
        zoomLevel: 14
    }
}
