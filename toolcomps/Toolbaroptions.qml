import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.3
import "../toolcomps"

ToolBar {
    id:toolbaroptions
    //focus: true
    property string toolbarcolor: Material.color(Material.Teal)
    property string labeltext:qsTr("home")
    property string source1:qsTr("qrc:/images/black/prev_64")
    property string source2:qsTr("qrc:/images/black/settings64_2")
    property int itemhght: 48
    property int itemwdth: 48
    property int maxhgt: 60
    property int maxwdth: 60
    property int prefhgt: 48
    property int prefwdth: 48
    focus: true
    //contentHeight: 50
    //contentWidth: mainWindow.width
    //implicitHeight: 60
    //implicitWidth: mainWindow.width
   // opacity: 1

//    background: Rectangle {
//    anchors.fill: parent
//    color: toolbarcolor
//    }

    contentItem: Rectangle{
            //implicitHeight: implicitHeight
            //implicitWidth: implicitWidth
            color: toolbarcolor
        }

    RowLayout {
        focus: true
        //spacing: 6
        anchors.fill: parent
        ToolButton{
            id:gotohome
            focus: true
            Layout.minimumHeight: itemhght
            Layout.minimumWidth: itemwdth
            Layout.maximumHeight: maxhgt
            Layout.maximumWidth: maxwdth
            Layout.preferredHeight: prefhgt
            Layout.preferredWidth: prefwdth
            Layout.alignment: Qt.AlignLeft
            ToolTip.text: "double click to exit"
            ToolTip.visible: ma1.pressed
            ToolTip.delay:1000
            ToolTip.timeout: 1000
            Image {
                anchors.centerIn:parent
                source: source1
            }

            MouseArea{
                id:ma1
                anchors.fill: parent
                onDoubleClicked: {
                    console.log("double clicked")
                    stackView.pop()
                }
            }
        }

        Label{
            id:optionlabel
           anchors.centerIn: parent
           //Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            text:labeltext
            font.pointSize: 12
            //color: Material.color(Material.Indigo)
        }

        ToolButton{
            id:settingsbutton
            focus: false
            Layout.minimumHeight: itemhght
            Layout.minimumWidth: itemwdth
            Layout.maximumHeight: maxhgt
            Layout.maximumWidth: maxwdth
            Layout.preferredHeight: prefhgt
            Layout.preferredWidth: prefwdth
            Layout.alignment: Qt.AlignRight
            //anchors.right: parent.right
            ToolTip.text: "settings"
            ToolTip.visible: pressed
            ToolTip.delay:1000
            ToolTip.timeout: 1000
            Image {
                id:img1
                anchors.centerIn:parent
                source: source2
            }
            onClicked:{
                //stackView.push(setcomp)
                //if(stackView.currentItem !== "qrc:/toolcomps/Settings.qml")

                stackView.find(function(item) {
                    console.log(item.name)

                    if(item.name === "jjj")  console.log("hhhh") ;
                });


                //if(stackView.currentItem != )
                //if(!stackView.pop(settingcomp))
                stackView.push("qrc:/toolcomps/Homepage.qml")
                console.log(stackView.currentItem)

//                stackView.pop({Item: stackView.currentItem, immediate: true})
//                console.log(stackView.currentItem)
               console.log("total page pushed ",stackView.depth)
            }
        }
    }
}

