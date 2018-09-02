import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3

ToolBar {
    id:hometoolbar

    property color toolbarcolor: Material.color(Material.Green)
    property string labeltext:qsTr("HOME")
    property alias source1 : optionopenicon.source
    property real toolbarheight: 75
    //property string textlabel
    contentHeight: toolbarheight
    contentWidth: mainWindow.width

    property alias optionmenustate: optionopen.state

    implicitHeight: 60
    implicitWidth: 60
    //opacity: 1

//    background: Rectangle {
//    anchors.fill: parent
//    color: toolbarcolor
//    }

    contentItem:Rectangle {
        //anchors.fill: parent
        implicitWidth: hometoolbar.implicitWidth
        implicitHeight: hometoolbar.implicitHeight
        color: toolbarcolor
        }

    RowLayout {
        focus: true
        spacing: 0
        anchors.fill: parent

        ToolButton{
            id:optionopen
            //height: toolbaroptions.height
            //width: toolbaroptions.height
            //anchors.left: parent.left
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter | Qt.AlignLeft
            Layout.minimumHeight: 40
            Layout.minimumWidth: 40
            Layout.maximumHeight: 70
            Layout.maximumWidth: 70
            ToolTip.text: "options"
            ToolTip.visible: pressed
            ToolTip.delay:1000
            ToolTip.timeout: 1000
            focus: true
            contentItem: Item{
                implicitHeight: 24
                implicitWidth: 24
                Image {
                    id:optionopenicon
                anchors.centerIn:parent
                source: source1
                }
            }

            onClicked: {
                if(state == ""){
                state="iconchanged"
                drawerhome.open()

              }
             else if(state=="iconchanged"){
                state="";drawerhome.close();
             }
            }

            states: State {
                           name: "iconchanged"
                           PropertyChanges { target: optionopenicon;source:Qt.resolvedUrl("qrc:/images/white/home/back24.png")}
                       }

            transitions: Transition {
                RotationAnimator {
                    target: optionopenicon;
                    from: 0;
                    to: 360;
                    duration: 350
                    //running: true
                    //easing.type: Easing.InOutQuad
                     //easing.type: Easing.InOutElastic;
                     easing.type:Easing.Linear//Easing.InOutQuad//Easing.OutQuad//Easing.InQuad //Easing.Linear
                }
            }
        }

        Label{
            id: labelhome
            Layout.minimumHeight: 40
            Layout.minimumWidth:40
            Layout.maximumHeight: 70
            Layout.maximumWidth: 70
            anchors.centerIn: parent
            //Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            Text {
                text: qsTr("Home")
                anchors.centerIn: parent
                font.pointSize: 15
                color: "white"
            }
        }

    }
}

