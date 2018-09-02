import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import "../toolcomps"



ItemDelegate {
    id:delitem
    width: parent.width
    implicitHeight:50
    property int testNo:0
property real perctestcompleted: 0.75
        property var buttoninfo: [{name:"Begin/Resume",icon:"qrc:/images/black/numoftestsicon/taketest24.png"},
                                  {name:"Clear Response",icon:"qrc:/images/black/numoftestsicon/cleartest24.png"},
                                   //{name:"Resume Test",icon:"qrc:/images/black/numoftestsicon/resumetest.png"},
                                  {name:"Check Score",icon:"qrc:/images/black/numoftestsicon/checkres24.png"}
        ]

            ColumnLayout {
                id:maincolumn
                anchors.fill: parent
                //spacing: 0
                 RowLayout{
                 id:testnum
                //Layout.alignment: Qt.AlignTop
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top:parent.top
                //width: 300// parent.width
                //spacing: 10
                implicitHeight: expandicon.implicitHeight
                Label {
                    id: testname
                    //anchors.top:parent.top
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 10
                    text:qsTr("test"+(index+1))
                    font.pointSize: 12
                }
                Item {
                    id: expandicon
                    implicitHeight: 56
                    implicitWidth: 56
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 5
                    scale: 0.75
                    Image {
                        id:expandiconimg
                        anchors.centerIn: parent
                        source: "qrc:/images/black/numoftestsicon/compress24.png"
                    }
                    MouseArea{
                        //id:expand
                        anchors.fill: parent
                        onClicked: {
                         delitem.state=="" ?delitem.state="expand" :delitem.state=""
                         console.log(percofcompete.state)
                         console.log(expand.state)
                         testNo = model.index + 1 //index starts from 0
                         console.log(testNo)
                        }
                    }
                    states: State {
                                   name: "iconchange"
                                   PropertyChanges { target: expandiconimg;source:Qt.resolvedUrl("qrc:/images/black/numoftestsicon/expand24.png")}
                               }

                    transitions: Transition {
                        RotationAnimator {
                            target: expandiconimg;
                            from: 0;
                            to: 360;
                            duration: 350
                            //running: true
                             easing.type:Easing.Linear//Easing.InOutQuad//Easing.OutQuad//Easing.InQuad //Easing.Linear
                        }
                    }
                }
                }
            Item{
                id:excessbutton
                anchors.top: testnum.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                implicitHeight: expand.height+percofcompete.height
                visible: false
                    RowLayout{
                        id:expand
                        spacing: 6
                        //anchors.top: testnum.bottom
                        anchors.left: parent.left
                        anchors.right: parent.horizontalCenter
                        //height: 70
                        //visible: false
                        opacity: 0

                        Repeater {
                            model: buttoninfo
                            delegate: RowLayout {
                              ColumnLayout{
                                  id:floatbutton
                                  spacing:6
                                  Layout.alignment: Qt.AlignTop
                                  FloatingButton{
                                     // id:buttonfloat
                                    backgroundColor:Material.color(Material.Lime)
                                    imageSource: modelData.icon
                                    z: 1
                                    showShadow:true
                                    scale: 0.75
                                    shadowcolor : Material.color(Material.Brown)
                                    Layout.alignment: Qt.AlignTop
                                    Layout.margins: 5
                                    ToolTip.text: modelData.name
                                    ToolTip.visible: false
                                    ToolTip.delay:0
                                    ToolTip.timeout: 500

                                    onClicked: {
                                        console.log(index)
                                        if(index == 0) {
                                            console.log(model.index)
                                          stackView.testNoquery = qsTr(stackView.stackqquery+testNo)
                                            console.log("stackView.testNoquery" + stackView.testNoquery)
                                            stackView.push(pagetoload)
                                            console.log("loaded a page ",pagetoload)
                                        }
                                        else if(index == 1) {
                                            if(writeToDb.resetResponse(11)) {
                                            ToolTip.text= "Cleared old response"
                                            ToolTip.visible=true
                                            }
                                        }
                                        else if(index == 2) {

                                        }
                                    }
                                  }
                                  Label{
                                      text:modelData.name
                                      color: Material.color(Material.LightBlue)
                                      font.pointSize: 8
                                      //anchors.top: buttonfloat.bottom
                                      Layout.alignment: Qt.AlignTop
                                      anchors.horizontalCenter: parent.horizontalCenter
                                      anchors.margins: 5
                                  }
                          }
                          VerticalDivider{
                            height: floatbutton.height
                            anchors.margins: 5
                            Layout.alignment: Qt.AlignVCenter
                          }
                         }
                       }

                        states: [State {
                                       name: "AnimateFloatButtonGroup"
                                       //PropertyChanges { target: expand;visible:true;}
                                       PropertyChanges { target: expand;opacity:1}
                                   }]
                        transitions: [
                            Transition {
                                //from: "";to:"visible"
                                OpacityAnimator{target: expand;duration: 500;/*from: 0;to: 1*/}
                            }]
                    }

                Rectangle{
                    id:percofcompete
                    height: 10
                   // width: 200
                    //anchors.top: expand.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 5
                    anchors.bottom: parent.bottom
//                    Layout.alignment: Qt.AlignBottom
//                    anchors.top: excessbutton.bottom
                    //visible: false
                    color: Material.color(Material.Grey)
                    radius: width/2
                    //opacity: 0
                    //width:parent.width
                    //scale: 0.75
                    Rectangle{
                      id:completedrect
                      anchors.left: parent.left
                      anchors.top: parent.top
                      anchors.bottom: parent.bottom
                      color: Material.color(Material.LightGreen)
                      width:0 //parent.width*perctestcompleted
                      radius: width/2

                      states: State{
                          name: "ShowAnimation"
                         PropertyChanges {target: completedrect;width:parent.width*perctestcompleted}
                      }
                      transitions:Transition{
                      NumberAnimation {target:completedrect;properties: "width";from:0; duration: 1500;easing.type: Easing.Linear }
                      //PropertyAnimation{ properties: "width";from:0;duration: 2200; easing.type: Easing.Linear  }
                      }
                    }

                    states: [State {
                                   name: "ShowPercCompleted"
                                   //PropertyChanges { target: percofcompete;visible:true;}
                                   PropertyChanges {target: completedrect;state:"ShowAnimation"}
                               }]
                }

                states: [State {
                               name: "visible"
                               PropertyChanges { target: excessbutton;visible:true;}
                               PropertyChanges {target: expand;state:"AnimateFloatButtonGroup"}
                               PropertyChanges {target: percofcompete;state:"ShowPercCompleted"}
                           }]
                transitions: [
                    Transition{
                     PropertyAnimation{ properties: "visible";from:false;duration: 200; easing.type: Easing.InOutQuad  }
                     }]
            }
                HorizontalDivider {
                    width: delitem.width
                    anchors.bottom: parent.bottom
                    //Layout.alignment: Qt.AlignBottom
                }
               }

            states: State {
                           name: "expand"
                           PropertyChanges {target: delitem; height:170;}
                           PropertyChanges {target: expandicon; state:"iconchange";}
                           PropertyChanges {target: excessbutton; state : "visible"}
             }

           transitions: Transition {
                PropertyAnimation{ properties: "height";duration: 300; easing.type: Easing.Linear}
           }


        //onClicked: {
            //currentIndex=index
            //messageDialog.pagetoload=pagetoload
            //optionheading= testname.text;

            //messageDialog.open()
//            loadexpand.parent=delitem
//            expandicon.state=="" ? (loadexpand.sourceComponent=expandcomp):
//                                   (loadexpand.sourceComponent=expandcomp)
            //expand.state=="" ?expand.state="expand" :expand.state=""
            //delitem.state=="" ?delitem.state="expand" :delitem.state=""
            //expandicon.state=="" ? expandicon.state= "iconchange" :expandicon.state=""
          // expand.state=="" ?  expand.state="visible":expand.state=""
           // percofcompete.state == ""  ? percofcompete.state="visible":percofcompete.state=""
            //percofcompete.visible==false ? percofcompete.visible=true:percofcompete.visible=false
//console.log(percofcompete.state)
//console.log(expand.state)

            //numtestmodel.insert(index+1, {"cost": 5.95, "name":"Pizza"})


        //}
    }

