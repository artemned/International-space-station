import QtQuick 2.0
import QtGraphicalEffects 1.0

import "qrc:/Astronaut.js" as Astronaut







Component{
              id:delegate


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

           }


