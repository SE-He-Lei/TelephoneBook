import QtQuick 2.4
import VPlayApps 1.0

Item {
    anchors.fill: parent

//    NavigationStack {
//        splitView: tablet
//        initialPage: mainPage
//    }
    NavigationStack{
        ListPage {
            //some JS array as list model
            model: [{text: "Vensan ", detailText: "13668452172"}, {text: "Joe", detailText: "18875042510"}]

            // define the SwipeOptionsContainer as delegate
            delegate: SwipeOptionsContainer {
              id: container

              SimpleRow {                         //actual content to be displayed in the list rows
                id: row
              }

              leftOption: SwipeButton {           //left options, displayed when swiped list row to the right
//                text: "Option"
                icon: IconType.phone + "  "+ IconType.envelope
                height: row.height
                onClicked: {
                  row.item.text = "Option clicked"
                  row.itemChanged()
                  container.hideOptions()         //hide automatically when button clicked
                }
              }

              rightOption: AppActivityIndicator { //right options, displayed when swiped list row to the left
                height: row.height
                width: height
              }
            } // SwipeOptionsContainer
          } // ListPage

    }

//        PageControl {
//            pages: 3
//            anchors.right: parent.right
//            indicatorSize: dp(15)
//            pageIcons: ({
//                            0: IconType.search,
//                            2: IconType.home
//                        })
//        }

//    property Component mainPage: ListPage{
//        title: "Recent"
//        model: [
//            {text: "  Vensan", icon: IconType.phone + "  "+ IconType.envelope},
//            {text: "  Mary", icon: IconType.phone + "  "+ IconType.envelope},
//            {text: "  Alice", icon: IconType.phone + "  "+ IconType.envelope}
//        ]

//        onItemSelected: {
//            navigationStack.popAllExceptFirstAndPush(detailPage)
//        }
//        property  Component detailPage: ListPage{

//        }
//    }

}
