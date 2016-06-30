/*************************************************************************
 *
 * Copyright (c) 2016 Qt Group Plc.
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

#include <QtWidgets>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QWidget window;

    QSlider slider(Qt::Horizontal);
    slider.setRange(0, 100);

    QSpinBox spin;

    QObject::connect(&slider, &QSlider::valueChanged,
                     [&] (int value ) {
                        qDebug("Value is = %d", value);
                        spin.setValue(value);
                     }
                     );

    // slider and spin are connected, change will be propagated to spinbox
    slider.setValue(40);

    QHBoxLayout layout;
    layout.addWidget(&slider);
    layout.addWidget(&spin);
    window.setLayout(&layout);
    window.show();

    return app.exec();
}
