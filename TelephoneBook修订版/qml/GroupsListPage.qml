import QtQuick 2.4
import QtQuick.Controls 1.2

import VPlayApps 1.0

Item {
    anchors.fill: parent

    NavigationStack {
        id: groupStack
        splitView: tablet
        ListPage{
            id: groupListPage

            AppImage {
                id: backgroundImage
                anchors.fill: parent
                defaultSource: "../assets/7.jpg"
                opacity: 0.5
            }

            rightBarItem: IconButtonBarItem {
                icon: IconType.plus
                onClicked: InputDialog.inputTextMultiLine(app,
                                                          qsTr("New group"),
                                                          qsTr("Enter text..."),
                                                          function(ok, text) {
                                                              if(ok) groupModel.append(text)
                                                          })
            }

            model:[
                { text: "Friend"},
                {text: "Family"},
                {text: "Colleague"},
                {text: "Student"},
                {text: "Important person"}
            ]
            onItemSelected: groupStack.popAllExceptFirstAndPush(groupPageComponent,{title: model.text})

            Component{
                id: groupPageComponent
                Page{
                    rightBarItem:IconButtonBarItem{
                        icon:IconType.plus
                        onClicked: {
                            adddialog.open()
                        }
                    }

                    Dialog{
                        id:adddialog
                        title: "Add new group member"
                        onCanceled: adddialog.close()

                    }
                }
            }
        }
    }
}
