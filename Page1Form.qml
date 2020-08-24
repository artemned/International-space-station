import QtQuick 2.14
import QtQuick.Controls 2.14
//import QtQuick.Controls 1.4
import QtWebView 1.1
import QtQuick.Layouts 1.14
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Universal 2.12






Page {

    id:pageone
    width: 360
    height:589
   // property int dpi: Screen.pixelDensity * 25.4
    property int minDim: Math.min(width,height)
    title: qsTr("Tracker")


    background: Rectangle{
                           anchors.fill: parent
                           color: "lightgreen"
                           opacity: 0.7

                         }

    property int orient: Screen.primaryOrientation
    onOrientChanged:
{


       if(orient === Qt.LandscapeOrientation ||
               orient === Qt.InvertedLandscapeOrientation)
         {

           pageone.width =674
           pageone.height=252.5
          console.log("change")

         }
          else if (orient === Qt.PortraitOrientation ||
                   orient ===Qt.InvertedPortraitOrintation)
        {

           pageone.width =360
           pageone.height=589
           console.log("changePortr")

        }

}

 RowLayout{
             anchors.fill: parent
             spacing: 10



             Text {
                     id: load
                     anchors.horizontalCenter: parent.horizontalCenter
                     anchors.verticalCenter: parent.verticalCenter+10
                     text:   qsTr("Loading...")
                     color: "black"
                     font.pointSize: 14
                     visible: wbone.loading
                  }



             Rectangle{
                anchors.centerIn: parent



             BusyIndicator{


                  anchors.horizontalCenter: parent.horizontalCenter
                  anchors.verticalCenter: parent.verticalCenter-12
                  anchors.topMargin: load.bottom

                  running: {wbone.loading

                             // if(load.text === "Loading...")
                             // {
                             //     load.text=qsTr("Loding")
                             // }

                           }
                  Universal.accent:Universal.Orange
             }


       }


   WebView{
             Layout.fillHeight: true
             Layout.fillWidth: true
             Layout.minimumWidth: 100
             Layout.minimumHeight: 100
             id:wbone
             visible: { if(wbone.loading)
                             {
                               wbone.width=0
                               wbone.height=0

                             }else{

                                    wbone.width=360
                                    wbone.height=550
                                  }
                       }
             //url:"https://isstracker.pl/?utm_source=partner&utm_medium=widget&utm_term=issstormwayru&satId=25544"
             url:"https://isstracker.pl/widget/map"


          }

 }





 //
 // Layout.fillHeight: true
 // Layout.fillWidth: true
 // Layout.minimumWidth: 100
 // Layout.minimumHeight: 100
 // anchors.centerIn: parent
 // //width: pageone.minDim/4
 // //height: width
 // color: "lightgreen"
 //
 //
  /*  function dp(x){
        if(dpi < 120) {
            return x; // Для desctop
        } else {
            return x*(dpi/160);
        }//
    }*/
}
