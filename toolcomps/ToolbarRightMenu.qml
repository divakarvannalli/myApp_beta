//import QtQuick 2.9
//import QtQuick.Controls 2.3
//import QtQuick.Controls.Material 2.2

//Menu {
//    id: menuBar
//    //menu bar inside toolbutton2
////    property int menuheight: dp*150
////    property int menuwidth: dp*100
// //   property real menuypos: parent.height
////   property real menuitemspacing : 6
////    property real menuborderwidth: 1
////    property string menuitembackcolor: "lightblue"
////    property string menuitembordercolor: "grey"
// //   property real menuxpos: parent.width - width
////    property real menuiconfontsize: 10
////    property real menuiconfontpixelsize: 15
////    property bool menuitemfontisbold :false
////    property color menuitemcolor: themeColor?"#00000":"#E4E4E4"
////    property string menuitemfontfamily:  "Helvetica"

//    property string menuitem1 :themeColor? qsTr("Dark Theme"):qsTr("Light Theme")
//    property string menuitem2 : qsTr("Settings")
//    property string menuitem3: qsTr("Instructions")
//    property string menuitem4: qsTr("About")

//    //height: menuheight
//    //width: menuwidth
// //   y:menuypos
////    background: Rectangle{
////        anchors.fill:parent
////        color: menuitembackcolor
////        border.color: menuitembordercolor
////        border.width: menuborderwidth
////    }

//    x: parent.width - width
//    y: parent.height
//    transformOrigin: Menu.TopRight
//    width: 150
//    height: 200

//    MenuItem {
//     // Text {
//       text:menuitem1
//       //color: themeColor?"#00000":"#E4E4E4"
////       font.family: menuitemfontfamily
////       font.pointSize:menuiconfontsize
////       font.pixelSize: menuiconfontpixelsize
////       font.bold: menuitemfontisbold
//      // }
//      onTriggered: {
//                        if(cppobj.returnTheme() === true)
//                            cppobj.setThemeval(false);
//                        else if(cppobj.returnTheme() === false)
//                            cppobj.setThemeval(true);
//                        console.log("key pressed ",cppobj.returnTheme())
//                        themeColor = cppobj.returnTheme();
//                        console.log("themeColor ",themeColor)


//      }
//    }
//    MenuItem {
//        text:menuitem2
////        Text {
////            text:menuitem2
//////            color: menuitemcolor
//////            font.family: menuitemfontfamily
//////            font.pointSize:menuiconfontsize
//////            font.pixelSize: menuiconfontpixelsize
//////            font.bold: menuitemfontisbold
////        }

//        onTriggered:
//        {
//            stackView.push("qrc:/toolcomps/ex1.qml")

//        }
//    }
//    MenuItem {
//        //Text {
//         text:menuitem3
////         color: menuitemcolor
////         font.family: menuitemfontfamily
////         font.pointSize:menuiconfontsize
////         font.pixelSize: menuiconfontpixelsize
////         font.bold: menuitemfontisbold
//        //}
//    }
//    MenuItem {
//        //Text {
//         text:menuitem4
////         color: menuitemcolor
////         font.family: menuitemfontfamily
////         font.pointSize:menuiconfontsize
////         font.pixelSize: menuiconfontpixelsize
////         font.bold: menuitemfontisbold
//        //}
//    }

//}
