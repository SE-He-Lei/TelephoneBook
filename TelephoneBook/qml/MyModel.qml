import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import "Database.js" as JS

ListModel {
    id: listModel
    Component.onCompleted:{

        JS.dbReadAll()
//        console.log(listModel.count)
//        for(var i=0;i<26;i++){
//            for(var j=0;j<listModel.count;j++){
//                if()
//            a}
//        }
    }


}
