import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
import QtWebView 1.1
import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import "qrc:/Astronaut.js" as Astronaut
import QtWebView 1.1
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.3
import QtQuick.Dialogs 1.3

Page{
    id:pagepath
    title:qsTr("MKC-63")
    width: 360
    height:589               // width: 720




    property int minDim: Math.min(width,height)
    property int orientation: Screen.primaryOrientation


    onOrientationChanged:
{


       if(orientation === Qt.LandscapeOrientation ||
               orientation === Qt.InvertedLandscapeOrientation)
         {

           pagepath.width =674
           pagepath.height=252.5
          console.log("change")
          // view.pathItemCount=6

         }
          else if (orientation === Qt.PortraitOrientation ||
                   orientation ===Qt.InvertedPortraitOrintation)
        {

           pagepath.width =360
           pagepath.height=589
           console.log("changePortr")
//           view.pathItemCount=4

        }

}



    background: Rectangle{
                           anchors.fill: parent
                           //color: "lightgreen"
                           opacity: 1
                           Image{
                               fillMode: Image.PreserveAspectCrop
                               smooth: true
                                  anchors.fill:parent
                                  source:"qrc:/for_project_space/6k-hd-background-stars-universe-astronomy-space-the-milky-wa.jpg"
                                }


                           }



      property int itemAngle: 60
       property int itemSize: 145



    PathView {
        id: view
        focus: true
        anchors.fill: parent
        model: Astronaut.jsonmodel
        pathItemCount: 4
        clip: true


        path: Path {
            startX: 0
            startY: height / 3
            PathPercent { value: 0.0 }
            PathAttribute { name: "z"; value: 0 }
            PathAttribute { name: "angle"; value: itemAngle }
            PathAttribute { name: "origin"; value: 0 }
            PathAttribute {name:"Opacity";value:0.5}





            PathLine {
                x: (view.width - itemSize) / 2
                y: view.height / 3
            }


            PathAttribute { name: "angle"; value: itemAngle }
            PathAttribute { name: "origin"; value: 0 }
            PathPercent { value: 0.49 }
            PathAttribute { name: "z"; value: 10 }
            PathAttribute {name:"Opacity";value:0.5}

            PathLine { relativeX: 0; relativeY: 0 }//sdad

            PathAttribute { name: "angle"; value: 0 }
            PathAttribute { name: "Opacity"; value: 1 }
            PathLine {
                x: (view.width - itemSize) / 2 + itemSize
                y: view.height / 3
            }
            PathAttribute { name: "angle"; value: 0 }
            PathAttribute { name: "Opacity"; value: 1}
            PathPercent { value: 0.51 }

            PathLine { relativeX: 0; relativeY: 0 }//addsd

            PathAttribute { name: "z"; value: 10 }
            PathAttribute { name: "angle"; value: -itemAngle }
            PathAttribute { name: "origin"; value: itemSize }
            PathAttribute { name: "Opacity"; value: 0.5 }
             PathLine {
                x: view.width
                y: view.height / 3
            }

            PathPercent { value: 1 }
            PathAttribute { name: "z"; value: 0 }
            PathAttribute {name:"Opacity";value:0.5}
            PathAttribute { name: "angle"; value: -itemAngle }
            PathAttribute { name: "origin"; value: itemSize }

        }
        delegate:
                     Column {
                     property real rotationAngle: PathView.angle
                     property real rotationOrigin: PathView.origin
                     property variant myData: modelData
                     //opacity: PathView.isCurrentItem ? 1 : 0.5
                     id:delegate
                     width: itemSize
                     height: width
                     spacing: 4
                     z: PathView.z
                     Row{
                           anchors.horizontalCenter: delegate.horizontalCenter
                           spacing: 7
                         Text{color:"#e9ec81";text:modelData.NameEng; font.family: "Californian FB"; font.bold: true; styleColor: "#58a9f5";font.pointSize:16}
                         Text{color:"#e9ec81";text:modelData.SurnameEng;font.family: "Californian FB";font.bold: true; styleColor: "#f9f4f4";font.pointSize:16}
                         opacity:PathView.opacity
                        }

        Rectangle {
               id: rect

               width: image.width+1
               height: image.height+1
               //ancho"#286cca"ntalCenter: delegate
               border{
                        width: 2
                        color:"#286cca"

                     }

               layer.enabled: true
               layer.effect: OpacityMask {
                   maskSource: Item {
                       width: rect.width
                       height: rect.height
                       Rectangle {
                           anchors.centerIn: parent
                           width: rect.adapt ? rect.width : Math.min(rect.width, rect.height)
                           height: rect.adapt ? rect.height : width
                           radius: 20
                       }
                   }
               }


        Image{
            id:image
             width: itemSize
             height: itemSize
             anchors.fill: rect
             source: modelData.Foto
             smooth:true


            }


       }
Row{

    anchors.horizontalCenter: delegate.horizontalCenter

    spacing: 7
    //anchors.leftMargin:

        Button{
                 id:infobutton;
                 width:pagepath.minDim/2.5;
                 height:pagepath.minDim/7;

            MouseArea{
                       anchors.fill: parent
                       onClicked: {
                                    info.text= "Страна: "+myData.Country+"\n"+"Имя: "+myData.Name+" "
                                    +myData.Surname+"\n"+"Должность: "+myData.Info+"."
                                    onClicked:info.visible=true
                                  }





                      }
            Text {
                id: name
                anchors{
                          verticalCenter:infobutton.verticalCenter
                          horizontalCenter: infobutton.horizontalCenter
                       }
                text: qsTr("Information")
                color:"white"
                font.pointSize:12
                font.family: "Californian FB";
                font.bold: true;
            }
            background: Rectangle{anchors.fill: parent;color: "#41aed9";radius: 6;}}


      //  Text{
      //        //anchors.centerIn: pagepath
      //        //anchors.leftMargin: 10
      //        color:"black";
      //        text:modelData.Country;
      //        font.pointSize:12.5
      //
      //      }
}


        transform: Rotation {
            axis { x: 0; y: 1; z: 0 }
            angle: rotationAngle
            origin.x: rotationOrigin
        }









       }//rectangle
//}//rect

 }//path




    MessageDialog{
                  id:info
                  icon:StandardIcon.Information
                  title:"Information table"
                 // icon:StandardIcon.Information
                  visible: false
                  modality: Qt.NonModal
                  text:""
                 //Rectangle{
                 //           id:background
                 //           anchors.fill: parent
                 //           color: "black"
                 //           gradient: Gradient {
                 //               GradientStop {
                 //                   position: 0.04;
                 //                   color: "#195fc0";
                 //               }
                 //               GradientStop {
                 //                   position: 0.44;
                 //                   color: "#2f89a4";
                 //               }
                 //               GradientStop {
                 //                   position: 1.00;
                 //                   color: "#2e9cd3";
                 //               }
                 //           }
                 //           opacity: 1}
                 //
                 //            Text {
                 //
                 //               anchors.centerIn: parent
                 //               id: information
                 //               text: info.text
                 //               font.family: "Arial Black"
                 //               font.bold: true
                 //               style: Text.Outline
                 //               font.pointSize: 14
                 //               color: "black"
                 //           }






       }//messagedialog

 // RowLayout{
 //      //       //y:pagepath/2
 //       //anchors.top:   pagepath.left
 //       //anchors.right: pagepath.top
 //       //anchors.left: pagepath.bottom
 //       spacing: 100//554

        Button {
           // anchors.bottom: pagepath.bottom
           // anchors.right: pagepath.right
            id:one



        //   Layout.fillHeight: true
        //   Layout.fillWidth: true
        //   Layout.minimumWidth: 60
        //   Layout.minimumHeight: 40
        //   anchors.horizontalCenter: pagepath.horizontalCenter
            width: 47
            height:50
                  x:pagepath.width-(pagepath.width-2)
                  y:pagepath.height/2.75
                  Text{
                       anchors.centerIn:parent
                       text:qsTr("<")
                       color: "white"
                       font.bold: true
                       font.pointSize: 20

                      }
                background:Rectangle{ color:"#255284" //"#0a1747"
                     opacity: 0.70
                     anchors.fill: parent;radius: 60;}


                  onClicked: view.decrementCurrentIndex()
                  }

    Button {

     //   Layout.fillHeight: true
     //   Layout.fillWidth: true
     //   Layout.minimumWidth: 60
     //   Layout.minimumHeight: 40
        id:two
        width: 47
        height:50
        x:pagepath.width-49
        y:pagepath.height/2.75


        Text{
             anchors.centerIn:parent
             text:qsTr(">")
             color: "white"
             font.bold: true
             font.pointSize: 20

            }

        background:Rectangle{color:"#255284" //: "#0a1747"
                             opacity: 0.70
                             anchors.fill: parent;radius: 60}

          onClicked: view.incrementCurrentIndex()

    }


   // }//rowlayout





}//Page


/*






         PathView{
                  id:itemsview
                 anchors.fill: pagepath
                //  anchors.horizontalCenter: pagepath.horizontalCenter
                //  anchors.verticalCenter: pagepath.verticalCenter
                  Layout.fillHeight: true
                  Layout.fillWidth: true
                  Layout.minimumWidth: 100
                  Layout.minimumHeight: 100
                  model:Astronaut.jsonmodel
                 // delegate: delegate
                 // path: itemspath
                  pathItemCount: 6
                  path: Path {
                            startX: 0
                            startY: pagepath / 2

                            PathPercent { value: 0.0 }
                            PathAttribute { name: "z"; value: 0 }
                            PathAttribute { name: "angle"; value: 60 }
                            PathAttribute { name: "origin"; value: 0 }
                            PathLine {
                                x: (itemsview.width - 200) / 2
                                y: itemsview.height / 2
                            }
                            PathAttribute { name: "angle"; value: 60 }
                            PathAttribute { name: "origin"; value: 0 }
                            PathPercent { value: 0.49 }
                            PathAttribute { name: "z"; value: 10 }


                            PathLine { relativeX: 0; relativeY: 0 }

                            PathAttribute { name: "angle"; value: 0 }
                            PathLine {
                                x: (itemsview.width - 300) / 2 + 300
                                y: itemsview.height / 2
                            }
                            PathAttribute { name: "angle"; value: 0 }
                            PathPercent { value: 0.51 }

                            PathLine { relativeX: 0; relativeY: 0 }

                            PathAttribute { name: "z"; value: 10 }
                            PathAttribute { name: "angle"; value: -60}
                            PathAttribute { name: "origin"; value: 300 }
                            PathLine {
                                x: itemsview.width
                                y: itemsview.height / 2
                            }
                            PathPercent { value: 1 }
                            PathAttribute { name: "z"; value: 0 }
                            PathAttribute { name: "angle"; value: -60 }
                            PathAttribute { name: "origin"; value: 300 }
                        }
                  delegate: Rectangle {
                              property real rotationAngle: PathView.angle
                              property real rotationOrigin: PathView.origin
                      Item {
                             id:comp
                          width: item.width
                          height: item.height
                          Column{
                                  id:item

                                  Rectangle {
                                         id: rect

                                         width: image.width
                                         height: image.height
                                         //anchors.horizontalCenter: delegate

                                         layer.enabled: true
                                         layer.effect: OpacityMask {
                                             maskSource: Item {
                                                 width: rect.width
                                                 height: rect.height
                                                 Rectangle {
                                                     anchors.centerIn: parent
                                                     width: rect.adapt ? rect.width : Math.min(rect.width, rect.height)
                                                     height: rect.adapt ? rect.height : width
                                                     radius: 20
                                                 }
                                             }
                                         }


                                  Image{
                                      id:image
                                       width: 84
                                       height: 84
                                       anchors.fill: rect
                                       source: modelData.Foto
                                       smooth:true
                                      }


                                 }

                                  Text{color:"white";text:modelData.Name;font.pointSize:12.5}
                                  Text{color:"white";text:modelData.Surname;font.pointSize:12.5}
                                  Text{color:"white";text:modelData.Country;font.pointSize:12.5}

                                }

                      }


                              transform: Rotation {
                                  axis { x: 0; y: 1; z: 0 }
                                  angle: rotationAngle
                                  origin.x: rotationOrigin
                              }


                          }


                  /*path: Path {
                            startX: 0
                            startY: height

                            PathAttribute { name: "size"; value: 20 }
                            PathAttribute { name: "opacity"; value: 0.5 }
                            PathCurve {
                                x: itemsview.width / 5
                                y: itemsview.height / 2
                            }
                            PathCurve {
                                x: itemsview.width / 5 * 2
                                y: itemsview.height / 4
                            }
                            PathPercent { value: 0.49 }
                            PathAttribute { name: "size"; value: 20 * 2 }
                            PathAttribute { name: "opacity"; value: 1 }
                            PathLine {
                                x: itemsview.width / 5 * 3
                                y: itemsview.height / 4
                            }
                            PathAttribute { name: "size"; value: 20 * 2 }
                            PathAttribute { name: "opacity"; value: 1 }
                            PathPercent { value: 0.51 }
                            PathCurve {
                                x: itemsview / 5 * 4
                                y: itemsview / 2
                            }
                            PathCurve {
                                x: itemsview.width
                                y: itemsview.height
                            }
                            PathPercent { value: 1 }
                            PathAttribute { name: "size"; value: 20 }
                            PathAttribute { name: "opacity"; value: 0.5 }
                        }*/

                 /*  path:  Path {//--> collapse
                             startX: 150; startY: 200
                             PathCubic { x: 50; y: 100; control1X: 100; control1Y: 200
                                                        control2X: 50; control2Y: 125 }
                             PathCubic { x: 150; y: 50; control1X: 50; control1Y: 75
                                                        control2X: 100; control2Y: 50 }
                             PathCubic { x: 250; y: 100; control1X: 200; control1Y: 50
                                                         control2X: 250; control2Y: 75 }
                             PathCubic { x: 150; y: 200; control1X: 250; control1Y: 125
                                                         control2X: 200; control2Y: 200 }

                         }*/
                  /*Path{
                        /*id:itemspath
                        startX: 150
                        startY: 200
                        PathAttribute {name: "iconScale"; value: 1.0}
                        PathAttribute {name: "iconOpacity"; value: 1.0}
                        PathQuad {x: 150; y: -35; controlX: 400; controlY: 80}
                        PathAttribute {name: "iconScale"; value: 0.3}
                        PathAttribute {name: "iconOpacity"; value: 0.3}
                        PathQuad {x: 150; y: 220; controlX: -100; controlY: 80}





                      }*/
























