import QtQuick 2.14
import QtQuick.Controls 2.14
import QtWebView 1.1
import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import "qrc:/Astronaut.js" as Astronaut
import QtWebView 1.1
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.3


Page {

        id:page
        title:qsTr("Astronaut")
        width: 360
        height:589               // width: 720
                                 // height: 1000
        property int minDim: Math.min(width,height)
        property int orientation: Screen.primaryOrientation
        onOrientationChanged:
    {


           if(orientation === Qt.LandscapeOrientation ||
                   orientation === Qt.InvertedLandscapeOrientation)
             {

               page.width =674
               page.height=252.5
              console.log("change")

             }
              else if (orientation === Qt.PortraitOrientation ||
                       orientation ===Qt.InvertedPortraitOrintation)
            {

               page.width =360
               page.height=589
               console.log("changePortr")

            }

    }


        background: Rectangle{
                               anchors.fill: parent
                               color: "lightgreen"
                               opacity: 0.7

                             }





    Component{//Delegate

       id:delegate
       Item {
           id: item
           width:page.width
           height: 90
           anchors.margins:5

           Behavior on x { SpringAnimation {easing.type: Easing.InSine; spring: 5;
                   epsilon: 0.30; damping: 0.70}

                         }

           states:[ State {
                          name: "Font1"
                          when: item.ListView.isCurrentItem
                          PropertyChanges { target: item; x: 5}

                          PropertyChanges { target: row;spacing: 8 }
                          PropertyChanges { target: column; spacing: 8}
                          PropertyChanges { target: name;  font.pointSize: 16}
                        //  PropertyChanges { target: name;  color:"black"}
                          PropertyChanges { target: surname;  font.pointSize: 16}
                        //  PropertyChanges { target: surname;  color:"black"}
                          PropertyChanges { target: country;  font.pointSize: 15}
                        //  PropertyChanges { target: country;  font.bold: true}
                          //PropertyChanges { target: name;  font.bold: true}
                        PropertyChanges { target: country;  color:"black"}

                      },

                      State{
                             name:"Font2"
                             when:item.ListView.isCurrentItem
                             PropertyChanges { target: row;spacing: 3 }
                             PropertyChanges { target: column; spacing: 3}
                             PropertyChanges { target: name;  font.pointSize: 14}
                             PropertyChanges { target: surname;  font.pointSize: 14}
                             PropertyChanges { target: country;  font.pointSize: 14}
                          //  PropertyChanges { target: country;  font.bold: false}
                             // PropertyChanges { target: name;  font.bold: false}
                            }

                     ]

                      //transitions: Transition {
                          //NumberAnimation { properties: "x"; duration: 400 }
                            //                    }
                      transitions:[

                                           Transition {
                                                    NumberAnimation { properties: "x"; duration: 400 }
                                                                          },

                             Transition {
                              from:"Font1"
                              to: "Font2"
                              PropertyAnimation{
                                                 target:row;
                                                 properties:"spacing";
                                              easing.type: Easing.InSine;
                                                 duration: 400
                                               }

                              PropertyAnimation{
                                                 target:column;
                                                 properties:"spacing";
                                               easing.type: Easing.InSine;
                                                 duration: 400
                                               }
                              PropertyAnimation{
                                                 target:name;
                                                 properties:"font.pointSize";
                                             easing.type: Easing.InSine;
                                                 duration: 400
                                               }
                              PropertyAnimation{
                                                 target:surname;
                                                 properties:"font.pointSize";
                                            easing.type:  Easing.InSine;
                                                 duration: 400
                                               }
                              PropertyAnimation{
                                                 target:country;
                                                 properties:"font.pointSize";
                                               easing.type: Easing.InSine;
                                                 duration: 400
                                               }
                               },
                          Transition {
                                  from:"Font2"
                                  to: "Font1"
                                  PropertyAnimation{
                                                     target:row;
                                                     properties:"spacing";
                                                    easing.type:  Easing.InSine;
                                                     duration: 400
                                                   }

                                  PropertyAnimation{
                                                     target:column;
                                                     properties:"spacing";
                                                    easing.type: Easing.InSine;
                                                     duration: 400;
                                                   }
                                  PropertyAnimation{
                                                     target:name;
                                                     properties:"font.pointSize";
                                                  easing.type: Easing.InSine;
                                                     duration: 400
                                                   }
                                  PropertyAnimation{
                                                     target:surname;
                                                     properties:"font.pointSize";
                                                   easing.type: Easing.InSine;
                                                     duration: 400
                                                   }
                                  PropertyAnimation{
                                                     target:country;
                                                     properties:"font.pointSize";
                                                   easing.type: Easing.InSine;
                                                     duration: 400
                                  }

                              }


                      ]







           MouseArea {
                          anchors.fill: parent
                          onClicked: {item.ListView.view.currentIndex = index
                                      item.state ="Font1"
                                     }

                      }

           Button{
                   width:30
                   height:35
                  // anchors.left: 350
                   anchors.horizontalCenter: item.horizontalCenter
                   anchors.verticalCenter: item.verticalCenter
                 //  anchors.topMargin: 3
                   //anchors.bottomMargin: 3

                   Text {
                          anchors.centerIn: parent
                          text: qsTr("Info")
                          font.pointSize: 10
                          font.family: "Italic"
                          font.italic: true
                        }
                   //smooth: true
                  // visible: true
                 background:  Rectangle{
                              anchors.fill: parent
                              color:"lightgreen"
                              radius: 5

                            }
                   MouseArea{
                              anchors.fill: parent
                              onClicked:info.visible=true
                            }

                 }

          Text{
                color: "white"
                text:modelData.AstronautId
                font.pointSize: 14
                anchors.right:item.right
                anchors.bottom: item.bottom
                anchors.rightMargin: 7
                anchors.bottomMargin: 7
              }

          Text{
                id:country
                anchors.right:item.right
                anchors.top: item.top
                anchors.rightMargin: 10
                anchors.topMargin:10
                color: "white"
                text:modelData.Country
                font.pointSize: 14
                Behavior on font.pointSize {
             SpringAnimation {easing.type: Easing.InCirc; spring: 2.5;
                 velocity:4;epsilon: 0.30; damping: 0.15}

                                }


               }


          Row{
                id:row

               anchors.verticalCenter: parent.verticalCenter
               spacing: 5


               Rectangle {
                      id: rect

                      width: image.width
                      height: image.height


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




               Column{
                         id:column

                       Text{
                             id:name
                             color: "white"
                             text:modelData.Name
                             font.pointSize: 14
                            Behavior on font.pointSize {
                            SpringAnimation {easing.type: Easing.InCirc; spring: 2.5;
                             velocity:4;epsilon: 0.30; damping: 0.15}

                                            }

                           }
                   Text{
                             id:surname
                             color: "white"
                             text:modelData.Surname
                             font.pointSize: 14
                            Behavior on font.pointSize {
                            SpringAnimation {easing.type: Easing.InCirc; spring: 2.5;
                             velocity:4;epsilon: 0.30; damping: 0.15}

                                            }


                           }
                            spacing: 5


                     }


             }
       }
   }




    Component {
          id: highlightBar
          Rectangle {
              id:higrect
              width: page.width; height: 90
              color: "#2087a6"
              radius: 5
              opacity:0.48
              y: list.currentItem.y;


              Behavior on y { SpringAnimation {easing.type: Easing.InSine; spring: 7; damping: 1.4}

                            }

          }
      }



ScrollBar{}




    ListView{

          id:list
          anchors.horizontalCenter: page
          clip:true
          anchors.verticalCenter: page
          topMargin:7.32
          focus:true

          highlight:highlightBar

          highlightFollowsCurrentItem: false
          anchors.fill: parent
          ScrollBar.vertical: ScrollBar{
                                          interactive: true

                                        }

          model:Astronaut.jsonmodel
          delegate:delegate


     }

  MessageDialog{
                 id:info
               //  width: page.minDim/2
                 //height: width
                 title: "Info Astrounat"
                 visible: false
                 modality: Qt.NonModal
                 text:"Бортинженер"//modelData.Info


                 //
               }







}
