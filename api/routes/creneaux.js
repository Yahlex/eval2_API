// creneaux.js
var express = require('express');
var router = express.Router();
const hal = require('../hal'); 
const mysql = require('mysql2/promise');

const dsn = {
    host: 'localhost',
    database: 'db_api_mds',
    user: 'root',
    password: 'root',
};

const pool = mysql.createPool(dsn);

/* GET - Liste des créneaux */
router.get('/creneaux', async function (req, res, next) {
    const connection = await pool.getConnection();

    try {
        // Récupérer la liste des créneaux
        const [rows] = await connection.execute('SELECT * FROM Creneaux');

        // Exemple de construction d'un objet HAL pour la réponse
        const resourceObject = {
            "_links": [{
                "self": hal.halLinkObject('/creneaux', 'string'),
            }],
            "creneaux": rows,
        };

        // Renvoyer la réponse
        res.status(200).json(resourceObject);

    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });

    } finally {
        connection.release();
    }
});

/* GET détail d'un créneau */
router.get('/creneaux/:id', async function (req, res, next) {
    const connection = await pool.getConnection();

    try {
        const creneauId = req.params.id;

        // Récupère les détails du créneau en fonction de l'ID du créneau
        const [rows, fields] = await connection.query('SELECT * FROM Creneaux WHERE id = ?', [creneauId]);

        // Vérifie si le créneau existe
        if (rows.length === 0) {
            res.status(404).json({ error: 'Creneau not found' });
            return;
        }

        // Convertit les données brutes en objet HAL
        const halCreneau = hal.mapCreneauToResourceObject(rows[0], 'http://localhost:3000');

        // Crée un objet HAL représentant le créneau
        const halResponse = {
            _links: {
                self: hal.halLinkObject(`/creneaux/${creneauId}`)
            },
            item: halCreneau
        };

        // Envoie la réponse au format HAL
        res.json(halResponse);

    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });

    } finally {
        connection.release();
    }
});

module.exports = router;
