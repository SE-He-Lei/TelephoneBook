import QtQuick 2.4
import VPlayApps 1.0


Item {
    id: dialListPage
    anchors.fill: parent


    NavigationStack{
        id:dialstack
        signal setphonenumber(string defaultphonenumber)
        ListPage{
            title: "Dial"
            id:page

            AppImage {
                id: backgroundImage
                anchors.fill: parent
                defaultSource: "../assets/4.jpg"
                opacity: 0.7
            }
//            opacity: 0.6
            //some JS array as list model

            model: [
                {icon:IconType.phone,  text: "Vensan ", detailText: "13668452172"}, {icon:IconType.phone ,text: "Joe", detailText: "18875042510"},{icon: IconType.phone,text:"Mary",detailText:"18723754507"}]

            // define the SwipeOptionsContainer as delegate

            delegate: SwipeOptionsContainer {
                id: container

                SimpleRow {             //actual content to be displayed in the list rows
                    id: row
                }

                rightOption:
                    Row{
                    SwipeButton {  //left options, displayed when swiped list row to the right
                        id:envelpoe
                        icon: IconType.envelope
                        height: row.height
                        width: height/2

                        onClicked: {
                            container.hideOptions()
                            //hide automatically when button clicked
                            dialstack.push(messagepage)
                            dialstack.setphonenumber(row.item.detailText)

                        }

                    }
                    SwipeButton{
                        id:deleter
                        height:row.height
                        width: height/2
                        icon:IconType.trash
                        onClicked: {
                            container.hideOptions()
                            page.model.splice(0,1)
                            page.modelChanged()
                        }
                    }
                }

            }
            KeyBoard{}

        }
        Component{
             id:messagepage

            Page{
              title: "New Message"

              Row{
                  spacing: 10
                  Text {
                      id: receiver
                      text: qsTr("receiver:")
                      font.pixelSize: 25
                  }
                  AppTextField{
                      id:phonenumber
                      height: 28
                      borderWidth: 1
                      borderColor: "green"
                      text:""

                  }
                  Connections{
                      target: dialstack
                      onSetphonenumber:{
                          phonenumber.text+=defaultphonenumber

                      }
                  }

              }

             AppTextField{
                 id:textarea
                 placeholderText: "Please enter text"
                 anchors.bottom: parent.bottom
                 width: parent.width-80
             }
             AppButton{
                 id:sendbutton
                 text:"Send"
                 width: 70
                 height: textarea.height
                 anchors.right: parent.right
                 anchors.bottom: parent.bottom
                 onClicked: {

                 }

               }

           }
        }
    }

}





