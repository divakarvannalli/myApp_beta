import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import "../toolcomps"

ListView {

    property string pagetoload:qsTr("qrc:/toolcomps/ex1.qml")
    //anchors.fill: parent
    anchors.margins: 20
    property int numtestmodel: 5

    model: 5


    //expand icon loader and component
//    Loader{
//        id:loadexpand
//        sourceComponent: null
//    }

//    Component{
//        id:expandcomp
//        Expandicon{

//        }
//  }


    delegate:NumtestDelegate{
        id :delll

        onClicked: {
            //console.log("llll"+index)
            //console.log(stackView.stackqquery) drawer.qquery
           // console.log(drawer.qquery)
        }


    }

//    highlight: Rectangle{
//        width: parent.width
//        color: "lightgrey"
//    }

}
