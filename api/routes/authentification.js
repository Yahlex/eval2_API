var express = require('express');
var router = express.Router();
const jwt = require('jsonwebtoken');
const hal = require('../hal');
const mysql = require('mysql2/promise');

const SECRET_KEY = 'mysecretkey'; 

const dsn = {
    host: 'localhost',
    database: 'db_api_mds',
    user: 'root',
    password: 'root',
};

// Création d'une connexion pool pour gérer les connexions de manière efficace
const pool = mysql.createPool(dsn);
/**
 * Récupère le bearer token
 * @param {*} headerValue 
 * @returns 
 */
const extractBearerToken = headerValue => {

    if (typeof headerValue !== 'string') {
        return false
    }

    const matches = headerValue.match(/(bearer)\s+(\S+)/i)

    return matches && matches[2]
}

/* Fonction middleware de Vérification du token */
const checkTokenMiddleware = (req, res, next) => {

    // Récupération du token
    const token = req.headers.authorization && extractBearerToken(req.headers.authorization)

    // Présence d'un token
    if (!token) {
        return res.status(401).json({ "msg": "Vous n'êtes pas autorisé·e à accéder à cette ressource" })
    }

    // Véracité du token (token non modifié)
    jwt.verify(token, SECRET_KEY, (err, decodedToken) => {
        if (err) {
            res.status(401).json({ "msg": "Vous n'êtes pas autorisé·e à accéder à cette ressource" })
        } else {
            return next() //appeler la fonction middleware suivante (enregistrée dans le routeur)
        }
    })
}


// Route de connexion
router.post('/login', async (req, res) => {
    try {
        if (!req.body.pseudo || !req.body.password) {
            return res.status(400).json({ message: 'Impossible de vous authentifier: mauvais pseudo ou mot de passe' });
        }

        const connection = await pool.getConnection();

        try {
            // Identification et authentification
            const [rows] = await connection.query('SELECT * FROM Adherent WHERE pseudo = ? AND password = ?', [req.body.pseudo, req.body.password]);

            if (rows.length === 0) {
                return res.status(401).json({ "msg": "Vous n'êtes pas autorisé·e à accéder à cette ressource" });
            }

            const user = {
                id: rows[0].id,
                pseudo: rows[0].pseudo,
                is_admin: rows[0].is_admin,
            };

            const token = jwt.sign(user, SECRET_KEY, { expiresIn: '1h' });

            res.status(201).json({
                "_links": {
                    "self": hal.halLinkObject('/login'),
                    "terrains": hal.halLinkObject('/terrains'),
                    "creneaux": hal.halLinkObject('/creneaux'),
                    "reservations": hal.halLinkObject('/creneaux/:id/reservation'),
                },
                "access_token": token
            });
        } finally {
            connection.release();
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

module.exports = { router, checkTokenMiddleware };
