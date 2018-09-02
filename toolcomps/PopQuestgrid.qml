import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../toolcomps"
import "../jsfiles/handle.js" as Jsexec


 Popup{
        id: popquestgrid
        focus: true
        modal: true
        dim: false
        property int totalNoOfquestion: 60
        closePolicy: Popup.CloseOnEscape |Popup.CloseOnPressOutside
        z:0
        property int questclicked: 1
       // signal changeColor(color whichcolor)
        signal fakemouseclick(int mousevent,int questionclicked)
        property int minquestionnum: 1
        property int maxquestnum: 60

       // height: content.implicitHeight
       // width: content.implicitWidth

        //Material.elevation: 8
        //x:100
        //y:100
        //contentWidth: content.
        //height: content.height
        //x: parent.width - width - 12
       // y: parent.height - height - 12
       // width: Math.min(mainWindow.width, mainWindow.height) / 3 * 2
       // height: Math.min(mainWindow.height, content.height +10)

       // Pane{
        //height: content.implicitHeight
        //width: content.implicitWidth
       // anchors.fill: parent
//        contentItem: Pane{
//        anchors.fill: parent
//        }
        //Pane{
            //anchors.fill: parent

//        Flickable {
//           id:flickarea
//            height: content.implicitHeight
//            width: content.implicitWidth
//          contentHeight: popquestgrid.height
           //anchors.fill: parent
            // Attention: clip should be used carefully,
            // but using a ListView inside a Popup
            // you must set it to true
            // otherwise content will appear outside while scrolling
            // don't clip at Paopup: will cut the elevation shadow
            //clip: true

        GridLayout {
            id:content
         anchors.fill: parent
         columns: 6
         rows:10
         flow: GridLayout.TopToBottom
         Repeater {
             id:questgrid
             model: totalNoOfquestion

             property int clickedQuestion: 0
//             property color prevcolor:Material.color(Material.Teal)
//             property color prevcolor2: Material.color(Material.Teal)
            // signal changecolorofgrid(color whichcolor)
           //  signal fakemouseclick (int mevent)
             //property Item last: itemAt(count-1)
             delegate: Rectangle {
                 id:questpallet
                 height: 35
                 width: 35
                 property int colorstate: 0
                 property MouseArea bbb: ma
                 //signal clickedquestno(int k)
                // signal changecolor(color whichcolor)
                 signal setprevcolorascolor(color whichcolor,bool imgvisible)
                 color: Material.color(Material.LightBlue)
                 Text{text:index+1 ;anchors.centerIn: parent;font.pointSize: 10}
                 Image {
                     id: tickMark
                     source: "qrc:/images/test_img/tick.png"
                     scale: 1
                     anchors.bottom: parent.bottom
                     anchors.right: parent.right
                     anchors.margins: 2
                     visible: false
                 }
               //  onChangecolor: {
                    // console.log("#################onChangecolor###########")
//                    if(whichcolor == 1) color=Material.color(Material.LightGreen);
//                    else if(whichcolor == 2) color=Material.color(Material.LightBlue);
//                    else if(whichcolor == 3) color=Material.color(Material.Red);
//                    else;
//                     if((color !==Material.color(Material.LightBlue)) &&(color !==Material.color(Material.Brown)))
//                     color=whichcolor
//                 if((whichcolor === Material.color(Material.Brown)) || (whichcolor === Material.color(Material.LightBlue)))
//                   questgrid.prevcolor=Material.color(Material.Red)
//                 else
//                     questgrid.prevcolor2=questgrid.prevcolor
//                     questgrid.prevcolor = whichcolor
//                 console.log("############onChangecolor "+whichcolor)
//                 }
                 onSetprevcolorascolor: {
                     console.log("#################onSetprevcolorascolor###########"+whichcolor)
                     if((whichcolor === Material.color(Material.LightBlue)) && (color===Material.color(Material.Brown))) {
                       color=Material.color(Material.red)

                     }
                     else
                     {
                        color=whichcolor
                        // color=Material.color(Material.Indigo)
                          console.log("setprevcolorascolor setted color as "+color)
                         //color=whichcolor
                          console.log("setprevcolorascolor setted color as "+color+"  "+whichcolor)
//                         if((color===Material.color(Material.Purple))&&(questgrid.prevcolor2===Material.color(Material.LightGreen)))
//                             tickMark.visible=true
//                         if((tickMark.visible==true)&&(color===Material.color(Material.Red)))
//                             tickMark.visible=false
                     }
                     tickMark.visible=imgvisible
                     console.log("setprevcolorascolor setted color as "+color)

                 }

                 MouseArea {
                     id :ma
                     anchors.fill: parent
                     onClicked: {
                         //console.log(questgrid.height)
                         console.log("#################ma.onClicked###########")
                         if (mouse===null ) {
                             console.log("mouse--------------------------->null ")
                         }
                         console.log("color-------==================================="+questpallet.color)
//                         questgrid.itemAt(questclicked-1).setprevcolorascolor(questgrid.prevcolor)
//                         questgrid.prevcolor = questpallet.color
                         whichcolortoset() //here previously entered quest set to proper color
                         //console.log(questgrid.prevcolor)
                         questpallet.color=Material.color(Material.Brown)
                         questclicked=index+1;
                         console.log("questclicked"+questclicked)
                         //popquestgrid.close()
//                         var query = Jsexec.formquerystring(stackView.testNoquery , popquestgrid.questclicked)
//                         console.log(query)
//                         Jsexec.setquery(query)
                         Jsexec.setquery(stackView.testNoquery , popquestgrid.questclicked)

                         panel.currentIndex=0
                 }
                 //Component.onCompleted: {
                   //questpallet.clickedquestno.connect(clicked)
                 //}

                     function whichcolortoset() {
                         var col = Material.color(Material.Yellow)
                         var k=false
                         Jsexec.setquery(stackView.testNoquery , popquestgrid.questclicked)
                         var temp = queryModel.retRespVal()
                         console.log("queryModel.respVal PopQuestgrid "+temp)
                         if((temp==="a")||(temp==="b")||(temp==="c")||(temp==="d")||(temp==="e")) {
                             console.log("#####saved answer#####"+Material.color(Material.LightGreen))
                             questgrid.itemAt(questclicked-1).setprevcolorascolor(Material.color(Material.LightGreen),false)
                         }
                         else if((temp==="ra")||(temp==="rb")||(temp==="rc")||(temp==="rd")||(temp==="re")) {
                             console.log("#####mark for review answer#####")
                             questgrid.itemAt(questclicked-1).setprevcolorascolor(Material.color(Material.Purple),false)
                         }
                         else if((temp==="ar")||(temp==="br")||(temp==="cr")||(temp==="dr")||(temp==="er"))
                         {
                             console.log("#####saved and mark for review answer#####")
                             questgrid.itemAt(questclicked-1).setprevcolorascolor(Material.color(Material.Purple),true)

                         }
                         else if(temp==="n") {
                             console.log("#####cleared answer#####")
                             questgrid.itemAt(questclicked-1).setprevcolorascolor(Material.color(Material.red),false)

                         }
                         else if(temp==="x") {
                             console.log("#####not entered response answer#####")
                             questgrid.itemAt(questclicked-1).setprevcolorascolor(Material.color(Material.LightBlue),false)

                         }
                         else{
                             console.log("#####exp condition#####")
                             questgrid.itemAt(questclicked-1).setprevcolorascolor(Material.color(Material.Yellow),false)
                         }

                     }

             }



             //onClickedquestno: console.log("clicked qno--------->"+index)
              //Component.onCompleted: {
               // questpallet.clickedquestno.connect(ma.clicked)
//                questpallet.clickedquestno.connect(questno)
//                questpallet.clickedquestno.disconnect(questno)
             // }
//              function questno() {
//                  console.log("clicked qno"+index);
//              }
          }
             Component.onCompleted: {
                // console.log("kkkkk")
                 //itemAt(0).clickedquestno(0);
                 //questgrid.itemAt(0).bbb.clicked(null);
                 var i
                 for(i=totalNoOfquestion-1;i>=0;i--)
                questgrid.itemAt(i).bbb.clicked(null);

                 //fakeclickhandle(0,null);
             }
//             onChangecolorofgrid: {
//                 console.log("#################onChangecolorofgrid###########")
//                 itemAt(questclicked-1).changecolor(whichcolor)
//             }
       }
        Component.onCompleted: {
            console.log("kkkkk2")
            //popquestgrid.changeColor.connect(questgrid.changecolorofgrid)
            popquestgrid.fakemouseclick.connect(fakeclickhandle)
        }
     }
    // }
    //}

        function fakeclickhandle(msevent,questionclicked) {
            if((questionclicked >= (minquestionnum-1)) && (questionclicked <= (maxquestnum-1))) {
            console.log("fakeclickhandle args --------->"+msevent+"    "+questionclicked)
            questgrid.itemAt(questionclicked).bbb.clicked(msevent);
            }
            else {
                console.log("met boundary value questionclicked "+questionclicked)
                if(questionclicked < (minquestionnum-1))
                    questgrid.itemAt(maxquestnum-1).bbb.clicked(msevent);
                if(questionclicked > (maxquestnum-1))
                    questgrid.itemAt(minquestionnum-1).bbb.clicked(msevent);

            }
        }

        enter: Transition {
             NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
         }
        exit: Transition {
                NumberAnimation { property: "opacity"; from: 1.0; to: 0.0 }
            }

        Component.onCompleted: {
            console.log("kkkkk3")
        }
   }

            //palette.text: "red"
       //leftMargin: 10
//        width: 200
//        height: 300
//        transformOrigin: Item.BottomRight
//        modal: true
//        focus: true
//closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent |Popup.CloseOnReleaseOutside
//        ColumnLayout {
//            anchors.fill: parent
//            CheckBox { text: qsTr("E-mail") }
//            CheckBox { text: qsTr("Calendar") }
//            CheckBox { text: qsTr("Contacts") }

//        }




  //}


