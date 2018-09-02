import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../jsfiles/handle.js" as Jsexec
import QtQml.Models 2.3

Item {
        id :del
        anchors.fill: parent
        SwipeView {
            id : swipeview
            anchors.fill: parent
            currentIndex: del.ListView.view.currentIndex
            Item {
                Text {
                    anchors.fill: parent
                    property int columNo: 2
                    text: question
                }
            }
            Item {

                Text {
                    anchors.fill: parent
                    property int columNo: 3
                    text: description
                }
            }
            Item {
                id :option
                RowLayout {
                    anchors.fill: parent
                    //spacing: 10
                    Repeater {
                    id :rp
                    model: 5
                    RadioButton{
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
                        text:setoptionmenu(index+1)   //(index == 0) ? option1 : ((index == 1) ? option2 :((index == 2) ? option3 :((index == 3) ? option4 :option5)))
                        visible: (text == "NULL") ? false : true
                        onClicked: {
                            console.log(text);
                        }
                    }
                }
            }
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
