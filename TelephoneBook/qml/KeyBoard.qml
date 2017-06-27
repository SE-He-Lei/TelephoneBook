import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

//Item{
//    id:keyboardPage

    Rectangle{
        id:keyboard
        width:dialListPage.width
        height:dialListPage.height/2
        x: dialListPage.x
        y: dialListPage.y + (dialListPage.height - height)
        anchors.bottomMargin: 5

        TextField{
            id: dialNumber
            width: parent.width - 120
            height: 50
            font.pixelSize: 15
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 3
            anchors.leftMargin: 10
            focus: false
            visible: false
        }
            Button{
                id: deletebutton
                text: "delete"
                anchors.left: dialNumber.right
                anchors.leftMargin: 5
                onClicked: dialNumber.text = ""
            }

        color: "lightgreen"
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
                id: starbutton
                text: "*"
                onClicked: dialNumber.text += text
            }
        }
    }

//}
