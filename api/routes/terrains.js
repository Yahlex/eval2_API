var express = require('express');
var router = express.Router();

// Module mysql2 avec l'API des promesses
const mysql = require('mysql2/promise'); // Assurez-vous d'utiliser la version avec la promesse

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

/* GET liste des terrains. */
router.get('/terrains', async function (req, res, next) {

    // Connexion à la base de données
    const connection = await pool.getConnection();

    try {
        // Exécute la requête SQL pour récupérer la liste des terrains
        const [rows, fields] = await connection.query('SELECT * FROM Terrain');
        
        // Envoie la réponse avec les données des terrains
        res.json(rows);

    } catch (error) {
        // Gère les erreurs
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });

    } finally {
        // Ferme la connexion à la base de données
        connection.release();
    }
});

/* GET détail d'un terrain */

router.get('/terrains/:id', async function (req, res, next) {
    const connection = await mysql.createConnection(dsn);

    try {
        const terrainId = req.params.id;
        const [rows, fields] = await connection.execute('SELECT * FROM Terrain WHERE id = ?', [terrainId]);

        if (rows.length === 0) {
            res.status(404).json({ error: 'Terrain not found' });
            return;
        }

        res.json(rows[0]);

    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });

    } finally {
        await connection.end();
    }
});

/* GET créneaux disponibles pour un terrain spécifique */
router.get('/terrains/:id/creneaux', async function (req, res, next) {
    const connection = await pool.getConnection();

    try {
        const terrainId = req.params.id;

        // Récupère les créneaux disponibles pour le terrain spécifié (à adapter selon ta structure de base de données)
        const [rows, fields] = await connection.query('SELECT * FROM Creneaux WHERE terrain_id = ?', [terrainId]);

        // Envoie la réponse avec les créneaux disponibles
        res.json(rows);

    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });

    } finally {
        connection.release();
    }
});

module.exports = router;
