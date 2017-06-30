import QtQuick 2.0
import VPlayApps 1.0

Page{
    title: "New Message"
    signal text(var text)
    Row{
        spacing: 10
        Text {
            id: receiver
            text: qsTr("receiver:")
            font.pixelSize: 25
        }
        AppTextField{
            id:phonenumber
            height: 28
            borderWidth: 1
            borderColor: "green"
            text:""

        }

    }

}


