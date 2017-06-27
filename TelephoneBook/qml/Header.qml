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
        var rowid = parseInt(JS.dbInsert(nameinput.text,numberinput.text,nameinput.text.substring(0,1)), 10)

        if (rowid) {
            listPage.listView.model.setProperty(listPage.listView.currentIndex, "id", rowid)
            listPage.listView.forceLayout()
        }
        return rowid;
    }

    function editrec(Pname, Ptelephone) {
        nameinput.text = Pname
        numberinput.text = Ptelephone

    }
    function initrec_new(){

        listPage.listView.model.insert(0,{name:"",telephone:"",type:""})
        listPage.listView.currentIndex=0
    }




    Page{
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

                        initrec_new()

                        if(listPage.listView.currentIndex!=-1){

//                          if(listPage.listView.model.get(listPage.listView.currentIndex).id<1){
//                              console.log("hhh")

                          if(insertrec()){

                              setlistview()

//                          }
                        }
                       }
                        stack.pop(addlinkmanpage)
//                        editrec(listPage.listView.model.get(listPage.listView.currentIndex).name,
//                                      listPage.listView.model.get(listPage.listView.currentIndex).phone)
//                        listPage.listView.model.insert(0,{name:"jessy",telephone:110})

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
                AppText{
                    text: "Phone:"
                    height:numberinput.height
                }
                AppTextField{
                    id:numberinput
                    placeholderText: "Number"
                }

            }
        }
    }
//    Component.onCompleted: {
//        JS.dbInit()
//    }
}







