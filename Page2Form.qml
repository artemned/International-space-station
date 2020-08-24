import QtQuick 2.14
import QtQuick.Controls 2.14
import QtWebView 1.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.14

Page {

      id:pagetwo
      title: qsTr("Video")
      width: 360
      height:589
     // property int dpi: Screen.pixelDensity * 25.4
      property int minDim: Math.min(width,height)
      property int orientat: Screen.primaryOrientation

      onOrientatChanged:
      {

          var oldwith=pagetwo.width
          var oldheight =pagetwo.height

         if(orientat === Qt.LandscapeOrientation ||
                 orientat === Qt.InvertedLandscapeOrientation)
           {

             pagetwo.width =674
             pagetwo.height=252.5

           }
            else if (orientat === Qt.PortraitOrientation ||
                     orientat ===Qt.InvertedPortraitOrintation)
          {

             pagetwo.width =360
             pagetwo.height=589


          }

}
      background: Rectangle{
                             anchors.fill: parent
                             color: "lightgreen"
                             opacity: 0.7

                           }

RowLayout{
      anchors.fill: parent
      spacing: 5
     // anchors.margins: 7

      Rectangle{

          anchors.centerIn: parent


      Text {
          id: load
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.verticalCenter: parent.verticalCenter
          text: qsTr("Loading...")
          color: "black"
          font.pointSize: 14
      }


      BusyIndicator{
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.verticalCenter: parent.verticalCenter-12
           anchors.topMargin: load.bottom
           running: wb.loading


      }


}

      WebView{
           id:wb
          Layout.fillHeight: true
          Layout.fillWidth: true
          Layout.minimumWidth: 100
          Layout.minimumHeight: 100

                visible: { if(wb.loading)
                                {
                                  wb.width=0
                                  wb.height=0
                                }else{
                                        width: 360
                                        height: 550
                                     }
                          }





                  // visible:true
                   url:"https://www.ustream.tv/embed/17074538?html5ui&amp;autoplay=1"



             }




   /*   Rectangle{
                  anchors.centerIn: wb
                  width: pagetwo.minDim/4
                  height: width
                  color: "red"
                  visible:true

               }

*/



   }

 }
















/*
      function dp(x){
          if(dpi < 120) {
              return x; // Для обычного монитора компьютера
          } else {
              return x*(dpi/160);
          }
      }

}*/

