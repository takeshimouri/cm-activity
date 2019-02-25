var mysql = require('mysql');　　//mysqlを要求
var connection = mysql.createConnection({   　　//hostの情報でDBへアクセス
  host: 'localhost', user: 'docker',
  password: 'docker', database: 'ccwebdb'
});

exports.connection = connection;

connection.connect((err) => {   　//DB接続テスト用。アクセス成功でメッセージ返す。
  if (err) {
    console.log('Error connecting to DB');
    console.error(err);
  }
  else { console.log('Connection established'); }
});

