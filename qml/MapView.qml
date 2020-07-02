import QtQuick 2.4
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.12
import QtLocation 5.12
import QtPositioning 5.12

MapViewForm
{
    property alias positionSource: positionSource
    Rectangle {
        id: carte
        anchors.bottomMargin: Screen.desktopAvailableHeight/8
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter

        Plugin {
            id: mapPlugin
            name: "esri"
        }
        Map {
            id: map
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(43.95, 4.8167) // Avignon
            zoomLevel: 15
        }
    }

    Rectangle {
        id: localisation
        color: "#ffffff"
        width: Screen.desktopAvailableWidth
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6
        anchors.top: carte.bottom
        anchors.topMargin: 6

        Text {
            id: coordonnees
            text: qsTr("")
            anchors.fill: parent
            font.pixelSize: 26
        }
    }

    PositionSource {
        id: positionSource
        updateInterval: 1000
        active: true

        onPositionChanged: {
            var coord = positionSource.position.coordinate;

            if(coord.isValid)
            {
                // Les données
                console.log("Horodatage :", positionSource.position.timestamp);
                console.log("Coordonnées :", coord.longitude, coord.latitude, coord.isValid);
                console.log("Altitude :", coord.altitude, positionSource.position.altitudeValid);
                console.log("Direction :", positionSource.position.direction, positionSource.position.directionValid);
                console.log("Vitesse :", positionSource.position.speed, positionSource.position.speedValid);

                // Calcul
                console.log("Distance (Avignon) :", coord.distanceTo(QtPositioning.coordinate(43.95, 4.8167)));

                coordonnees.text = "Coordonnées : " + coord.longitude + " - " + coord.latitude + "\nAltitude : " + coord.altitude + " m\n" + positionSource.position.timestamp;
                map.center = coord;
            }
            else
            {
                coordonnees.text = "Géolocalisation non dispobile !\n";
            }
        }
    }
}
