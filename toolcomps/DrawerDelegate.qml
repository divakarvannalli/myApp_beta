import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.3

ItemDelegate {
    id:delegateItem
    width: parent.width
    height: 70
        ColumnLayout {
        anchors.fill: parent
        RowLayout {
            //id:drawerdelegate
            spacing: 20
            Layout.alignment: Qt.AlignVCenter
            Item {
                implicitHeight: 40
                implicitWidth: 40
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter | Qt.AlignHCenter
                Layout.margins: 5
                Image {
                    id: icon
                    source: Qt.resolvedUrl(model.source)
                    anchors.centerIn: parent
                }
            }

            Label{
                id:iconname
                text: name
                font.pointSize: 15
                Layout.alignment: Qt.AlignVCenter  | Qt.AlignHCenter
                Layout.margins: 5
            }

        }

        HorizontalDivider {
            width: delegateItem.width
            anchors.bottom: parent.bottom
            Layout.alignment: Qt.AlignBottom
        }
    }

    onClicked: {
        drawerview.currentIndex= index
        if(name !== qsTr("Home"))
        {
//            messageDialog.pagetoload=pagetoload
//            optionheading= name;
//            messageDialog.open()
            stackView.push(pagetoload)
            drawerhome.close()
            console.log("loaded a page ",pagetoload)
        }
    }

}
