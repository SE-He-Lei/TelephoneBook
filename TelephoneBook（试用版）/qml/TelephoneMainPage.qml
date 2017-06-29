import VPlayApps 1.0
Page {
    property alias childNavigationStack: globalNavStack
    property alias navigation: navigation

    NavigationStack {
        id: globalNavStack

        Page {

            navigationBarHidden: true



            Navigation {
                id: navigation

                navigationMode:
                    navigationModeTabs

                NavigationItem {
                    title: qsTr("Dial")
                    icon: IconType.phone
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
