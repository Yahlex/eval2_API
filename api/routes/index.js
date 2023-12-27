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

// Création d'une connexion pool pour gérer les connexions de manière efficace
const pool = mysql.createPool(dsn);

var express = require('express');
var router = express.Router();


/* GET home page with links to terrains. */
router.get('/', async function (req, res, next) {
  const connection = await pool.getConnection();

  try {
      // Récupère la liste des terrains
      const [rows, fields] = await connection.query('SELECT * FROM Terrain');

      // Envoie la réponse avec les liens vers les créneaux disponibles
      res.render('index', { title: 'Accueil', terrains: rows });

  } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Internal Server Error' });

  } finally {
      connection.release();
  }
});
module.exports = router;


