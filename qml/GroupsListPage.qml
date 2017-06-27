import QtQuick 2.4
import QtQuick.Controls 1.2

import VPlayApps 1.0

Item {
    anchors.fill: parent

    NavigationStack {
        splitView: tablet
        initialPage: mainPage
    }

    property Component mainPage: ListPage{
            title: "Group"
        model: [
        { text: "Friend"},
            {text: "Family"},
            {text: "Colleague"},
            {text: "Student"},
            {text: "Important person"}
        ]

//        section.property: "group"
        onItemSelected: {
            navigationStack.popAllExceptFirstAndPush(detailPage)
        }
    }

    property  Component detailPage: ListPage{

    }
}

