import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../toolcomps"
import "../jsfiles/handle.js" as Jsexec

Page {
    id:page1
    focus:true
//  property alias swipecurrentindex: swipepage.currentIndex
    property alias swipecurrentindex: panel.currentIndex
//  property string variable: qsTr("33")

    header: Tabbar {
        id:pagetoolbar
        height: 140
        width: parent.width
        backgroundcolor:Material.color(Material.Teal)

        Connections {
            target: poppause
            onClosed: {
                console.log("pause popup closed")
                pagetoolbar.playiconsource = Qt.resolvedUrl(pagetoolbar.playbutton)
                pagetoolbar.startTimer()
                console.log("Timer started")
            }
            onOpened: {
                console.log("pause popup opened")
               pagetoolbar.stopTimer()
                console.log("Timer stoped")
            }
        }
    }

//    ListView {
//        id : panel
//        anchors.fill : parent
////      property real currentIndex : 0
//        property int currentIndex : 0
//        model:Delegatemodelexpanel{}
//        contentItem.height: panel.height
//        contentItem.width: panel.width
////      contentItem.anchors.fill: panel
//        onCurrentIndexChanged: {
//            pagetoolbar.tabcurrentindex = currentIndex;
//        }
////      model : queryModel
////      delegate: DelOfPanel{}
//    }

    SwipeQnOt {
        id : panel

        Component.onCompleted: {
            console.log("------intially calling query--------------")
//            var query = Jsexec.formquerystring(stackView.testNoquery , popquestgrid.questclicked)
//            console.log(query)
//            Jsexec.setquery(query)
            Jsexec.setquery(stackView.testNoquery , popquestgrid.questclicked)
            console.log("------intially calling query ends here--------------")
        }

    }
    PageIndicator {
        id: indicator
        count: panel.count
        currentIndex: panel.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

//    FloatingButton {
//        id:plusfloatbutton
//        backgroundColor:Material.color(Material.Orange)
////      shadowcolor:"black"
//        imageSource: Qt.resolvedUrl("qrc:/images/white/add24.png")
//        z: 1
//        anchors.margins: 20
//        anchors.right: parent.right
//        anchors.bottom: parent.bottom
//        scale: 1
//        ToolTip.text: "floating button"
//        ToolTip.visible: pressed
//        ToolTip.delay:1000
//        ToolTip.timeout: 1000
//        onClicked: {
//            popup.open()
//           if(imageSource == Qt.resolvedUrl("qrc:/images/white/add24.png"))
//            imageSource= Qt.resolvedUrl("qrc:/images/white/multiply24.png")
//     }
//    }

//    PopupFloatbtn{
//        id:popup
//        parent: page1
//        x:plusfloatbutton.x-(implicitWidth)-10//+(plusfloatbutton.implicitWidth)-(width)-plusfloatbutton.anchors.leftMargin
//        y:plusfloatbutton.y+plusfloatbutton.implicitHeight+80//-plusfloatbutton.implicitHeight-(implicitHeight)
//          //plusfloatbutton.y+plusfloatbutton.height+20-100//-implicitHeight-20
//        onClosed: {
//            plusfloatbutton.imageSource="qrc:/images/white/add24.png"
//            console.log(plusfloatbutton.y,plusfloatbutton.x,y,x,plusfloatbutton.height,plusfloatbutton.implicitHeight)
//        }
//    }

//    Rectangle{
//        height: 10
//        width: 10
//        color: "black"
////        y:popup.y
////        x:popup.x
//        x:popup.x
//        y:popup.y
//    }

    PopQuestgrid {
        id:popquestgrid
        parent: page1
        signal changequestiongridcolor(int buttonnum)
        y:pagetoolbar.ycordofqppopup
        //x:pagetoolbar.xcordofqppopup
        x:0
        onChangequestiongridcolor: {
            //if(buttonnum == 1)

        }
    }

    PopupPause {
        id:poppause
        parent: page1
        leftMargin: (parent.width/2)-(implicitWidth/2)
        rightMargin: (parent.width/2)-(implicitWidth/2)
        topMargin: (parent.height/2)-(implicitHeight/2)
        bottomMargin: (parent.height/2)-(implicitHeight/2)
    }


}








//    ColumnLayout{
//        y:contentHeight
//        spacing: 10
//        anchors.horizontalCenter: parent.horizontalCenter
//        Label{
//            id:qlabel
//            color:Material.color(Material.Blue)

//       // anchors.top: header.bottom
//        //y:rectheader.height+75
//        text: "question"
//        font.pointSize: 10
//        }

//        Frame{
//        //anchors.

//            width: mainWindow.width-10
//            height: 200
//            anchors.horizontalCenter: parent.horizontalCenter
//        TextEdit{

//            anchors.fill: parent

//        }
//        }
//        Label{
//            text:"options"
//            color:Material.color(Material.Blue)
//            font.pointSize: 10


//        }

//        Frame{
//        //anchors.horizontalCenter: parent.horizontalCenter
//            Grid{
//                anchors.fill: parent
//                columns: 2
//                spacing:50
//            Repeater{
//                model: 4
//                anchors.fill: parent
//                Row{
//                    spacing: 10
//                RadioButton{
//                    text: "a"

//                }
//                Frame{
//                    height: 25
//                    width: 100
//                    TextInput{
//anchors.fill: parent
//                    }

//                }

//            }
//            }
//            }
//        }



//    }
//    footer: Rectangle{
//        anchors.fill: footer
//        color: "blue"
//        Button{
//        anchors.right: parent.right

//        }


//    }
//   footer: Rectangle{
//       //anchors.fill: parent
//       height: 100
//       FloatingButton{
//   // y:parent.mainWindow-10
//backgroundColor:Material.color(Material.Dark)
//imageSource: "qrc:/images/black/plus32.png"
//anchors.bottom: parent.top
//anchors.right: parent.right

//    }}
