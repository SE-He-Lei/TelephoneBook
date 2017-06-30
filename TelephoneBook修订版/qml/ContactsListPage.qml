import QtQuick 2.4
import VPlayApps 1.0
import QtQuick.LocalStorage 2.0
import "Database.js" as JS
Item {
    id: contact
    anchors.fill: parent

    NavigationStack {
        id:stack
        signal detailinfo(var index)
        property int clickone
        splitView: tablet
        ListPage {
            id:listPage

            AppImage {
                id: backgroundImage
                anchors.fill: parent
                defaultSource: "../assets/4.jpg"
                opacity: 0.5
            }

            SearchBar{
                id: searchBar
                onAccepted: {
                    mymodel.clear()
                    JS.dbsearch(text)
                    if(!text){
                        JS.dbReadAllagin()
                    }
                }
            }

            rightBarItem:IconButtonBarItem{

                icon:IconType.plus
                onClicked: {
                    stack.push(addlinkmanpage)
                }
            }

            model:MyModel{id:mymodel}
            delegate:
                SimpleRow{
                id:simplerow
                text:name
                detailText: telephone
                IconButton{
                    icon: IconType.phone
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    anchors.right: parent.right
                    anchors.rightMargin: 25
                    size: 35
                    color: "black"
                    onClicked: {
                        Qt.openUrlExternally('tel:'+ telephone)
                    }
                }

                onSelected:{
                    stack.push(detailPageComponent)
                    stack.detailinfo(index)
                }
            }
            section.property: "type"
            section.delegate: SimpleSection{id:simplesection}
            SectionSelect{
                id:sectionselcet
                anchors.right: parent.right
                target: listPage.listView
            }

            // page that will be displayed in the detail view when a list item is clicked
            Component {
                id: detailPageComponent
                Page {
                    Connections{
                        target: stack
                        onDetailinfo:{
                            detailname.text=mymodel.get(index).name
                            detailtelephone.text=mymodel.get(index).telephone
                            stack.clickone=index
                        }
                    }
                    rightBarItem:TextButtonBarItem{
                        text:"OK"
                        onClicked: {
                             if(detailname.text!==mymodel.get(stack.clickone).name||detailtelephone.text!==mymodel.get(stack.clickone).telephone
                                     ) {
                                 mymodel.get(stack.clickone).name=detailname.text
                                 mymodel.get(stack.clickone).telephone=detailtelephone.text
                                 JS.dbUpdate(detailname.text,detailtelephone.text,detailname.text.substring(0,1).toUpperCase(),mymodel.get(stack.clickone).id)

                             }

                            stack.pop(detailPageComponent)
                        }
                    }
                    leftBarItem: TextButtonBarItem{
                        id:deletebar
                        text:"Delete"

                        onClicked:{

                            JS.dbDeleteRow(mymodel.get(stack.clickone).id)
                            mymodel.remove(stack.clickone,1)
                            if(listPage.listView.count==0){

                                listPage.listView.currentIndex=-1
                            }
                            stack.pop(detailPageComponent)
                        }
                    }
                    Column{
                        spacing: 20
                        Row{
                            AppImage{
                                width: 60
                                height: 60
                                source: "../assets/linkman.jpg"
                            }
                            AppTextField{
                                id:detailname
                                text:""
                            }
                        }
                        Row{
                            AppImage{
                                width: 60
                                height: 60
                                source: "../assets/telephone.jpg"
                            }
                            AppTextField{
                                id:detailtelephone
                                text:listPage.listView.model.get(listPage.listView.currentIndex).telephone
                            }
                        }
                    }
                }
            }

            Component{
                id:addlinkmanpage
                Header{
                    id:input
                }
            }
            Component.onCompleted: {
                JS.dbInit()
            }
        }
    }
}

