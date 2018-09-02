import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../jsfiles/handle.js" as Jsexec
import QtQml.Models 2.3

DelegateModel{

    id :delmodelpanel
    model : queryModel
    property int numofoption: 5
    property var optionlist: ['a. ','b. ','c. ','d. ','e. ']

    delegate: Item {
        id :del
        anchors.fill: parent
        SwipeView{
            id : swipeview
            anchors.fill: parent
            currentIndex: del.ListView.view.currentIndex

            background: Rectangle {
                color: "#eeeeee"
            }

            Item {

                ColumnLayout {
                    anchors.fill: parent
                    //spacing :0
                Image {
                    id: img
//                    anchors.top: parent.top
//                    height: 50
//                    width: 50
                    property var src : "qrc:/images/test_img/image1.jpeg" //imagepath
                    Layout.alignment: Qt.AlignTop
                    Layout.margins: 10
                    fillMode: Image.PreserveAspectFit
                    clip : true
                    asynchronous : true
                    cache: false
                    source:((src == "NULL") || (src == null) || (src == "")) ? "" :src;  //"qrc:/images/test_img/image1.jpeg" //(imagepath=="NULL" ? NULL:imagepath)
                    //visible: (source === null) ? false : true
                    onStatusChanged: {
                        if (img.status == Image.Ready)
                         console.log('Loaded')
                        else if(img.status == Image.Null) {
                         console.log('---image Null--setting null to source')
                         img.source = ""
                         }
                        else if(img.status == Image.Error) {
                         console.log('--image Error--setting null to source')
                         img.source = ""
                        }
                   }
                }
                Text {
                    anchors.top : img.bottom
                    anchors.margins: 10
                    font.pointSize: 15
                    text: description
                }
               }
            }
            Item {
                Text {
                    property int columNo: 2
                    anchors.margins: 10
                    font.pointSize: 15
                    text: question
                }
            }
            Item {
                id :option
                GridLayout {
//                   anchors.top: parent.top
//                   anchors.bottom: parent.verticalCenter
//                   anchors.left: parent.left
//                   anchors.right: parent.right
//                   anchors.horizontalCenter: parent.horizontalCenter
//                   anchors.verticalCenter: parent.verticalCenter

                    rows:5
                    columns: 0
                    //rowSpacing: 5
                    flow: GridLayout.TopToBottom
                    //spacing: 10
                    Repeater {
                    id :rp
                    model: numofoption
                    RadioButton {
                        id : rd
                        function setoptionmenu (index)
                        {
                            if(index == 1) return option1;
                            if(index == 2) return option2;
                            if(index == 3) return option3;
                            if(index == 4) return option4;
                            if(index == 5) return option5;
                        }
                        height: 10
                        width: 10
                        text: optionlist[index]+setoptionmenu(index+1)   //(index == 0) ? option1 : ((index == 1) ? option2 :((index == 2) ? option3 :((index == 3) ? option4 :option5)))
                        visible: ((text == "NULL") || (text=="")) ? false : true
                        onClicked: {
                            console.log(text);
                        }
                    }
                }
            }
        }

        onCurrentIndexChanged: {
            del.ListView.view.currentIndex = currentIndex
        }
    }

    PageIndicator {
        id: indicator
        count: swipeview.count
        currentIndex: swipeview.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
  }
    Component.onCompleted: {
        //console.log("ex1  "+stackView.testNoquery)
        //var query =  queryModel.retQueryToExec(stackView.testNoquery,popquestgrid.questclicked)
       // var query = Jsexec.formquerystring(stackView.testNoquery,popquestgrid.questclicked)
        //console.log(query)
        //Jsexec.setquery(query)
        //Jsexec.setquery("SELECT* FROM "+query)

    }

//    groups: [
//                 DelegateModelGroup  {
//                    includeByDefault: false
//                    name: "key0"
//                }
//            ]
//   filterOnGroup: "key0"
}




//var rowCount = queryModel.rowCount(parentModelIndex(0));
//console.log("queryModel rowCount " + rowCount)
//console.log("items count " + items.count +items.name+items.includeByDefault+items.itemsIndex)
//                items.remove(0,rowCount);
//                for( var i = 0;i < rowCount;i++ ) {
//                    var entry = queryModel.data(parentModelIndex(0),0x101);
//                  //  if((entry.index/2) == 0)
//                    //{
//                    console.log(entry)
//                        items.insert(entry, "key0");
//                    //}
//                }


//                for( var i = 0;i < rowCount;i++ ) {
//                   var iitem =  items.get(i)
//                    console.log(iitem)
//                }



//ListView{
//    id : panel
//    model: queryModel
//    property real currentIndex: 0
//    anchors.fill: parent
//    delegate: Item{
//        id :del
//        height: 100
//        width: parent.width
////        anchors.fill: parent
//        //text : index
//        SwipeView{
//            id : swipeview
//            anchors.fill: parent
//            //height: 100
//            //width: parent.width
//            currentIndex: panel.currentIndex
//            Item {
//                Text {
//                    property int columNo: 2
//                    text: Jsexec.returnroles(Qt.UserRole+columNo)
//                }
//            }
//            Item {
//                Text {
//                    property int columNo: 3
//                    text: model.description//Jsexec.returnroles(Qt.UserRole+columNo)
//                }
//            }
//                        Item {
//                            id :option
//                            RowLayout {
//                                anchors.fill: parent
//                                //spacing: 10
//                                Repeater {
//                                id :rp
//                                model: 5
//                                RadioButton{
//                                    id : rd
//                                    function setoptionmenu (index)
//                                    {
//                                        if(index == 1) {console.log(del.ListView.view.model.option1) ;return "oikk" ;}
//                                        if(index == 2) return option2;
//                                        if(index == 3) return option3;
//                                        if(index == 4) return option4;
//                                        if(index == 5) return option5;
//                                    }
//                                    height: 10
//                                    width: 10
//                                    text:setoptionmenu(index+1)   //(index == 0) ? option1 : ((index == 1) ? option2 :((index == 2) ? option3 :((index == 3) ? option4 :option5)))
//                                    visible: (text == "NULL") ? false : true
//                                    onClicked: {
//                                        console.log(text);
//                                    }
//                                }
//                            }
//                        }
//                    }
//        }

//        PageIndicator {
//            id: indicator

//            count: swipeview.count
//            currentIndex: swipeview.currentIndex

//            anchors.bottom: parent.bottom
//            anchors.horizontalCenter: parent.horizontalCenter
//        }
//    }
//}


