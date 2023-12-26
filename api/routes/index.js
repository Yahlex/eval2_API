var express = require('express');
var router = express.Router();


//Module mysql2 avec l'API des promesses
const mysql = require('mysql');

//On utilise l'utilisateur 'user' qui a des droits restreints (DQL, DML)
//Remarque : il faudrait déplacer le DSN en dehors du code dans un fichier d'environnement (laissé en exercice)
const dsn = mysql.createConnection ({
    host: 'localhost',
    database: 'db_api_mds',
    user: 'root',
    password: 'root',
});


/* GET home page. */
router.get('/', async function (req, res, next) {

  // #swagger.summary = "Page d'accueil"
console.log('hello world');
  dsn.connect()
  dsn.query('SELECT * FROM Terrain', (err, rows, fields) => {
    if (err) throw err
    ans = rows
    console.log('The solution is: ', ans)
    res.send(ans)
  })


  dsn.end()
});

module.exports = router;
