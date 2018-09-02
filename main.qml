import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.3
import "toolcomps"

ApplicationWindow{
    //app properties
    id: mainWindow
    visible: true

    width: 800
    height: 800
    property bool themeColor: cppobj.returnTheme()
    property string optionheading:qsTr("exam")

    //Material style property
    //Material.accent: Material.blue
    //Material.elevation :10
    //Material.background: Material.BlueGrey
    //Material.foreground: Material.LightGreen
    //Material.primary: Material.Blue

    //pixel density for android
    //property real dp: (Screen.pixelDensity *25.4) / 160

    title: qsTr("APP1.0")
    Material.theme: themeColor ? Material.Light:Material.Dark

    Component{
        id:toolbaroptions
    Toolbaroptions{
            height:40
            toolbarcolor: Material.color(Material.Teal)
            labeltext:optionheading
//          source1:qsTr("qrc:/images/black/back_32.png")
//          source2:qsTr("qrc:/images/black/settings32.png")
            source1:qsTr("qrc:/images/white/back24.png")
            source2:qsTr("qrc:/images/white/settings24.png")
        }
    }

    Component{
        id:toolbarhome
    ToolbarHome{
            toolbarheight: 50
            labeltext:qsTr("HOME")
            //source1:qsTr("qrc:/images/black/list32.png")
            source1: Qt.resolvedUrl("qrc:/images/white/list24.png")

            Connections{
                target: drawerhome
                onClosed: {
                    if(optionmenustate=="iconchanged"){
                       optionmenustate="";
                    }
                }
            }
        }
    }

   // setting the header for the app.
    header: Loader {
            id:headerloder
            focus: true
            sourceComponent:stackView.depth>1 ?toolbaroptions:toolbarhome
        }

    StackView {
        id: stackView
        property url pageUrl:Qt.resolvedUrl("qrc:/toolcomps/Homepage.qml")
        property string stackqquery: null
        property string testNoquery: null
       initialItem: pageUrl
       anchors.fill: parent
    }

    DrawerHome{
        id:drawerhome
        height: mainWindow.height-header.height
        y: header.height
   }

    MessageDialoguebox{
        id : messageDialog
    }

}
