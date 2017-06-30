function dbInit()
{
    var db = LocalStorage.openDatabaseSync("LinkMan_DB", "", "LinkMan", 1000000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS linkman_logorder1 (name text not null unique  ,telephone text not null unique,type text not null)')
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
    var erro=-1
    db.transaction(function (tx) {

        tx.executeSql('INSERT INTO linkman_logorder1 VALUES(?,?,?)',
                      [Pname, Ptelephone,Ptype])
        var result = tx.executeSql('SELECT last_insert_rowid()')
        rowid = result.insertId
        console.log("gh")



    })
    return rowid;


}

function dbReadAll()
{
    var db = dbGetHandle()

    db.transaction(function (tx) {
        var results = tx.executeSql(
                    'SELECT rowid,name,telephone,type FROM linkman_logorder1 order by type desc')
        for (var i = 0; i < results.rows.length; i++) {
            listModel.append({
                                 id: results.rows.item(i).rowid,
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
                    'update linkman_logorder1 set name=?, telephone=?,type=? where rowid = ?', [Pname, Ptelephone,Ptype,Prowid])
    })
}

function dbDeleteRow(Prowid)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('delete from linkman_logorder1 where rowid = ?', [Prowid])

    })


}
function dbsearch(Ptext){
    var db=dbGetHandle()

    var n=0
    var containname=new Array

    db.transaction(function (tx){
        var results=tx.executeSql('select rowid,name,telephone,type from linkman_logorder1 where type = ?',[Ptext.substring(0,1)])
        for(var j=0;j<results.rows.length;j++){
//            for(var m=0;m<Ptext.length;m++){
//                results.rows.item(j).name.substring(m,m+1)
//            }
            var m=0
             var length=Ptext.length
            console.log(results.rows.length)
            while(length){
                if( results.rows.item(j).name.substring(m,m+1)===Ptext.substring(m,m+1)){
                    m++;
                    length--;
                    if(m===Ptext.length){
                        containname[n]=j
                        n++
                        console.log(n)
                    }

                }
                else{
                    break
                }
            }


        }
        for(var k=0;k<n;k++){
           mymodel.append({
                              id: results.rows.item(containname[k]).rowid,
                              name: results.rows.item(containname[k]).name,
                              telephone: results.rows.item(containname[k]).telephone,
                              type:results.rows.item(containname[k]).type

                          })
        }


//        for (var i = 0; i < results.rows.length; i++) {
//            mymodel.append({
//                               id: results.rows.item(i).rowid,
//                               name: results.rows.item(i).name,
//                               telephone: results.rows.item(i).telephone,
//                               type:results.rows.item(i).type

//                           })
//        }
    })
}

function dbReadAllagin()
{
    var db = dbGetHandle()

    db.transaction(function (tx) {
        var results = tx.executeSql(
                    'SELECT rowid,name,telephone,type FROM linkman_logorder1 order by type desc')
        for (var i = 0; i < results.rows.length; i++) {
            mymodel.append({
                               id: results.rows.item(i).rowid,
                               name: results.rows.item(i).name,
                               telephone: results.rows.item(i).telephone,
                               type:results.rows.item(i).type

                           })
        }

    })
}
