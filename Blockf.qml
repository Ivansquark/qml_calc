import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

GridLayout{

    function isBin(x) {
        if(x) {
            figuresLayout.fig2_visible = false;
            figuresLayout.fig3_visible = false;
            figuresLayout.fig4_visible = false;
            figuresLayout.fig5_visible = false;
            figuresLayout.fig6_visible = false;
            figuresLayout.fig7_visible = false;
            figuresLayout.fig8_visible = false;
            figuresLayout.fig9_visible = false;
            figuresLayout.figReverse_visible = false;
            figuresLayout.figPoint_visible = false;
        } else {
            figuresLayout.fig2_visible = true;
            figuresLayout.fig3_visible = true;
            figuresLayout.fig4_visible = true;
            figuresLayout.fig5_visible = true;
            figuresLayout.fig6_visible = true;
            figuresLayout.fig7_visible = true;
            figuresLayout.fig8_visible = true;
            figuresLayout.fig9_visible = true;
            figuresLayout.figReverse_visible = true;
            figuresLayout.figPoint_visible = true;
        }
    }
    id: figuresLayout
    rows: 3
    columns: 4
    height: parent.height
    width: parent.width
    property alias fig2_visible: fig2.visible
    property alias fig3_visible: fig3.visible
    property alias fig4_visible: fig4.visible
    property alias fig5_visible: fig5.visible
    property alias fig6_visible: fig6.visible
    property alias fig7_visible: fig7.visible
    property alias fig8_visible: fig8.visible
    property alias fig9_visible: fig9.visible
    property alias figReverse_visible: figReverse.visible
    property alias figPoint_visible: figPoint.visible
    Button {
        id: fig1
        Layout.row: 1
        Layout.column: 1
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        Layout.maximumWidth: parent.width/3
        contentItem: Text {
            text: "1"
            font.family: localFont.name
            font.pixelSize: 32
            //font: fig1.font
            color: fig1.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
                border.color: fig1.pressed ? "#999999" : "#898999"
                border.width: fig1.pressed ? 1 : 2
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
        onClicked: {
           dataModel.calcButClicked("1");
        }
    }

    Button {
        id: fig2
        Layout.row: 1
        Layout.column: 2
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        Layout.maximumWidth: parent.width/3
        contentItem: Text {
            text: "2"
            font.family: localFont.name
            font.pixelSize: 32
            //font: fig2.font
            color: fig2.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
                border.color: fig2.pressed ? "#999999" : "#898999"
                border.width: fig2.pressed ? 1 : 2
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
        id: fig3
        Layout.row: 1
        Layout.column: 3
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        Layout.maximumWidth: parent.width/3
        contentItem: Text {
            text: "3"
            font.family: localFont.name
            font.pixelSize: 32
            //font: fig3.font
            color: fig3.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
                border.color: fig3.pressed ? "#999999" : "#898999"
                border.width: fig3.pressed ? 1 : 2
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
        id: fig4
        Layout.row: 2
        Layout.column: 1
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        contentItem: Text {
            text: "4"
            font.family: localFont.name
            font.pixelSize: 32
            //font: fig4.font
            color: fig4.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
                border.color: fig4.pressed ? "#999999" : "#898999"
                border.width: fig4.pressed ? 1 : 2
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
        id: fig5
        Layout.row: 2
        Layout.column: 2
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        Layout.maximumWidth: parent.width/3
        contentItem: Text {
            text: "5"
            font.family: localFont.name
            font.pixelSize: 32
            //font: fig5.font
            color: fig5.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
                border.color: fig5.pressed ? "#999999" : "#898999"
                border.width: fig5.pressed ? 1 : 2
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
        id: fig6
        Layout.row: 2
        Layout.column: 3
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        Layout.maximumWidth: parent.width/3
        contentItem: Text {
            text: "6"
            font.family: localFont.name
            font.pixelSize: 32
            //font: fig6.font
            color: fig6.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
                border.color: fig6.pressed ? "#999999" : "#898999"
                border.width: fig6.pressed ? 1 : 2
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
        id: fig7
        Layout.row: 3
        Layout.column: 1
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        Layout.maximumWidth: parent.width/3
        contentItem: Text {
            text: "7"
            font.family: localFont.name
            font.pixelSize: 32
            //font: fig7.font
            color: fig7.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
                border.color: fig7.pressed ? "#999999" : "#898999"
                border.width: fig7.pressed ? 1 : 2
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
        id: fig8
        Layout.row: 3
        Layout.column: 2
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        Layout.maximumWidth: parent.width/3
        contentItem: Text {
            text: "8"
            font.family: localFont.name
            font.pixelSize: 32
            //font: fig8.font
            color: fig8.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
                border.color: fig8.pressed ? "#999999" : "#898999"
                border.width: fig8.pressed ? 1 : 2
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
        id: fig9
        Layout.row: 3
        Layout.column: 3
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        Layout.maximumWidth: parent.width/3
        contentItem: Text {
            text: "9"
            font.family: localFont.name
            font.pixelSize: 32
            //font: fig9.font
            color: fig9.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
                border.color: fig9.pressed ? "#999999" : "#898999"
                border.width: fig9.pressed ? 1 : 2
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
        id: figPoint
        Layout.row: 4
        Layout.column: 1
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        Layout.maximumWidth: parent.width/3
        contentItem: Text {
            text: "."
            font.family: localFont.name
            font.pixelSize: 32
            //font: figPoint.font
            color: figPoint.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
                border.color: figPoint.pressed ? "#999999" : "#898999"
                border.width: figPoint.pressed ? 1 : 2
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
        id: figReverse
        Layout.row: 4
        Layout.column: 3
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        Layout.maximumWidth: parent.width/3
        contentItem: Text {
            text: "<-"
            font.family: localFont.name
            font.pixelSize: 32
            //font: figReverse.font
            color: figReverse.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
                border.color: figReverse.pressed ? "#999999" : "#898999"
                border.width: figReverse.pressed ? 1 : 2
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
        id: fig0
        Layout.row: 4
        Layout.column: 2
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        Layout.maximumWidth: parent.width/3
        contentItem: Text {
            text: "0"
            font.family: localFont.name
            font.pixelSize: 32
            //font: fig0.font
            color: fig0.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
                border.color: fig0.pressed ? "#999999" : "#898999"
                border.width: fig0.pressed ? 1 : 2
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

