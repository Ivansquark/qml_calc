import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout{
    id: figuresLayout
    height: parent.height
    width: parent.width
    Button {
        id: figMinus
        Layout.row: 2
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        contentItem: Text {
            text: "-"
            font.family: localFont.name
            font.pixelSize: 32
            //font: figMinus.font
            color: figMinus.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
        }
        background: Rectangle {
                border.color: figMinus.pressed ? "#999999" : "#898999"
                border.width: figMinus.pressed ? 1 : 2
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
           cppListModel.calc1ButClicked("-");
        }
    }
    Button {
        id: figPlus
        Layout.row: 1
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1
        contentItem: Text {
            text: "+"
            font.family: localFont.name
            font.pixelSize: 32
            //font: figPlus.font
            color: figPlus.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
        }
        background: Rectangle {
                border.color: figPlus.pressed ? "#999999" : "#898999"
                border.width: figPlus.pressed ? 1 : 2
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
           cppListModel.calc1ButClicked("+");
        }
    }    
    Button {
        id: figEq
        Layout.row: 3
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 1
        Layout.rowSpan: 1

        contentItem: Text {
            text: "="
            font.family: localFont.name
            font.pixelSize: 32
            //font: figEq.font
            color: figEq.down ? "#000010" : "#180c3e"
            horizontalAlignment: Text.AlignHCenter
        }
        background: Rectangle {
                border.color: figEq.pressed ? "#999999" : "#898999"
                border.width: figEq.pressed ? 1 : 2
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
           cppListModel.calc1ButClicked("=");
        }
    }
}
