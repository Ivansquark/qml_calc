import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import cppTableModel 1.0
import cppListModel 1.0

Window {
    id: window1
    visible: true
    width: 500
    height: 500
    property int caseIndex: 0
    property int defMargine: 10
    signal fig1Click();
    CppModel {
        id: dataModel
    }
    CppListModel {
        id: cppListModel;
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: page1
    }

    Page1 {
        id: page1
        backgroundColor:"#affaf0e6"
        buttonText: "calc"
        buttonCloseText: "<"
        onButtonCloseClick: close();
        onButtonClick: {
            stackView.push(page2);
        }
    }
    Page2 {
        id: page2
        backgroundColor: "#affaf0e6"
        buttonText: "hex"
        onButtonClick: {
            stackView.pop();
            cppListModel.zeroes();
            dataModel.zeroes();
        }

        visible: false
    }


    FontLoader { id: localFont; source: Qt.resolvedUrl("voltage.ttf"); }

    //visibility: "FullScreen"
}

