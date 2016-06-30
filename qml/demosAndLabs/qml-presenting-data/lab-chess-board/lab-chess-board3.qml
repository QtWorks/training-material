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
    width: 445; height: 445; color: "brown"

    Grid {
        x: 5; y: 5
        rows: 8; columns: 8; spacing: 5

        Repeater {
            model: parent.rows * parent.columns
            Rectangle {
                width: 50; height: 50
                color: {
                    var row = Math.floor(index / 8);
                    var column = index % 8
                    if ((row + column) % 2 == 1)
                        "black";
                    else
                        "white";
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var x = index % 8;
                        var y = Math.floor(index/8);
                        if ((Math.abs(x - knight.cx) == 1 && Math.abs(y - knight.cy) == 2) ||
                            (Math.abs(x - knight.cx) == 2 && Math.abs(y - knight.cy) == 1)) {

                            knight.cx = x;
                            knight.cy = y;
                        }
                    }
                }
            }
        }
    }

    Image {
        id: knight
        property int cx
        property int cy

        source: "../images/knight.png"

        x: 5 + 55 * cx
        y: 5 + 55 * cy
    }
}
