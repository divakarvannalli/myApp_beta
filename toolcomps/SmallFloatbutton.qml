import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Button {
    id: button
    // image should be 24x24
    property alias imageSource: contentImage.source
    // default: primaryColor
    property alias backgroundColor: buttonBackground.color
    property bool showShadow: true
    property color shadowcolor: Material.color(Material.Dark)

    contentItem:
        Item {
        //implicitHeight: 24
        //implicitWidth: 24
        Image {
            id: contentImage
            anchors.centerIn: parent
        }
    }


    background:
        Rectangle {
        id: buttonBackground
        implicitWidth: 40
        implicitHeight: 40
        radius: width/2
        opacity: button.pressed ? 0.75 : 1.0
        layer.enabled: button.showShadow
        layer.effect: DropShadow {
            id:shadoweffect
            verticalOffset: 3
            horizontalOffset: 1
            color: shadowcolor
            samples: button.pressed ? 20 : 10
            spread: 0.5
        }
    }
}
