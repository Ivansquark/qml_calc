import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Page {
    id: root
    property alias backgroundColor: backgroundRectColor.color
    property alias buttonText: navigationButton.text
    property alias buttonCloseText: exitButton.text
    signal buttonClick();
    signal buttonCloseClick();

    background: Rectangle {
        id: backgroundRectColor
        color: "#affaf0e6"
    }

    ColumnLayout {
        //width: parent.width
        //height: parent.height
        anchors.fill: parent
        Rectangle {
            //anchors.fill: parent
            //Layout.fillHeight: true
            implicitHeight: 50
            Layout.fillWidth: true
            color: "#affaf0e6"
            //width: parent.width
            Button {
                id: exitButton
                anchors.left: parent.left
                Layout.alignment: Qt.AlignLeft
                font.pixelSize: 30
                background: Rectangle {
                    border.color: exitButton.pressed ? "#999999" : "#898999"
                    border.width: exitButton.pressed ? 1 : 2
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
                    page1.buttonCloseClick()
                }
            }
            Button {
                id: navigationButton
                anchors.right: parent.right
                Layout.alignment: Qt.AlignRight
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
                    root.buttonClick();
                }
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            implicitHeight: 250
            //implicitWidth: parent.width
            color: "#affaf0e6"
            border {
                //color: "black"
                color: "#affaf0e6"
                width: 2
            }
            TableView {
                id: view
                //anchors.margins: 10
                anchors.fill: parent
                //anchors.right: parent.right
                //height: parent.height
                //width: parent.width
                //Layout.fillWidth: true
                //columnSpacing: 1
                //rowSpacing: 1
                clip: true
                model: dataModel

                //! ___________table cell________________________________
                delegate: Item {
                    implicitHeight: 100
                    //implicitWidth: 100
                    implicitWidth: 16*parent.width/model.cellWidth
                    Rectangle {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        implicitHeight: 50
                        anchors.margins: 5
                        anchors.fill: parent
                        color: model.color
                        radius: 5
                        property var setColor: model.setColor
                        border {
                            color: "grey"
                            width: 2                            
                        }

                        Text {
                            id: textHex
                            font.family: localFont.name
                            font.pixelSize: 25
                            //height: parent.height
                            //width: parent.width
                            anchors.centerIn: parent
                            renderType: Text.NativeRendering
                            color: "#022f15"
                            text: model.text
                            wrapMode: Text.WrapAnywhere
                            elide: Text.ElideMiddle

                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log(index);
                                if(index==0){
                                    symbols.visible = false
                                    figures.isBin(false);
                                } else if (index==1) {
                                    figures.isBin(false);
                                    figures.visible = true
                                    symbols.visible = true
                                } else if (index==2){
                                    symbols.visible = false
                                    figures.isBin(true);
                                }
                                if(index==0 || index==1 || index ==2){
                                    model.setColor = "skyblue"
                                }
                            }
                            //onDoubleClicked:
                        }
                    }
                }
            }
        }        
        RowLayout {
            height: parent.height
            width: parent.width
            id: coLo;
            Blockf {
                id: figures
            }
            Blocka {
                id: symbols
                visible: false
            }
        }
    }
}
