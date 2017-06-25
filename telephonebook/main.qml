import VPlayApps 1.0
import QtQuick 2.5
import QtGraphicalEffects 1.0

App {
    id: app

    onInitTheme: {
        Theme.colors.tintColor = "lightgreen"
    }

    TelephoneMainPage { }

}
