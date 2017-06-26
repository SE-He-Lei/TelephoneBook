import QtQuick 2.4
import VPlayApps 1.0


Item {
    anchors.fill: parent


    NavigationStack{
        id:stack
         signal setphonenumber(string defaultphonenumber)
        ListPage{
            title: "Dial"
            id:page

            //some JS array as list model

            model: [

                {icon:IconType.phonesquare   ,  text: "Vensan ", detailText: "13668452172"}, {icon:IconType.phone ,text: "Joe", detailText: "18875042510"}]

            // define the SwipeOptionsContainer as delegate



            delegate: SwipeOptionsContainer {
                id: container

                SimpleRow {                         //actual content to be displayed in the list rows
                    id: row
                }

                rightOption:
                    Row
                {

                    SwipeButton {           //left options, displayed when swiped list row to the right

                        id:envelpoe
                        icon: IconType.envelope
                        height: row.height
                        width: height/2

                        onClicked: {


                            container.hideOptions()
                            //hide automatically when button clicked
                            stack.push(messagepage)
                            stack.setphonenumber(row.item.detailText)

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
                  target: stack
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





