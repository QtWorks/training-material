/*************************************************************************
 *
 * Copyright (c) 2016 Qt Group Plc.
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.4

Rectangle {
    width: 400; height: 200; color: "lightblue"

    Rectangle {
        color: "red"
        width: parent.width
        height: 2
        anchors.verticalCenter: parent.verticalCenter
    }
    Image {
        id: book
        source: "../images/book.svg"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -parent.width/4
        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        text: "Writing"
        font.family: "Helvetica"
        font.pointSize: parent.width/20
        anchors.left: book.right
        anchors.leftMargin: parent.width/16
        anchors.baseline: book.verticalCenter
    }
}
