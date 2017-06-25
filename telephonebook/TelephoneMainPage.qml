import VPlayApps 1.0

Page {
    property alias childNavigationStack: globalNavStack
    property alias navigation: navigation

    NavigationStack {
        id: globalNavStack

        Page {
//            navigationBarHidden:Theme.isAndroid

//            title: navigation.currentNavigationItem ? navigation.currentNavigationItem.title : ""
            navigationBarHidden: true

//            rightBarItem: IconButtonBarItem{
//                icon: IconType.plus
//                onClicked: InputDialog.inputTextMultiLine(app,qsTr("Add New Contact"), qsTr("enter the contact"),function(ok){
//                    if(ok){
//                        DetailPage.add();
//                    }
//                })
//            }

            Navigation {
                id: navigation

                navigationMode:
                    navigationModeTabs

                NavigationItem {
                    title: qsTr("Dial")
                    icon: IconType.clocko
                    DialListPage{}

                }

                NavigationItem {
                    id: peopleItem
                    title: qsTr("contacts")
                    icon: IconType.list

                    ContactsListPage{}
                }

                NavigationItem {
                    id: groupItem
                    title: qsTr("Groups")
                    icon: IconType.group
                    GroupsListPage{}
                }


                NavigationItem {
                    id: personItem
                    title: qsTr("Me")
                    icon: IconType.cog

                    PersonSettingPage{}
                }
            }
        }
    }
}
