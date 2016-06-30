/*************************************************************************
 *
 * Copyright (c) 2016 Qt Group Plc.
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.4
import QtGraphicalEffects 1.0

Item {
    width: 1000
    height: 250

    Rectangle {
        x: 0; y: 0; width: 300; height: 250
        color: "black"
        Image {
            id: image1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 20
            source: "../images/rocket.svg"
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: 35
            text: "original"; font.pixelSize: 32
            color: "white"
        }
    }

    Rectangle {
        x: 350; y: 0; width: 300; height: 250
        color: "black"
        Image {
            id: image2
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 20
            source: "../images/rocket.svg"
        }

        Colorize {
            anchors.fill: image2
            source: image2
            hue: 0.6
            saturation: 0.5
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: 35
            text: 'hue: "0.6"\nsaturation: 0.5'; font.pixelSize: 32
            color: "white"
        }
    }

    Rectangle {
        x: 700; y: 0; width: 300; height: 250
        color: "black"
        Image {
            id: image3
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 20
            source: "../images/rocket.svg"
        }

        Colorize {
            anchors.fill: image3
            source: image3
            hue: 0.6
            saturation: 1.0
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: 35
            text: 'hue: "0.6"\nsaturation: 1.0'; font.pixelSize: 32
            color: "white"
        }
    }
}
