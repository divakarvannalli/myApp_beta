import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../toolcomps"

 Popup{
     id: poppause
     focus: true
     modal: true
     dim: true
     implicitHeight: resumebutton.implicitHeight
     implicitWidth:resumebutton.implicitWidth
     closePolicy: Popup.NoAutoClose
     Material.elevation: 8
     z:2

    Flickable{
        anchors.fill: parent
     FloatingButton{
         id:resumebutton
         height: 80
         width: 80
         anchors.centerIn: parent
         imageSource:Qt.resolvedUrl("qrc:/images/black/pause64_2.png")
         onClicked:{
             poppause.close()
         }

     }
    }
 }
