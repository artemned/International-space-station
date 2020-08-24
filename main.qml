import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Window 2.2
import QtQuick.Layouts 1.14
ApplicationWindow {
    id: window


    visible: true

    width: 720
    height:1320
    title: qsTr("MKC")
















//    property int orientation: Screen.primaryOrientation
//
//
//    onOrientationChanged:
//    {
//
//       if(orientation === Qt.LandscapeOrientation ||
//               orientation === Qt.InvertedLandscapeOrientation)
//         {
//
//           window.width =1320
//           window.height=720
//
//
//         }
//         else if (orientation === Qt.PortraitOrientation ||
//                  orientation ===Qt.InvertedPortraitOrintation)
//       {
//            window.width =720
//            window.height=1320
//       }
//
//
//
//
//    }
//



   header: ToolBar {
             id:toolbar
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            font.pointSize: 14.5
            anchors.centerIn: parent
            color: "green"
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Tracker")
                width: parent.width
                font.pointSize: 14.5
                onClicked: {
                    stackView.push("Page1Form.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Video")
                width: parent.width
                font.pointSize: 14.5
                onClicked: {
                    stackView.push("Page2Form.qml")
                    drawer.close()
                }
            }
        }
    }



    StackView {
        id: stackView
        initialItem: "HomeFomPath.qml"
        anchors.fill: parent
    }



footer:Rectangle{
    anchors. bottom: parent
       height:40
       color: "#426a6b"
       width: parent.width
       anchors.verticalCenter: parent
       opacity: 0.90



   }









}
