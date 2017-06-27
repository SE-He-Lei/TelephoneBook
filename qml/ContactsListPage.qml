import QtQuick 2.4
import VPlayApps 1.0
import QtQuick.LocalStorage 2.0
import "Database.js" as JS
Item {



    anchors.fill: parent

    NavigationStack {
        id:stack
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

              model:MyModel{}/* [{ text: "Vensan" },
                { text: "Alice" },
                { text: "Joun" },
                { text: "Lily" },
                { text: "Rose" }]*/
//                    var model=[]
//                  for(var i=0;i<26;i++){
//                      var entry={

////                          text:JS.dbReadAll(),
////                          section:"Section:" +String.fromCharCode(65+i),
//                          letter:String.fromCharCode(65+i)
//                      }
//                      model.push(entry)
//                  }
//                  return model
//              }
              delegate:
                  SimpleRow{
                  text:name
                  detailText: telephone+" "

              }
                  /* Rectangle{
                  width: parent.width
                  height: width/10
                  border.width: 0.5

                  border.color: "green"
                  Text {
                      anchors.top:parent.top
                      anchors.topMargin: 15
                      anchors.left:parent.left
                      anchors.leftMargin: 10
                  font.pixelSize: sp(15)
                  text: name+"\n"/*+telephone*/
//              }
//            /*MyDelegate{}*/*/
              section.property: "section"
              section.criteria:ViewSection.FullString
//              SectionSelect{
//                  id:sectionSelcet
//                  anchors.right: parent.right
//                  target: listPage.listView
//                  sectionProperty: {
//                      for(var i=0;i<26;i++){

//                              letter:String.fromCharCode(65+i)

//                      }

//                  }
              }


//              onItemSelected: navigationStack.popAllExceptFirstAndPush(detailPageComponent, { title: "detail of contacts" })

//          }

      // page that will be displayed in the detail view when a list item is clicked
      Component {
        id: detailPageComponent
        Page {
          AppText {
              id:appText
            text: "name: "
            font.pixelSize: sp(20) // use sp for text (density independent)
            anchors.centerIn: parent

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


}

}

