/*************************************************************************
 *
 * Copyright (c) 2016 Qt Company
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.5

Rectangle {
    width: 600; height: 600

    ShaderEffectSource {
        id: effectSource
        sourceItem: Rectangle {
            id: flag
            color: "lightBlue"
            border.color: "black"
            border.width: 4
            width: butterfly.width
            height: butterfly.height

            Image {
                id: butterfly
                source: "../images/butterfly.png"
                smooth: true
            }
        }
    }

    ShaderEffect {
        anchors.centerIn: parent
        width: flag.width
        height: flag.height

        property variant source: effectSource
        property real pi: Math.PI
        property real offset: 0
        NumberAnimation on offset { loops: Animation.Infinite; from: 0; to: Math.PI * 2; duration: 2000 }

        mesh: Qt.size(20, 20)

        vertexShader: "
                      uniform highp float height;
                      uniform highp float width;
                      uniform highp float pi;
                      uniform highp float offset;

                      uniform highp mat4 qt_Matrix;
                      attribute highp vec4 qt_Vertex;
                      attribute highp vec2 qt_MultiTexCoord0;
                      varying highp vec2 qt_TexCoord0;

                      void main() {
                          qt_TexCoord0 = qt_MultiTexCoord0;

                          highp vec4 pos = qt_Vertex;
                          highp float angle = 2.0 * pi * pos.x / width;
                          pos.y = pos.y + sin(angle + offset) * height / 20.0;

                          gl_Position = qt_Matrix * pos;
                      }"
    }
}
