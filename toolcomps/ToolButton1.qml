//import QtQuick 2.9
//import QtQuick.Controls 2.3
//import QtQuick.Controls.Material 2.2

//ToolButton {
//    id:toolButtonleft

//    //property for toolbutton1
////    property int toolbutton1Hght: 40
////    property int toolbutton1wdth: 40
// //   property string tb1iconsource: "qrc:/images/black/9776.png"

//    height: 40
//    width: 40

//    Image {
//        //width: Math.max(toolbutton1wdth, implicitWidth)
//        //height: Math.max(toolbutton1Hght, implicitHeight)
//        source: stackView.depth > 1 ? "qrc:/images/black/if_icon-ios7-arrow-back_211686.png":"qrc:/images/black/9776.png"
//        anchors.fill: parent
//        anchors.centerIn: parent
//    }
//    background: Rectangle{
//        anchors.fill:parent
//        color:toolbarcolor
//    }


//    font.pixelSize: Qt.application.font.pixelSize * 1.6
//    onClicked: {
//        if (stackView.depth > 1) {
//            stackView.pop()
//        } else {
//            drawerhome.open()
//        }
//    }

//}
