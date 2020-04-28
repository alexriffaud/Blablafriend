import QtQuick 2.4
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.12
import QtLocation 5.6
import QtPositioning 5.6

MapViewForm
{
//    property alias menuProfil: menu

//    property int menuValue: menu.indexMenu
//    Menu
//    {
//        id: menu

//    }

    Plugin
    {
        id: mapPlugin
        name: "esri" // "mapboxgl", "esri", ...
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
