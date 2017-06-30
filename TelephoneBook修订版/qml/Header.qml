import QtQuick 2.7
import VPlayApps 1.0
import QtQuick.LocalStorage 2.0
import "Database.js" as JS

Page {
    id:addlinkman
    function setlistview() {

        listPage.listView.model.setProperty(listPage.listView.currentIndex,"name",nameinput.text)
        listPage.listView.model.setProperty( listPage.listView.currentIndex, "telephone",
                                            numberinput.text)
        listPage.listView.model.setProperty(listPage.listView.currentIndex, "type",nameinput.text.substring(0,1).toUpperCase())

    }
    function insertrec() {

        var rowid=     parseInt(JS.dbInsert(nameinput.text,numberinput.text,nameinput.text.substring(0,1)).toUpperCase(), 10)
         console.log(rowid)

        listPage.listView.model.setProperty(listPage.listView.currentIndex, "id", rowid)
        listPage.listView.forceLayout()


    }

    function editrec(Pname, Ptelephone) {
        nameinput.text = Pname
        numberinput.text = Ptelephone

    }
    function initrec_new(){

        listPage.listView.model.insert(0,{name:"",telephone:"",type:""})


    }

    Page{
        id: newLinkman
        title: "New linkman"
        Column{
            Row{
                spacing: 200
                AppButton{
                    text: "Cancel"

                    onClicked: {
                        stack.pop(addlinkmanpage)

                    }
                }
                AppButton{
                    text:"Ok"

                    onClicked: {
                               listPage.listView.currentIndex=0
                        if(listPage.listView.currentIndex!=-1){
                              insertrec()
                              setlistview()
                            mymodel.clear()
                            JS.dbReadAllagin()
                        }
                        stack.pop(addlinkmanpage)
                    }
                }
            }
            Row{
                AppImage{
                    source: "../assets/linkman.jpg"
                    width: 40
                    height: 40
                }
                AppTextField{
                    id:nameinput
                    placeholderText: "Name"
                }

            }
            Row{
                AppImage{
                    source:"../assets/telephone.jpg"
                    width: 40
                    height: 40

                }
                AppTextField{
                    id:numberinput
                    placeholderText: "Number"
                }
            }
        }
    }
    Component.onCompleted: {
        JS.dbInit()
    }
}







