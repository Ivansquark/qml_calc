import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import cppInterface 1.0
import cppTableModel 1.0
Page {
    id: root
    property alias backgroundColor: backgroundRectColor.color
    property alias buttonText: navigationButton.text
    signal buttonClick();
    CppModel {
        id: dataModel
    }
    background: Rectangle {
        id: backgroundRectColor
    }

    ColumnLayout {
        width: parent.width
        //height: parent.height
        anchors.fill: parent
        Button {
            id: navigationButton
//            anchors.right: parent.right
//            anchors.top: parent.top
//            anchors.margins: defMargine
            Layout.alignment: parent.right
            onClicked: {
                root.buttonClick();
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            implicitHeight: 200
            //implicitWidth: parent.width
            border {
                color: "black"
                width: 2
            }
            TableView {
                id: view
                anchors.margins: 10
                anchors.fill: parent
                Layout.fillWidth: true
                //columnSpacing: 1
                //rowSpacing: 1
                clip: true
                model: dataModel
                //! ___________table cell________________________________
                delegate: Item {
                    implicitHeight: 100
                    //implicitWidth: dataModel.number  parent.width/dataModel.cellWidth
                    implicitWidth: 10*parent.width/model.cellWidth
                    Rectangle {
                        anchors.margins: 5
                        anchors.fill: parent
                        color: model.color
                        property var setColor: model.setColor
                        border {
                            color: "black"
                            width: 2
                        }
                        Text {
                            anchors.centerIn: parent
                            renderType: Text.NativeRendering
                            text: model.text
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log(index);
                                if(index==0){
                                    symbols.visible = false
                                    figures.isBin(false);
                                } else if (index==1) {
                                    symbols.visible = true
                                    figures.isBin(false);
                                } else {
                                    symbols.visible = false
                                    figures.isBin(true);
                                }

                                model.setColor = "skyblue"

                            }
                            //onDoubleClicked:
                        }
                    }
                }
            }
        }
        Rectangle{
            color: "transparent"
            border.color: "#334567ff"
            border.width: 5
            Layout.row: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            implicitHeight: 50
            //Layout.columnSpan: 1
            //Layout.rowSpan: 1
            TextEdit {
                id: textEdit
                text: qsTr("")
                font.pixelSize: 25
                //anchors.centerIn: parent
                anchors.left:parent.left
                anchors.verticalCenter: parent.verticalCenter
                focus: true
                onTextChanged: {
                    switch(caseIndex) {
                    case 0:
                        labelDEC.text = inter.convertToDec(textEdit.text,0);
                        labelHEX.text = inter.convertToHex(textEdit.text,0);
                        labelBIN.text = inter.convertToBin(textEdit.text,0);
                        break;
                    case 1:
                        labelDEC.text = inter.convertToDec(textEdit.text,1);
                        labelHEX.text = inter.convertToHex(textEdit.text,1);
                        labelBIN.text = inter.convertToBin(textEdit.text,1);
                        break;
                    case 2:
                        labelDEC.text = inter.convertToDec(textEdit.text,2);
                        labelHEX.text = inter.convertToHex(textEdit.text,2);
                        labelBIN.text = inter.convertToBin(textEdit.text,2);
                        break;
                    }
                    if(textEdit.text === ""){
                        labelHEX.text = "HEX";
                        labelBIN.text = "BIN";
                        labelDEC.text = "DEC";
                    }
                }
            }
        }
        Rectangle{
            id: rectDEC
            color: 'grey'
            border.color: "#334567ff"
            border.width: 5
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            implicitHeight: 50
            Label {
                id: labelDEC
                text: qsTr("DEC")
                font.pixelSize: 25
                font.family: localFont.name
                anchors.left:parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    textEdit.text = ""; textEdit.focus = true;
                    caseIndex = 0;
                    rectDEC.color = 'grey'; rectBIN.color = 'transparent'; rectHEX.color = 'transparent';
                }
            }
        }
        Rectangle{
            id: rectHEX
            border.color: "#334567ff"
            border.width: 5
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            implicitHeight: 50
            Label {
                id: labelHEX
                text: qsTr("HEX")
                font.pixelSize: 25
                font.family: localFont.name
                anchors.left:parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    textEdit.text = ""; textEdit.focus = true;
                    caseIndex = 1;
                    rectHEX.color = 'grey'; rectDEC.color = 'transparent'; rectBIN.color = 'transparent';
                }
            }
        }
        Rectangle{
            //color: "transparent"
            id: rectBIN
            border.color: "#334567ff"
            border.width: 5
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            implicitHeight: 50
            Label {
                id: labelBIN
                text: qsTr("BIN")
                font.pixelSize: 25
                font.family: localFont.name
                anchors.left:parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    textEdit.text = ""; textEdit.focus = true;
                    caseIndex = 2;
                    rectBIN.color = 'grey'; rectDEC.color = 'transparent'; rectHEX.color = 'transparent';
                }
            }

        }
        RowLayout {
            height: parent.height
            width: parent.width
            id: coLo;
            Blockf {
                id: figures
                //figReverse_visible: false
                figPoint_visible: false
            }
            Blocka {
                id: symbols
                visible: false
            }
        }
    }

}
