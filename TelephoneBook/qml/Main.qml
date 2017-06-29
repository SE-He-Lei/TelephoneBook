import VPlayApps 1.0
import QtQuick 2.5

App {
    id: app

    onInitTheme: {
        Theme.colors.tintColor = "lightgreen"
        Theme.colors.textColor = "red"

    }

    TelephoneMainPage { }

}

