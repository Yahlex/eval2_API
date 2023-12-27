var express = require('express');
var router = express.Router();
const mysql = require('mysql2/promise');

const dsn = {
    host: 'localhost',
    database: 'db_api_mds',
    user: 'root',
    password: 'root',
};

/* GET liste des adhérents. */
router.get('/adherents', async function (req, res, next) {
    const pool = mysql.createPool(dsn);

    try {
        const connection = await pool.getConnection();

        // Exécute la requête SQL pour récupérer la liste des adhérents
        const [rows, fields] = await connection.query('SELECT * FROM Adherent');

        // Libération de la connexion
        connection.release();

        // Envoie la réponse avec les données des adhérents
        res.json(rows);

    } catch (error) {
        // Gère les erreurs
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });

    } finally {
        // Libération de la connexion dans le pool
        pool.end();
    }
});

/* GET détail d'un adhérent */
router.get('/adherents/:id', async function (req, res, next) {
    const pool = mysql.createPool(dsn);

    try {
        const connection = await pool.getConnection();
        const adherentId = req.params.id;

        // Exécute la requête SQL pour récupérer les détails de l'adhérent spécifié
        const [rows, fields] = await connection.query('SELECT * FROM Adherent WHERE id = ?', [adherentId]);

        // Libération de la connexion
        connection.release();

        if (rows.length === 0) {
            res.status(404).json({ error: 'Adherent not found' });
            return;
        }

        // Envoie la réponse avec les données de l'adhérent
        res.json(rows[0]);

    } catch (error) {
        // Gère les erreurs
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });

    } finally {
        // Libération de la connexion dans le pool
        pool.end();
    }
});

module.exports = router;
