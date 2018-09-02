import QtQuick 2.0
import QtQuick.Dialogs 1.3

MessageDialog {
    id: messageDialog
    title: "enter the test"
    text: "do you want to enter?"
    property string pagetoload:qsTr("home")
    visible: false
    //icon: StandardIcon.Question
    standardButtons: StandardButton.Yes | StandardButton.No
       onYes:
       {
           stackView.push(pagetoload)
           drawerhome.close()
           console.log("pressed yes")
           console.log("loaded a page ",pagetoload)
       }
       onNo:{
           console.log("pressed no")
           drawerhome.close()
           console.log("not loaded any page")
       }
}

