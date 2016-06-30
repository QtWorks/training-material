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
    id: container
    width: 400; height: 400

    Rectangle {
        color : "blue"

        width : 100
        height: 100
        Rectangle {
            id: myRect
            y : 50
            x : 20
            width: 20; height: 20
            color: "red"
        }
        id  : blueRect

    }
    Rectangle {
        x : 200
        width : 100
        height: 100
        color : "yellow"
        id  : yellowRect
    }


    states: State {
        name: "reanchored"
        ParentChange {
            target: myRect;
            parent : yellowRect
            x : 60
            y : 20
        }
        AnchorChanges {
            target : myRect
            anchors.left : parent.left
            anchors.right : parent.right
        }

    }

    transitions: Transition {
        // smoothly reanchor myRect and move into new position
        ParentAnimation {
            NumberAnimation {
                properties : "x,y"
                duration: 1000
            }
        }
        AnchorAnimation {
            duration : 1000
        }

    }

    MouseArea {
      anchors.fill : parent
      onClicked: container.state = "reanchored"
    }
}
