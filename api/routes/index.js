var express = require('express');
var router = express.Router();

// Module mysql2 avec l'API des promesses
const mysql = require('mysql2/promise');

// On utilise l'utilisateur 'user' qui a des droits restreints (DQL, DML)
// Remarque : il faudrait déplacer le DSN en dehors du code dans un fichier d'environnement (laissé en exercice)
const dsn = {
  host: 'localhost',
  database: 'db_api_mds',
  user: 'root',
  password: 'root',
};

/* GET home page. */
router.get('/', async function (req, res, next) {
  try {
    // #swagger.summary = "Page d'accueil"
    console.log('hello world');

    // Création d'une connexion pool pour gérer les connexions de manière efficace
    const pool = mysql.createPool(dsn);

    // Obtention d'une connexion à partir du pool
    const connection = await pool.getConnection();

    // Exécution de la requête SQL
    const [rows, fields] = await connection.query('SELECT * FROM Terrain');

    // Libération de la connexion
    connection.release();

    console.log('The solution is: ', rows);
    res.send(rows);
  } catch (error) {
    console.error('Error:', error.message);
    res.status(500).send('Internal Server Error');
  }
});

module.exports = router;
