const express = require('express');
const router = express.Router();
const hal = require('../hal');
const mysql = require('mysql2/promise');

const dsn = {
    host: 'localhost',
    database: 'db_api_mds',
    user: 'root',
    password: 'root',
};

const pool = mysql.createPool(dsn);

/* POST - Ajouter une réservation */
router.post('/creneaux/:id/reservation', async function (req, res, next) {
    const connection = await pool.getConnection();

    try {
        const creneauId = req.params.id;
        const pseudo = req.body.pseudo;

        // Vérifiez si le créneau est actif
        const [creneauRows] = await connection.execute('SELECT is_active FROM Creneaux WHERE id = ?', [creneauId]);

        if (creneauRows.length === 0 || creneauRows[0].is_active !== 1) {
            return res.status(400).json({ error: 'Le créneau n\'est pas disponible' });
        }

        // Récupérer l'ID de l'adhérent en utilisant le pseudo
        const [adherentRows] = await connection.execute('SELECT id FROM Adherent WHERE pseudo = ?', [pseudo]);

        if (adherentRows.length === 0) {
            return res.status(404).json({ error: 'Adhérent non trouvé' });
        }

        const adherentId = adherentRows[0].id;

        // Insérer la réservation
        const [result] = await connection.execute('INSERT INTO Reservation (creneaux_id, id_adherent) VALUES (?, ?)', [creneauId, adherentId]);

        if (result.affectedRows === 0) {
            return res.status(500).json({ error: 'Erreur lors de l\'ajout de la réservation' });
        }

        // construction d'un objet HAL pour la réponse
        const resourceObject = {
            "_links": [{
                "self": hal.halLinkObject(`/creneaux/${creneauId}/reservation`, 'string'),
            }],
            "message": 'Réservation ajoutée avec succès!',
        };

        // Renvoyer la réponse
        res.status(201).json(resourceObject);

    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });

    } finally {
        connection.release();
    }
});

/* DELETE - Supprimer une réservation */
router.delete('/reservation/:id/delete', async function (req, res, next) {
    const connection = await pool.getConnection();

    try {
        const reservationId = req.params.id;
        const pseudo = req.body.pseudo;
        const password = req.body.password;

        // Vérifiez l'authentification de l'adhérent
        const [authRows] = await connection.execute('SELECT id_adherent FROM Reservation WHERE id = ? AND id_adherent = (SELECT id FROM Adherent WHERE pseudo = ? AND password = ?)', [reservationId, pseudo, password]);

        if (authRows.length === 0) {
            return res.status(401).json({ error: 'Authentification échouée ou réservation non trouvée' });
        }

        // Supprimer la réservation
        const [result] = await connection.execute('DELETE FROM Reservation WHERE id = ?', [reservationId]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Réservation non trouvée' });
        }

        // construction d'un objet HAL pour la réponse
        const resourceObject = {
            "_links": [{
                "self": hal.halLinkObject(`/reservation/${reservationId}/delete`, 'string'),
            }],
            "message": 'Réservation supprimée avec succès!',
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

/* GET - Liste des réservations */
router.get('/reservation', async function (req, res, next) {
    const connection = await pool.getConnection();

    try {
        // Récupérer la liste des réservations
        const [rows] = await connection.execute('SELECT * FROM Reservation');

        // construction d'un objet HAL pour la réponse
        const resourceObject = {
            "_links": [{
                "self": hal.halLinkObject('/reservations', 'string'),
            }],
            "reservations": rows,
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


module.exports = router;
