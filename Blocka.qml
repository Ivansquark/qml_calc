import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

GridLayout{
    id: figuresLayout
    height: parent.height
    width: parent.width
    Button {
        id: figA
        Layout.row: 1
        Layout.column: 1
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        contentItem: Text {
            text: "A"
            font.family: localFont.name
            font.pixelSize: 32
            //font: figA.font
            color: figA.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
        }
        background: Rectangle {
                border.color: figA.pressed ? "#999999" : "#898999"
                border.width: figA.pressed ? 1 : 2
                radius: 15
                gradient: Gradient {
                    GradientStop {
                    position: 0.1;
                    color: "#95dbd7";
                }
                GradientStop {
                    position: 0.90;
                    color: "#696969";
                }
            }
        }
    }
    Button {
        id: figB
        Layout.row: 2
        Layout.column: 1
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        contentItem: Text {
            text: "B"
            font.family: localFont.name
            font.pixelSize: 32
            //font: figB.font
            color: figB.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
        }
        background: Rectangle {
                border.color: figB.pressed ? "#999999" : "#898999"
                border.width: figB.pressed ? 1 : 2
                radius: 15
                gradient: Gradient {
                    GradientStop {
                    position: 0.1;
                    color: "#95dbd7";
                }
                GradientStop {
                    position: 0.90;
                    color: "#696969";
                }
            }
        }
    }
    Button {
        id: figC
        Layout.row: 3
        Layout.column: 1
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1

        contentItem: Text {
            text: "C"
            font.family: localFont.name
            font.pixelSize: 32
            //font: figC.font
            color: figC.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
        }
        background: Rectangle {
                border.color: figC.pressed ? "#999999" : "#898999"
                border.width: figC.pressed ? 1 : 2
                radius: 15
                gradient: Gradient {
                    GradientStop {
                    position: 0.1;
                    color: "#95dbd7";
                }
                GradientStop {
                    position: 0.90;
                    color: "#696969";
                }
            }
        }
    }
    Button {
        id: figD
        Layout.row: 1
        Layout.column: 2
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        contentItem: Text {
            text: "D"
            font.family: localFont.name
            font.pixelSize: 32
            //font: figD.font
            color: figD.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
        }
        background: Rectangle {
                border.color: figD.pressed ? "#999999" : "#898999"
                border.width: figD.pressed ? 1 : 2
                radius: 15
                gradient: Gradient {
                    GradientStop {
                    position: 0.1;
                    color: "#95dbd7";
                }
                GradientStop {
                    position: 0.90;
                    color: "#696969";
                }
            }
        }
    }
    Button {
        id: figE
        Layout.row: 2
        Layout.column: 2
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        contentItem: Text {
            text: "E"
            font.family: localFont.name
            font.pixelSize: 32
            //font: figE.font
            color: figE.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
        }
        background: Rectangle {
                border.color: figE.pressed ? "#999999" : "#898999"
                border.width: figE.pressed ? 1 : 2
                radius: 15
                gradient: Gradient {
                    GradientStop {
                    position: 0.1;
                    color: "#95dbd7";
                }
                GradientStop {
                    position: 0.90;
                    color: "#696969";
                }
            }
        }
    }
    Button {
        id: figF
        Layout.row: 3
        Layout.column: 2
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1

        contentItem: Text {
            text: "F"
            font.family: localFont.name
            font.pixelSize: 32
            //font: figF.font
            color: figF.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
        }
        background: Rectangle {
                border.color: figF.pressed ? "#999999" : "#898999"
                border.width: figF.pressed ? 1 : 2
                radius: 15
                gradient: Gradient {
                    GradientStop {
                    position: 0.1;
                    color: "#95dbd7";
                }
                GradientStop {
                    position: 0.90;
                    color: "#696969";
                }
            }
        }
    }
}
