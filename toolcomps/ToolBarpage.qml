import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3
import "../toolcomps"

ToolBar{
    id:tabbar
    focus: true
    property alias backgroundcolor:backrect.color

    contentItem: Rectangle {
            id: backrect
            color: backgroundcolor
    }


    RowLayout{
        anchors.fill: parent
        spacing: 20
        focus: true
         DigitalTimer{
             id:dm
             Layout.minimumHeight: 70
             Layout.minimumWidth: 70
             Layout.maximumHeight: 100
             Layout.maximumWidth: 100
             Layout.preferredHeight: 70
             Layout.preferredWidth: 70
             Layout.leftMargin: parent.spacing
             Layout.alignment: Qt.AlignBottom
             textcolor: Material.color(Material.Yellow)
             color:Material.color(Material.LightBlue)
             radius: 60
         }



    ToolButton{
         id:questionpallet
         focus: true
         Layout.minimumHeight: 70
         Layout.minimumWidth: 70
         Layout.maximumHeight: 100
         Layout.maximumWidth: 100
         Layout.preferredHeight: 70
         Layout.preferredWidth: 70
         Layout.alignment: Qt.AlignBottom
         //anchors.bottom: parent.bottom
         ToolTip.text: "question pallet"
         ToolTip.visible: pressed
         ToolTip.delay:500
         ToolTip.timeout: 5000
         leftPadding: 10
         Image {
                 anchors.centerIn:parent
                 source:Qt.resolvedUrl("qrc:/images/black/grid32_2")
             }
         }

     ToolButton{
         id:pause
         focus: true

         Layout.minimumHeight: 70
         Layout.minimumWidth: 70
         Layout.maximumHeight: 100
         Layout.maximumWidth: 100
         Layout.preferredHeight: 70
         Layout.preferredWidth: 70
         Layout.alignment: Qt.AlignBottom
         //anchors.bottom: parent.bottom
         ToolTip.text: "pause"
         ToolTip.visible: pressed
         ToolTip.delay:500
         ToolTip.timeout: 5000
         Image {
             id:playicon
             anchors.centerIn:parent
             source:Qt.resolvedUrl("qrc:/images/black/play32_2.png")
         }
         onClicked:{
             if(playicon.source == Qt.resolvedUrl("qrc:/images/black/play32_2.png"))
                 playicon.source = Qt.resolvedUrl("qrc:/images/black/pause32_2.png")
             else
                 playicon.source = Qt.resolvedUrl("qrc:/images/black/play32_2.png")
         }

        }
     ToolButton{
         id:previous
         focus: true
         Layout.minimumHeight: 70
         Layout.minimumWidth: 70
         Layout.maximumHeight: 100
         Layout.maximumWidth: 100
         Layout.preferredHeight: 70
         Layout.preferredWidth: 70
         Layout.alignment: Qt.AlignBottom
        // anchors.bottom: parent.bottom
         ToolTip.text: "previous"
         ToolTip.visible: pressed
         ToolTip.delay:500
         ToolTip.timeout: 5000
         Image {
             id:previcon
             anchors.centerIn:parent
             source:Qt.resolvedUrl("qrc:/images/black/previous32.png")
         }
      }
     ToolButton{
         id:next
         focus: true
         Layout.minimumHeight: 70
         Layout.minimumWidth: 70
         Layout.maximumHeight: 100
         Layout.maximumWidth: 100
         Layout.preferredHeight: 70
         Layout.preferredWidth: 70
         Layout.alignment: Qt.AlignBottom
         //anchors.bottom: parent.bottom
         ToolTip.text: "next"
         ToolTip.visible: pressed
         ToolTip.delay:500
         ToolTip.timeout: 5000
         Image {
             id:nexticon
             anchors.centerIn:parent
             source:Qt.resolvedUrl("qrc:/images/black/next32.png")
         }
       }
    }
}



