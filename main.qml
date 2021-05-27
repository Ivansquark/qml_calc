import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import cppInterface 1.0

Window {
    id: window1
    visible: true
    width: 360
    height: 360
    property int caseIndex: 0
    Interface {
        id: inter // C++ interface class
    }
    FontLoader { id: localFont; source: Qt.resolvedUrl("voltage.ttf"); }
    ColumnLayout {
        //width: parent.width
        //height: parent.height
        anchors.fill: parent
        Super_button {
            //Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            text: "OPA"
        }

        Rectangle{
            color: "transparent"
            border.color: "#334567ff"
            border.width: 5
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 1
            Layout.rowSpan: 1
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
    }
    //visibility: "FullScreen"
}

