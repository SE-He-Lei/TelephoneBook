import QtQuick 2.1
import VPlayApps 1.0


Item {
    anchors.fill: parent

    NavigationStack {
        id:stack
        splitView: tablet
        ListPage{
            title: "Setting"

            AppImage {
                id: backgroundImage
                anchors.fill: parent
                defaultSource: "../assets/7.jpg"
                opacity: 0.5
            }

            model: [
                { text: "My Information", icon: IconType.phone},
                {text:"Mystyle",icon:IconType.android}
            ]
            onItemSelected: {
                stack.popAllExceptFirstAndPush(detailPage)
            }
        }

        Component {
            id:detailPage

            Page{
                rightBarItem: TextButtonBarItem {
                    text: "OK"
                    onClicked: {
                        stack.pop(detailPage)
                    }
                }

                AppText{
                    id: myName
                    anchors.top: parent.top
                    anchors.topMargin:10
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    text: qsTr("Name: ")
                }
                AppTextField{
                    id: nameField
                    anchors.top: parent.top
                    anchors.topMargin: 50
                    anchors.left: myName.right
                    anchors.leftMargin:5
                    font.pixelSize: sp(18)
                }

                AppText{
                    id: myNumber
                    anchors.top: myName.bottom
                    anchors.topMargin:50
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    text: qsTr("My PhoneNumber: ")
                }
                AppTextField{
                    id: numberField
                    anchors.top: nameField.bottom
                    anchors.topMargin:10
                    anchors.left: myNumber.right
                    anchors.leftMargin: 5
                    font.pixelSize: sp(18)
                }

                AppText{
                    id: myAddress
                    anchors.top: myNumber.bottom
                    anchors.topMargin:50
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    text: qsTr("My Address: ")
                }
                AppTextField{
                    id: addressField
                    anchors.top: numberField.bottom
                    anchors.topMargin:50
                    anchors.left: myAddress.right
                    anchors.leftMargin: 5
                    font.pixelSize: sp(18)
                }
            }
        }
    }
}

