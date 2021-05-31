import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12


Page {
    id: page2
    property alias backgroundColor: backgroundRectColor.color
    property alias buttonText: navigationButton.text
    signal buttonClick();
    background: Rectangle {
        id: backgroundRectColor
    }
    ColumnLayout {
        anchors.fill: parent
        Rectangle {
            height: 50
            width: parent.width
            Button {
                id: navigationButton
                anchors.left: parent.left
                Layout.alignment: Qt.AlignLeft
                font.pixelSize: 30
                background: Rectangle {
                    border.color: navigationButton.pressed ? "#999999" : "#898999"
                    border.width: navigationButton.pressed ? 1 : 2
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
                    page2.buttonClick();
                }
            }
        }
        Rectangle {
            height: 220
            Layout.fillWidth: true
            ListView {
                id: list
                height: 220
                anchors.margins: 10
                anchors.fill: parent
                Layout.fillWidth: true
                //columnSpacing: 1
                //rowSpacing: 1
                clip: true
                model: cppListModel
                //! ___________list cell________________________________
                delegate: Item {
                    implicitHeight: 100
                    //implicitWidth: 100
                    implicitWidth: parent.width - model.cellWidth
                    Rectangle {
                        //Layout.fillHeight: true
                        //Layout.fillWidth: true
                        implicitHeight: 50
                        anchors.margins: 5
                        anchors.fill: parent
                        color: "grey"
                        radius: 5
                        border {
                            color: "grey"
                            width: 2
                        }
                        Text {
                            font.family: localFont.name
                            font.pixelSize: 25
                            anchors.centerIn: parent
                            renderType: Text.NativeRendering
                            color: "#022f15"
                            text: model.text
                        }
                    }
                }
            }
        }
        Blockor1 {
            Layout.fillWidth: true
        }
        RowLayout {
            Blockf {
                id: figures1
                figPoint_visible: true;
            }
            Blockoc {

            }
        }
    }
}
