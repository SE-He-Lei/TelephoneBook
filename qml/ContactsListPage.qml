import QtQuick 2.4
import VPlayApps 1.0

Item {
    anchors.fill: parent

    NavigationStack {
        splitView: tablet
//        initialPage: mainPage


            ListPage {
              title: "Contacts"
              SearchBar {
                id: searchBar
                onAccepted: {

                }
              }
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



}


