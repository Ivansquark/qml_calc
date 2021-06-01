import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

RowLayout{
    id: figuresLayout
    width: parent.width
    Button {
        id: figMul
        Layout.row: 1
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        contentItem: Text {
            text: "*"
            font.family: localFont.name
            font.pixelSize: 32
            //font: figPlus.font
            color: figMul.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
        }
        background: Rectangle {
                border.color: figMul.pressed ? "#999999" : "#898999"
                border.width: figMul.pressed ? 1 : 2
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
           cppListModel.calc1ButClicked("*");
        }
    }
    Button {
        id: figDiv
        Layout.row: 2
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        contentItem: Text {
            text: "/"
            font.family: localFont.name
            font.pixelSize: 32
            //font: figMinus.font
            color: figDiv.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
        }
        background: Rectangle {
                border.color: figDiv.pressed ? "#999999" : "#898999"
                border.width: figDiv.pressed ? 1 : 2
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
           cppListModel.calc1ButClicked("/");
        }
    }
    Button {
        id: figSqrt
        Layout.row: 3
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1

        contentItem: Text {
            text: "\u221A" //sqrt symbol in unicode
            font.family: localFont.name
            font.pixelSize: 32
            //font: figEq.font
            color: figSqrt.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
        }
        background: Rectangle {
                border.color: figSqrt.pressed ? "#999999" : "#898999"
                border.width: figSqrt.pressed ? 1 : 2
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
           cppListModel.calc1ButClicked("sqrt");
        }
    }
    Button {
        id: figClear
        Layout.row: 3
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1

        contentItem: Text {
            text: "C" //sqrt symbol in unicode
            font.family: localFont.name
            font.pixelSize: 32
            //font: figEq.font
            color: figClear.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
        }
        background: Rectangle {
                border.color: figClear.pressed ? "#999999" : "#898999"
                border.width: figClear.pressed ? 1 : 2
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
           cppListModel.calc1ButClicked("C");
        }
    }
}

