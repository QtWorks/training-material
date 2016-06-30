/*************************************************************************
 *
 * Copyright (c) 2016 Qt Group Plc.
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.4

Item {
    width: 300; height: 115

    Text {
        id: title
        x: 50; y: 25
        text: "Qt Quick"
        font.family: "Helvetica"; font.pixelSize: 50
    }

    Rectangle {
        x: 50; y: 75; height: 5
        width: title.width
        color: "green"
    }
}
