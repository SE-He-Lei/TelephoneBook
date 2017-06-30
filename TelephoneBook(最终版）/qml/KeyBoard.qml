import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import VPlayApps 1.0


Rectangle{
    id:keyboard
    width:dialListPage.width
    height:dialListPage.height/2
    x: dialListPage.x
    y: dialListPage.y + (dialListPage.height - height)
    anchors.bottomMargin: 5
    color: "orange"

    gradient: Gradient{
        GradientStop{ position: 0.0; color:"lightgreen"}
        GradientStop{ position: 0.33; color: "orange"}
        GradientStop{ position: 1.0; color: "lightgreen"}
    }

    TextField{
        id: dialNumber
        width: parent.width - 120
        height: 40
        font.pixelSize: 15
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 3
        anchors.leftMargin: 10
        visible: false
    }
    Button{
        id: deleteButton
        text: "delete"
        anchors.top: parent.top
        anchors.topMargin: 3
        anchors.left: dialNumber.right
        anchors.leftMargin: 5
        onClicked: dialNumber.text = ""
    }

    IconButton{
        id: phoneButton
        icon: IconType.phone
        size: 30
        anchors.top: deleteButton.bottom
        anchors.topMargin: 5
        onClicked: {
            Qt.openUrlExternally('tel:'+ dialNumber.text)
        }
    }

    IconButton{
        id:messageButton
        icon:IconType.envelope
        size: 30
        anchors.top:phoneButton.bottom
        anchors.topMargin: 5
        onClicked: {
            dialstack.push(messagepage)
        }
    }

    GridLayout{
        columns: 3
        rows:4
        anchors.centerIn: parent
        Button{
            id: button9
            text:"9"
            onClicked: {
                dialNumber.visible=true
                dialNumber.text += text

            }
        }

        Button{
            id: button8
            text:"8"
            onClicked:
            {
                dialNumber.visible=true
                dialNumber.text += text
            }
        }

        Button{
            id: button7
            text:"7"
            onClicked:
            {
                dialNumber.visible=true
                dialNumber.text += text
            }
        }

        Button{
            id:button6
            text: "6"
            onClicked:
            {
                dialNumber.visible=true
                dialNumber.text += text
            }
        }

        Button{
            id: button5
            text: "5"
            onClicked:
            {
                dialNumber.visible=true
                dialNumber.text += text
            }
        }

        Button{
            id: button4
            text: "4"
            onClicked:
            {
                dialNumber.visible=true
                dialNumber.text += text
            }
        }

        Button{
            id: button3
            text: "3"
            onClicked:
            {
                dialNumber.visible=true
                dialNumber.text += text
            }
        }

        Button{
            id: button2
            text: "2"
            onClicked:
            {
                dialNumber.visible=true
                dialNumber.text += text
            }
        }

        Button{
            id: button1
            text: "1"
            onClicked:
            {
                dialNumber.visible=true
                dialNumber.text += text
            }
        }

        Button{
            id: button
            text: "#"
            onClicked: dialNumber.text += text
        }

        Button{
            id: button0
            text: "0"
            onClicked:
            {
                dialNumber.visible=true
                dialNumber.text += text
            }
        }

        Button{
            id: starButton
            text: "*"
            onClicked: dialNumber.text += text
        }

    }
    Component{
        id:messagepage

        Page{
            title: "New Message"

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
                    text:dialNumber.text

                }
            }
            AppTextField{
                id:textarea
                placeholderText: "Please enter text"
                anchors.bottom: parent.bottom
                width: parent.width-80
            }
            AppButton{
                id:sendbutton
                text:"Send"
                width: 70
                height: textarea.height
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                onClicked: {

                }

            }
        }
    }
}
