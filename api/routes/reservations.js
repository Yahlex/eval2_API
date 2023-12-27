var express = require('express');
var router = express.Router();
const mysql = require('mysql2/promise');

const dsn = {
    host: 'localhost',
    database: 'db_api_mds',
    user: 'root',
    password: 'root',
};

/* GET liste des réservations d'un adhérent. */
router.get('/adherents/:id/reservations', async function (req, res, next) {
    const pool = mysql.createPool(dsn);

    try {
        const connection = await pool.getConnection();
        const adherentId = req.params.id;

        // Exécute la requête SQL pour récupérer les réservations de l'adhérent spécifié
        const [rows, fields] = await connection.query('SELECT * FROM Reservation WHERE id_adherent = ?', [adherentId]);

        // Libération de la connexion
        connection.release();

        // Envoie la réponse avec les données des réservations
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

/* DELETE annuler une réservation */
router.delete('/reservations/:id', async function (req, res, next) {
    const pool = mysql.createPool(dsn);

    try {
        const connection = await pool.getConnection();
        const reservationId = req.params.id;

        // Exécute la requête SQL pour annuler la réservation spécifiée
        const [result] = await connection.query('DELETE FROM Reservation WHERE id = ?', [reservationId]);

        // Libération de la connexion
        connection.release();

        if (result.affectedRows === 0) {
            res.status(404).json({ error: 'Reservation not found' });
            return;
        }

        // Envoie la réponse avec le statut de suppression
        res.json({ message: 'Reservation canceled successfully' });

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
