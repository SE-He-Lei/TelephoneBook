import QtQuick 2.1
import VPlayApps 1.0

Item {
    anchors.fill: parent

    NavigationStack {
        id:stack
        splitView: tablet
        ListPage{
            title: "Setting"
            model: [
                { text: "My Information", icon: IconType.phone},
                {text: "Address", icon:IconType.home, /*group:"Connection"*/},
                {text: "Apperence", icon:IconType.cloud, /*group: "Connection"*/}
            ]

            //        section.property: "group"
            onItemSelected: {
                navigationStack.popAllExceptFirstAndPush(detailPage)
            }
        }
//        Component.onCompleted: {
//            JS.dbInit();
//            JS.dbReadAll();
//        }

    }

    property  Component detailPage: Page{
        id: settingDetail
        rightBarItem: TextButtonBarItem {
          text: "OK"
//          onClicked: {
//              stack.pop(detailPage)
//          }
        }
        Column{
            spacing: 50
            Row{
                AppText{
                    id: myname
                    text: qsTr("Name: ")
                }
                AppTextField{
                    font.pixelSize: sp(18)
                }
            }

            Row{
                AppText{
                    id: myNumber
                    text: qsTr("My PhoneNumber: ")
                }
                AppTextField{
                    font.pixelSize: sp(18)
                }
            }

            Row{
                AppText{
                    text: qsTr("My Address: ")
                }
                AppTextField{
                    font.pixelSize: sp(18)
                }
            }
        }
    }
}
