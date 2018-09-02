//import QtQuick 2.9
//import QtQuick.Controls 2.3
//import QtQuick.Layouts 1.3
//import QtQuick.Controls.Styles 1.4
//import QtQuick.Controls.Material 2.2
//import QtQuick.Window 2.3
//import QtQuick.Dialogs 1.3

import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0

//ScrollBar{
//    anchors.fill: parent
ListView {
    id:listviewdrawer
    anchors.fill: parent
    clip: true
    model: DrawerModel{ }
    delegate:  DrawerDelegate {
        onClicked: {
            //console.log(dbquery)
            stackView.stackqquery = dbquery;
            console.log(stackView.stackqquery)

        }
    }
    highlightFollowsCurrentItem:true

    header: Rectangle {
        id: banner
        width: parent.width; height: 180
        color: Material.color(Material.Pink)
        border {color: Material.color(Material.Pink); width:2;}
        ColumnLayout {
            anchors.fill: banner
            spacing: 0
                RowLayout {
                    id:apprelated
                    Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                    Layout.margins: 10
                    spacing: 5
                    Item {
                        id: appicon
                        implicitHeight: 24
                        implicitWidth: 24
                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/images/black/drawer/exam24.png"
                        }
                    }
                    Label{
                        id:appname
                        text: "EXAM APP"
                        color: "#FFFFFF"
                        font.bold: true
                        font.pixelSize: 20
                    }
                }
            Rectangle{
                id:usericon
                width: 75
                height: 75
                radius: width/2
                Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                Layout.margins: 10
                color: "#FFFFFF"
                Image {
                    anchors.centerIn: parent
                    source: Qt.resolvedUrl("qrc:/images/black/drawer/user64.png")
                }

            }
            Label{
                id:username
                text: "User name"
                Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                Layout.margins: 10
                //anchors.top: usericon.bottom
                //anchors.margins: 10
                color: "#FFFFFF"
                font.pixelSize: 20
            }
        }
    }

    ScrollBar.vertical:ScrollBar{
//        anchors.top: drawerview.top
//        anchors.right: drawerview.right
//        anchors.bottom: drawerview.bottom
        //anchors.topMargin: 180
//        stepSize: 0.5
//        size:0.5
        //width: implicitWidth/2
        width: 10
    }

 /* code for highlighting drawer options */
//    highlight:Rectangle {
//        width: parent.width
//        height: listviewdrawer.currentItem.height
//        color: "lightgray"

//    }
//    highlightMoveDuration:0
//    highlightMoveVelocity:1000
//    highlightResizeDuration:0
//    highlightResizeVelocity:1000

/*    footer:ItemDelegate{
        id:footericon
        width: parent.width;
        height: 70;
        ColumnLayout {
            anchors.fill: parent
            RowLayout{
                Layout.alignment: Qt.AlignVCenter
                spacing: 20
                Item {
                    id: feedbackicon
                    implicitHeight: 40
                    implicitWidth: 40
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter | Qt.AlignHCenter
                    Layout.margins: 5
                    Image {
                        anchors.centerIn: parent
                        source: Qt.resolvedUrl("qrc:/images/black/drawer/feedback24.png")
                    }
                }
                Label{
                    text: "Feedback"
                    font.pointSize: 15
                    Layout.alignment: Qt.AlignVCenter  | Qt.AlignHCenter
                    Layout.margins: 5
                }
            }

        HorizontalDivider {
            width: footericon.width
            anchors.bottom: parent.bottom
        }
    }

    onClicked: {
    }
    }*/

//    Component {
//        id: highlight
//        Rectangle {
//            width: 180; height: 40
//            color: "lightsteelblue"; radius: 5
//            y: listviewdrawer.currentItem.y
//            Behavior on y {
//                SpringAnimation {
//                    spring: 3
//                    damping: 0.2
//                }
//            }
//        }
//    }

//    Keys.onUpPressed: scrollBar.decrease()
//    Keys.onDownPressed: scrollBar.increase()

  /*ScrollBar.vertical:*/ /*ScrollBar {
        id:scrollBar
        //policy: ScrollBar.AsNeeded
        snapMode:ScrollBar.SnapOnRelease
        position: 0
        size: 0.5
        interactive: true
        active:hovered | pressed
        stepSize: 0.5
        anchors.topMargin: 180 //drawerview.header.height
        anchors.top: drawerview.top
        anchors.right: drawerview.right
        anchors.bottom: drawerview.bottom

        onPositionChanged: {

        }
    }*/


//  ScrollBar.anchors.topMargin: 180
//  ScrollBar.anchors.top: drawerview.top
//  ScrollBar.anchors.bottom: drawerview.bottom
//  ScrollBar.anchors.right: drawerview.right
//  ScrollBar.size: 0.5
//  ScrollBar.policy: ScrollBar.AsNeeded
//  ScrollBar.active: hovered | pressed
//  ScrollBar.stepSize: 0.3
//  ScrollBar.width: ScrollBar.implicitWidth/2
//  ScrollBar.snapMode: ScrollBar.SnapOnRelease


}
//}
