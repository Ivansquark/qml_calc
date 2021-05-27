import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import cppInterface 1.0

Page {
    id: page2
    property alias backgroundColor: backgroundRectColor.color
    property alias buttonText: navigationButton.text
    signal buttonClick();
    background: Rectangle {
        id: backgroundRectColor
    }
    Button {
        id: navigationButton
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: defMargine
        onClicked: {
            page2.buttonClick();
        }
    }

}
