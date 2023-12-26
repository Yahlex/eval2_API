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

/* GET liste des terrains. */
router.get('/terrains', async function (req, res, next) {

    // Connexion à la base de données
    const connection = await mysql.createConnection(dsn);

    try {
        // Exécute la requête SQL pour récupérer la liste des terrains
        const [rows, fields] = await connection.execute('SELECT * FROM Terrain');
        
        // Envoie la réponse avec les données des terrains
        res.json(rows);

    } catch (error) {
        // Gère les erreurs
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });

    } finally {
        // Ferme la connexion à la base de données
        await connection.end();
    }
});

module.exports = router;
