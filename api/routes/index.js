var express = require('express');
var router = express.Router();

const mysql = require('mysql2/promise');

const dsn = {
    host: 'localhost',
    database: 'db_api_mds',
    user: 'root',
    password: 'root',
};

// Création d'une connexion pool pour gérer les connexions de manière efficace
const pool = mysql.createPool(dsn);


/* GET home page */
router.get('/', async function (req, res, next) {
  const connection = await pool.getConnection();

  try {
      // Envoie la réponse avec les liens vers les créneaux disponibles
      res.render('index', { title: 'Accueil', });

  } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Internal Server Error' });

  } finally {
      connection.release();
  }
});

module.exports = router;


