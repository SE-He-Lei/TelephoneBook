/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the documentation of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:FDL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Free Documentation License Usage
** Alternatively, this file may be used under the terms of the GNU Free
** Documentation License version 1.3 as published by the Free Software
** Foundation and appearing in the file included in the packaging of
** this file. Please review the following information to ensure
** the GNU Free Documentation License version 1.3 requirements
** will be met: http://www.gnu.org/copyleft/fdl.html.
** $QT_END_LICENSE$
**
****************************************************************************/

function dbInit()
{
    var db = LocalStorage.openDatabaseSync("LinkMan_DB", "", "LinkMan", 1000000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS linkman_logorder (name text,telephone text,type text)')
        })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    };
}

function dbGetHandle()
{
    try {
        var db = LocalStorage.openDatabaseSync("LinkMan_DB", "",
                                               "LinkMan", 1000000)
    } catch (err) {
        console.log("Error opening database: " + err)
    }
    return db
}

function dbInsert(Pname,Ptelephone,Ptype)
{
    var db = dbGetHandle()
    var rowid = 0;
    db.transaction(function (tx) {
        tx.executeSql('INSERT INTO linkman_logorder VALUES(?,?,?)',
                      [Pname, Ptelephone,Ptype])
        var result = tx.executeSql('SELECT last_insert_rowid()')
        rowid = result.insertId
    })
    return rowid;
}

function dbReadAll()
{
    var db = dbGetHandle()

    db.transaction(function (tx) {
        var results = tx.executeSql(
                    'SELECT rowid,name,telephone,type FROM linkman_logorder order by type desc')
        for (var i = 0; i < results.rows.length; i++) {
            listModel.append({
                                 id: results.rows.item(i).rowid,
//                               checked: " ",
                                 name: results.rows.item(i).name,
                                 telephone: results.rows.item(i).telephone,
                                 type:results.rows.item(i).type

                             })
        }

    })
}

function dbUpdate(Pname, Ptelephone, Ptype,Prowid)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
       var results= tx.executeSql(
                    'update linkman_logorder set name=?, telephone=?,type=? where rowid = ?', [Pname, Ptelephone,Ptype,Prowid])
    })
}
function dbDeleteRow(Prowid)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('delete from linkman_logorder where rowid = ?', [Prowid])

    })


}
function dbsearch(Ptype){
    var db=dbGetHandle()
    db.transaction(function (tx){
        var results=tx.executeSql('select rowid,name,telephone,type from linkman_logorder where type = ?',[Ptype])
        for (var i = 0; i < results.rows.length; i++) {
            mymodel.append({
                                 id: results.rows.item(i).rowid,
//                               checked: " ",
                                 name: results.rows.item(i).name,
                                 telephone: results.rows.item(i).telephone,
                                 type:results.rows.item(i).type

                             })
        }
    })
}
function dbReadAllagin()
{
    var db = dbGetHandle()

    db.transaction(function (tx) {
        var results = tx.executeSql(
                    'SELECT rowid,name,telephone,type FROM linkman_logorder order by type desc')
        for (var i = 0; i < results.rows.length; i++) {
            mymodel.append({
                                 id: results.rows.item(i).rowid,
//                               checked: " ",
                                 name: results.rows.item(i).name,
                                 telephone: results.rows.item(i).telephone,
                                 type:results.rows.item(i).type

                             })
        }

    })
}
