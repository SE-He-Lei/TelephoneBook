import QtQuick 2.4
import VPlayApps 1.0
import QtQuick.LocalStorage 2.0
import "Database.js" as JS
Item {



    anchors.fill: parent

    NavigationStack {
        id:stack
        signal detailinfo(var index)
        splitView: tablet
            ListPage {
                id:listPage
//              title: "Contacts"
              SearchBar {
                id: searchBar

                onAccepted: {

                }
              }

                 rightBarItem:IconButtonBarItem{

               icon:IconType.plus
                 onClicked: {
                     storedialog.open()


                     }
                 }


              model:MyModel{id:mymodel}
              delegate:
                  SimpleRow{
                  id:simplerow
                  text:name
                  detailText: telephone
                  onSelected: {
                     stack.detailinfo(index)

                      stack.push(detailPageComponent)

                  }
              }
              section.property: "type"
              section.delegate: SimpleSection{id:simplesection}
              SectionSelect{
                  id:sectionselcet
                  anchors.right: parent.right
                  target: listPage.listView
              }




      // page that will be displayed in the detail view when a list item is clicked
      Component {
        id: detailPageComponent


        Page {
            Connections{
                target: stack

                onDetailinfo:{
                 console.log(index)
                }
            }

            rightBarItem:TextButtonBarItem{
                text:"OK"
                onClicked: {
                    stack.pop(detailPageComponent)
                }
            }
            leftBarItem: TextButtonBarItem{
                text:"Delete"
                onClicked: {
                }
            }
            Column{
                spacing: 20
            Row{
            AppImage{
                width: 60
                height: 60
                source: "../assets/linkman.jpg"
            }
            AppTextField{
                id:detailname
                text:""
            }
          }
            Row{
                AppImage{
                    width: 60
                    height: 60
                    source: "../assets/telephone.jpg"
                }
                AppTextField{
                    id:detailtelephone
                    text:""
                }
            }
          }
        }
     }
      Dialog
      {
          id:storedialog
          Column{
              AppCheckBox{
                  id:phonestore
                  icon:IconType.phone
                  text:"PhoneStore"
              }
              AppCheckBox{
                  id:cardstore
                  icon:IconType.minuscircle
                  text:"Cardstore"
              }
          }
          onCanceled: storedialog.close()
          onAccepted: {
              storedialog.close()
              stack.push(addlinkmanpage)

          }
      }

     Component{
         id:addlinkmanpage
         Header{
             id:input
         }
     }
     Component.onCompleted: {
         JS.dbInit()
     }
    }
  }
}

