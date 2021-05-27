import QtQuick 2.0
import QtQuick.Controls 2.12

Button {
    id: superBut1
    text: parent.text
    //FontLoader { id: localFont; source: Qt.resolvedUrl("voltage.ttf"); }
    flat: true

    contentItem: Text {
        text: superBut1.text
        font.family: localFont.name
        font.pixelSize: 32
        //font: superBut1.font
        color: superBut1.down ? "#000010" : "#180c3e"
        horizontalAlignment: Text.AlignHCenter

    }
    background: Rectangle {
        border.color: superBut1.pressed ? "#999999" : "#898999"
        border.width: superBut1.pressed ? 1 : 2
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
}
