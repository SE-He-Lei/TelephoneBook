import QtQuick 2.1
import VPlayApps 1.0

Item {
    anchors.fill: parent

    NavigationStack {
        splitView: tablet
        initialPage: mainPage
    }

    property Component mainPage: ListPage{
            title: "Setting"
        model: [
        { text: "My PhoneNumber", icon: IconType.phone, /*group: "Connection"*/},
            {text: "Address", icon:IconType.home, /*group:"Connection"*/},
            {text: "Apperence", icon:IconType.cloud, /*group: "Connection"*/}
        ]

//        section.property: "group"
        onItemSelected: {
            navigationStack.popAllExceptFirstAndPush(detailPage)
        }
    }

    property  Component detailPage: ListPage{

    }
}
