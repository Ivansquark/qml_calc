import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import cppInterface 1.0

Window {
    id: window1
    visible: true
    width: 500
    height: 500
    property int caseIndex: 0
    property int defMargine: 10
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: page1
    }

    Page1 {
        id: page1
        backgroundColor: "red"
        buttonText: "next"
        onButtonClick: {
            stackView.push(page2);
        }
    }
    Page2 {
        id: page2
        backgroundColor: "blue"
        buttonText: "back"
        onButtonClick: {
            stackView.pop();
        }
        visible: false
    }

    Interface {
        id: inter // C++ interface class
    }
    FontLoader { id: localFont; source: Qt.resolvedUrl("voltage.ttf"); }

    //visibility: "FullScreen"
}

