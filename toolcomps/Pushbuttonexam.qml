import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import QtQuick.Window 2.3

Button {
    property string buttonname
    property color buttoncolor

    text: qsTr(buttonname)
    font.pixelSize: 15
    width: parent.width
    height: height_size
    z:1

    background: Rectangle{
        anchors.fill:parent
        color: buttoncolor
    }

}
