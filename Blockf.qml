import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

GridLayout{
    function isBin(x) {
        if(x) {
            figuresLayout.fig2_text = "";
            figuresLayout.fig3_text = "";
            figuresLayout.fig4_text = "";
            figuresLayout.fig5_text = "";
            figuresLayout.fig6_text = "";
            figuresLayout.fig7_text = "";
            figuresLayout.fig8_text = "";
            figuresLayout.fig9_text = "";
            figuresLayout.fig2_enabled = false;
            figuresLayout.fig3_enabled = false;
            figuresLayout.fig4_enabled = false;
            figuresLayout.fig5_enabled = false;
            figuresLayout.fig6_enabled = false;
            figuresLayout.fig7_enabled = false;
            figuresLayout.fig8_enabled = false;
            figuresLayout.fig9_enabled = false;
            figuresLayout.figPoint_enabled = false;

        } else {
            figuresLayout.fig2_text = "2";
            figuresLayout.fig3_text = "3";
            figuresLayout.fig4_text = "4";
            figuresLayout.fig5_text = "5";
            figuresLayout.fig6_text = "6";
            figuresLayout.fig7_text = "7";
            figuresLayout.fig8_text = "8";
            figuresLayout.fig9_text = "9";
            figuresLayout.fig2_enabled = true;
            figuresLayout.fig3_enabled = true;
            figuresLayout.fig4_enabled = true;
            figuresLayout.fig5_enabled = true;
            figuresLayout.fig6_enabled = true;
            figuresLayout.fig7_enabled = true;
            figuresLayout.fig8_enabled = true;
            figuresLayout.fig9_enabled = true;
            figuresLayout.figPoint_enabled = true;
        }
    }
    id: figuresLayout
    rows: 3
    columns: 4
    //anchors.fill: parent
    //height: parent.height
    //width: parent.width
    Layout.alignment: Qt.AlignHCenter
    columnSpacing: 5
    property alias fig2_text: text2.text
    property alias fig3_text: text3.text
    property alias fig4_text: text4.text
    property alias fig5_text: text5.text
    property alias fig6_text: text6.text
    property alias fig7_text: text7.text
    property alias fig8_text: text8.text
    property alias fig9_text: text9.text
    property alias fig0_enabled: fig0.enabled
    property alias fig1_enabled: fig1.enabled
    property alias fig2_enabled: fig2.enabled
    property alias fig3_enabled: fig3.enabled
    property alias fig4_enabled: fig4.enabled
    property alias fig5_enabled: fig5.enabled
    property alias fig6_enabled: fig6.enabled
    property alias fig7_enabled: fig7.enabled
    property alias fig8_enabled: fig8.enabled
    property alias fig9_enabled: fig9.enabled
    property alias figReverse_enabled: figReverse.enabled
    property alias figPoint_enabled: figPoint.enabled
    property alias figPoint_visible: figPoint.visible
    Button {
        id: fig1
        Layout.row: 1
        Layout.column: 1
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        Layout.alignment: Qt.AlignHCenter
        //Layout.preferredWidth: parent.width - 5
        contentItem: Text {
            text: "1"
            font.family: localFont.name
            font.pixelSize: 40
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
            cppListModel.calc1ButClicked("1");
            dotNowPressed = false;
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
        Layout.alignment: Qt.AlignHCenter
        //Layout.preferredWidth: parent.width - 5
        contentItem: Text {
            id: text2
            text: "2"
            font.family: localFont.name
            font.pixelSize: 40
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
        onClicked: {
            dataModel.calcButClicked("2");
            cppListModel.calc1ButClicked("2");
            dotNowPressed = false;
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
        Layout.alignment: Qt.AlignHCenter
        contentItem: Text {
            id: text3
            text: "3"
            font.family: localFont.name
            style: Text.Outline
            font.pixelSize: 40
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
        onClicked: {
            dataModel.calcButClicked("3");
            cppListModel.calc1ButClicked("3");
            dotNowPressed = false;
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
            id: text4
            text: "4"
            font.family: localFont.name
            font.pixelSize: 40
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
        onClicked: {
            dataModel.calcButClicked("4");
            cppListModel.calc1ButClicked("4");
            dotNowPressed = false;
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
        contentItem: Text {
            id: text5;
            text: "5"
            font.family: localFont.name
            font.pixelSize: 40
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
        onClicked: {
            dataModel.calcButClicked("5");
            cppListModel.calc1ButClicked("5");
            dotNowPressed = false;
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
        contentItem: Text {
            id: text6
            text: "6"
            font.family: localFont.name
            font.pixelSize: 40
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
        onClicked: {
            dataModel.calcButClicked("6");
            cppListModel.calc1ButClicked("6");
            dotNowPressed = false;
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
        contentItem: Text {
            id: text7
            text: "7"
            font.family: localFont.name
            font.pixelSize: 40
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
        onClicked: {
            dataModel.calcButClicked("7");
            cppListModel.calc1ButClicked("7");
            dotNowPressed = false;
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
        contentItem: Text {
            id: text8
            text: "8"
            font.family: localFont.name
            font.pixelSize: 40
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
        onClicked: {
            dataModel.calcButClicked("8");
            cppListModel.calc1ButClicked("8");
            dotNowPressed = false;
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
        contentItem: Text {
            id: text9
            text: "9"
            font.family: localFont.name
            font.pixelSize: 40
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
        onClicked: {
            dataModel.calcButClicked("9");
            cppListModel.calc1ButClicked("9");
            dotNowPressed = false;
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
        contentItem: Text {
            text: "."
            font.family: localFont.name
            font.pixelSize: 40
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
        visible: false
        onClicked: {
            if(dotPressed === false) {
                dotNowPressed = true;
                dotPressed = true;
                cppListModel.calc1ButClicked(".");
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
        contentItem: Text {
            text: "<"
            font.family: localFont.name
            font.pixelSize: 40
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
        onClicked: {
            dataModel.calcButClicked("<");
            cppListModel.calc1ButClicked("<")
            if(dotNowPressed) {
                dotPressed = false;
            }
            dotNowPressed = false;
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
        contentItem: Text {
            text: "0"
            font.family: localFont.name
            font.pixelSize: 40
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
        onClicked: {
            dataModel.calcButClicked("0");
            cppListModel.calc1ButClicked("0");
            dotNowPressed = false;
        }
    }
}

