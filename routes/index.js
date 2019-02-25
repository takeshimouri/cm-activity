var express = require('express');
var router = express.Router();
var app = require('../db.js');　//db.jsを呼び出し。
var ejs = require("ejs");
var array = { title: null, users: null, content: null };
//index.ejs上title/users/contentという変数を定義、中身はnull空として定義。


router.get('/', function (req, res) {
  app.connection.query('select * from cm_aclg where al_idactv = 1 order by AL_DTACTV desc', function (err, rows) {
    array.users = rows; 　  //連想配列arrayの変数usersにDBの行rowsを入力
    array.title = '書籍・セミナー・大会履歴';　  //連想配列arrayの変数titleに値を入力
    array.content = req.body.message;
    // array.content = '履歴を検索したい方の読者番号を入力してください。';   //連想配列arrayの変数contentに値を入力
    res.render('index', array);    //index.ejsに配列arrayを表示する。
    tablerows = rows;
    //以下の検索部分でDBのrowsの値を再度使用するため別の変数tablerowsに代入しておく。
  });
});

router.post('/', (req, res) => {　　// POST送信の処理

  app.connection.query(
    'select * from cm_aclg where al_cdsqsk = ? order by AL_DTACTV desc',
    //table cm_aclg から AL_CDSQSK に？（何か）が入っている行を取り出す。
    //? はプレースホルダーであとから「?」の中身を指定するという意味
    //where句は完全一致のため、大文字小文字区別した名前全体が「?」に入るべき文字となる。
    [req.body.message],
    function (err, rows) {
      array.title = '書籍・セミナー・大会履歴';　  //連想配列arrayの変数titleに値を入力
      array.users = rows;
      // array.content = '読者番号「<b>' + req.body.message + '</b>」さんについての情報を表示します。';
      array.content = req.body.message;
      res.render('index', array);
      //index.ejsに配列arrayを表示する。

    }
  );

});
module.exports = router;