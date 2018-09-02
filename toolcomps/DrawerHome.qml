import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.3
import "../toolcomps"


Drawer {
    id: drawer
    width: mainWindow.width * 0.80
    height: mainWindow.height
    //y:0
    //dragMargin:10
    edge:Qt.LeftEdge
    interactive:true
    position:1
   // property string qquery: null

    DrawerView {
        id : drawerview
        anchors.fill: parent

    }

    //Material.elevation: 9




    //property int height_size: ((drawer.height-heading.height)-(10*8))/8

//    Column {
//        anchors.fill: parent
//        spacing: 10
//        ItemDelegate{
//            id:heading
//            height: parent.height/5
//            width: parent.width

//            background: Rectangle{
//                anchors.fill:parent
//                color: Material.color(Material.BlueGrey)
//            }
////            Button{
////                //flat: false
////                height: 50
////                width: 50
////                background: Rectangle{
////                    anchors.fill:parent
////                    color:Material.color(Material.BlueGrey)
////                }

////                Image {
////                    id: name
////                    anchors.fill:parent
////                    source:  "qrc:/images/white/return_android_button.png"
////                }

////                onClicked: {
////                   // highlighted:true
////                    drawer.close()
////                }

////            }


//            Text {
//                id: name1
//                text: qsTr("Exams")
//                font.pixelSize: 20
//                anchors.centerIn: parent
//            }

//        }

//        Pushbuttonexam {
//            id:quantitativebutton
//            buttonname: qsTr("QUATITATIVE")
//            buttoncolor: Material.color(Material.Grey)
//            onClicked: {
//               messageDialog.pagetoload="qrc:/toolcomps/ex1.qml"
//                optionheading= buttonname;
//               buttoncolor=Material.color(Material.Green)
//                messageDialog.open()

//            }
//        }
//        Pushbuttonexam {
//            buttonname: qsTr("LOGICAL REASONING")
//            buttoncolor: Material.color(Material.Pink)
//            onClicked: {
//                messageDialog.pagetoload="qrc:/toolcomps/ex2.qml"
//                optionheading= buttonname;
//                messageDialog.open()
//            }
//        }
//        Pushbuttonexam {
//            buttonname: qsTr("GENERAL KNOWLEDGE")
//            buttoncolor: Material.color(Material.LightBlue)
//            onClicked: {
//                messageDialog.pagetoload="qrc:/toolcomps/ex3.qml"
//                optionheading= buttonname;
//                messageDialog.open()
//            }
//        }

//        Pushbuttonexam {
//            buttonname: qsTr("ENGLISH")
//            buttoncolor: Material.color(Material.Yellow)
//            onClicked: {
//                 messageDialog.pagetoload="qrc:/toolcomps/ex4.qml"
//                optionheading= buttonname;
//                messageDialog.open()
//            }
//        }

//        Pushbuttonexam {
//            buttonname: qsTr("SETTINGS")
//            buttoncolor: Material.color(Material.Yellow)
//            onClicked: {
//                stackView.push("qrc:/toolcomps/Settings.qml")
//                optionheading= buttonname;
//                drawerhome.close()
//            }
//        }

//        Pushbuttonexam {
//            buttonname: qsTr("INSTRUCTIONS")
//            buttoncolor: Material.color(Material.Yellow)
//            onClicked: {
//                stackView.push("qrc:/toolcomps/Instructions.qml")
//                optionheading= buttonname;
//                drawerhome.close()
//            }
//        }

//        Pushbuttonexam {
//            buttonname: qsTr("RESULTS")
//            buttoncolor: Material.color(Material.Yellow)
//            onClicked: {
//                stackView.push("qrc:/toolcomps/Results.qml")
//                optionheading= buttonname;
//                drawerhome.close()
//            }
//        }

//        Pushbuttonexam {
//            buttonname: qsTr("ABOUT")
//            buttoncolor: Material.color(Material.Yellow)
//            onClicked: {
//                stackView.push("qrc:/toolcomps/About.qml")
//                optionheading= buttonname;
//                drawerhome.close()
//            }
//        }
//    }





//    DrawerModel{
//        id:drawermodel
//    }

//    Component{
//        id : drawerdelegate
//        DrawerDelegate{

//        }
//    }


//        ScrollBar {
//        id:scrollBar
//        policy: ScrollBar.AlwaysOn
//        snapMode:ScrollBar.SnapOnRelease
//        position: 1
//        scale: 1
//        size: 1
//        interactive: true
//        active:true
//        stepSize: 0.1
//        orientation:Qt.Horizontal
//        //anchors.left:drawerview.right

//    }


//    ScrollBar {
//        id: vbar
//        hoverEnabled: true
//        active: hovered || pressed
//        orientation: Qt.Vertical
//        size:0.5 //frame.height / content.height
//        anchors.top: drawerview.top
//        anchors.topMargin: 20
//        anchors.right: drawerview.right
//        anchors.bottom: drawerview.bottom
//    }


}
