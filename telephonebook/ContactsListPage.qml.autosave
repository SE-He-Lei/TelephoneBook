import QtQuick 2.4
import VPlayApps 1.0

Item {
    anchors.fill: parent

    NavigationStack {
        splitView: tablet
//        initialPage: mainPage

            ListPage {
              title: "Contacts"
              id: contact
              model: [{ text: "Vensan" },
                { text: "Alice" },
                { text: "Joun" },
                { text: "Lily" },
                { text: "Rose" }]
              onItemSelected: navigationStack.popAllExceptFirstAndPush(detailPageComponent, { title: "detail of contacts" })
            }
          }

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

//        Page {
////          title: "SearchBar Example"

//          SearchBar {
//            id: searchBar
//            target: listView
//            pullEnabled: true
//            onAccepted: {
//              console.log("search accepted: "+text)

//              // if the search bar is not empty, we prevent it from disappearing
//              if(text !== "") {
//                searchBar.keepVisible = true
//                listView.model = 2 // update result
//              }
//              else {
//                // initial settings
//                searchBar.keepVisible = false
//                listView.model = 50
//              }
//            }
//          }

//          AppListView {
//            id: listView
//            height: parent.height - y // the search bar modifies the y-position of the list
////            model: 50
////            delegate: SimpleRow { text: "Entry "+index }
//          }

//        } // Page
//    }

//    property Component mainPage: ListPage{
//        title: "Contacts"
//        model: [
//            { text: "Mary",
//                text:"12345678910"},
//            {text: "Alice",
//                text:"23015684970"},
//            {text: "Vensan",
//                text: "180235629210"}
//        ]

//        //        section.property: "group"
//        onItemSelected: {
//            navigationStack.popAllExceptFirstAndPush(detailPage)
//        }
//    }

//    property  Component detailPage: ListPage{

//    }

}


