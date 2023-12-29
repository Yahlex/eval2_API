# Projet de Réservation de Terrains de Badminton

## Table des matières

- [Projet de Réservation de Terrains de Badminton](#projet-de-réservation-de-terrains-de-badminton)
  - [Table des matières](#table-des-matières)
  - [Lancer le Projet](#lancer-le-projet)
    - [Installer les Dépendances](#installer-les-dépendances)
  - [Configuration de la Base de Données](#configuration-de-la-base-de-données)
  - [Lancer le Serveur](#lancer-le-serveur)
    - [Tester l'API](#tester-lapi)
  - [Conception :](#conception-)
    - [Dictionnaire des Données](#dictionnaire-des-données)
    - [Nommer les ressources avec des URI](#nommer-les-ressources-avec-des-uri)
    - [Implémenter un sous-ensemble de l'interface uniforme (`GET`, `POST`, `DELETE`, `PUT`) pour chaque ressource](#implémenter-un-sous-ensemble-de-linterface-uniforme-get-post-delete-put-pour-chaque-ressource)
  - [Afficher tous les terrains disponibles](#afficher-tous-les-terrains-disponibles)
  - [Afficher les détails d'un terrain particulier](#afficher-les-détails-dun-terrain-particulier)
  - [Afficher les créneaux disponibles pour un terrain donné](#afficher-les-créneaux-disponibles-pour-un-terrain-donné)
  - [Réserver un créneau sur un terrain](#réserver-un-créneau-sur-un-terrain)
  - [Afficher les réservations d'un adhérent](#afficher-les-réservations-dun-adhérent)
  - [Annuler une réservation](#annuler-une-réservation)
  - [Afficher les détails d'un adhérent](#afficher-les-détails-dun-adhérent)
  - [Tableau Récapitulatif des Ressources](#tableau-récapitulatif-des-ressources)
    - [Concevoir la ou les représentations à mettre à disposition des clients](#concevoir-la-ou-les-représentations-à-mettre-à-disposition-des-clients)
      - [Faire une réservation](#faire-une-réservation)
      - [Annuler une réservation](#annuler-une-réservation-1)
    - [S'authentifier](#sauthentifier)
  - [Modèle Conceptuel des Données (MCD)](#modèle-conceptuel-des-données-mcd)
  - [Remarques](#remarques)
  - [Références](#références)

## Lancer le Projet

### Installer les Dépendances

Assurez-vous d'avoir [Node.js](https://nodejs.org/) installé sur votre machine.

Installez les dépendances nécessaires :

1. [jsonwebtoken](https://www.npmjs.com/package/jsonwebtoken) : 
    ```bash
    npm install jsonwebtoken
    ```

2. [hal](https://www.npmjs.com/package/hal) :
    ```bash
    npm install hal
    ```

3. [mysql2](https://www.npmjs.com/package/mysql2) :
    ```bash
    npm install mysql2
    ```

4. [express](https://www.npmjs.com/package/express) :
    ```bash
    npm install express
    ```

Ces commandes installe les dépendances requises pour le bon fonctionnement du projet.

## Configuration de la Base de Données

1. Téléchargez et installez [XAMPP](https://www.apachefriends.org/fr/index.html) (pour Windows, macOS, et Linux) ou [MAMP](https://www.mamp.info/) (pour macOS et Windows).

2. Lancez le serveur Apache et MySQL de XAMPP/MAMP.

3. Importez le script SQL fourni dans le projet ([db_api_mds.sql](/init/db_api_mds.sql)) dans votre base de données.


## Lancer le Serveur

Dans le répertoire du projet, exécutez la commande suivante pour démarrer le serveur :

```bash
node app.js
```

Le serveur démarrera sur [http://localhost:3000](http://localhost:3000).


### Tester l'API

Pour tester l'API, vous pouvez utiliser un outil comme [Postman](https://www.postman.com/) pour envoyer des requêtes HTTP à l'API. Assurez-vous d'inclure le token d'accès dans les en-têtes des requêtes nécessitant une authentification.

Voici un exemple de requête POST pour faire une réservation :

1. Endpoint : `http://localhost:3000/creneaux/:id/reservation`
2. Type de requête : POST
3. Headers :
   - Key: Authorization
   - Value: Bearer [votre_token]
4. Body (raw JSON) :
   ```json
   {
       "pseudo": "votre_pseudo"
   }
   ```


## Conception :

### Dictionnaire des Données

| Code | Désignation | Type | Taille (nombre de caractères ou de bytes (octets)) | Remarque | Obligatoire |
|------|-------------|------|---------------------------------------------|----------|--------------|
| `id` | Identifiant | N | Entier encodé sur 64 bits | Identifie de manière *unique* l'élément | Oui |
| `pseudo` | Pseudo de l'adhérent | AN | Variable | Identifie de manière *unique* l'adhérent | Oui |
| `is_admin` | Statut administrateur | B | 1 | Vrai si l'adhérent est administrateur, faux sinon | Oui |
| `password` | Mot de passe de l'adhérent | AN | Variable | Mot de passe pour l'authentification | Oui |
| `heure_debut` | Heure de début du créneau | D | 20 | Au format `YYYY-mm-dd HH:mm:ss` (et TimeZone) | Oui |
| `heure_fin` | Heure de fin du créneau | D | 20 | Au format `YYYY-mm-dd HH:mm:ss` (et TimeZone) | Oui |
| `jour` | Jour du créneau | AN | Variable | Jour du créneau (ex: Lundi, Mardi, etc.) | Oui |
| `terrain_id` | Identifiant du terrain | N | Entier encodé sur 64 bits | Identifie de manière *unique* le terrain | Oui |
| `is_active` | Statut d'activation du créneau | B | 1 | Vrai si le créneau est actif, faux sinon | Oui |
| `id_adherent` | Identifiant de l'adhérent pour la réservation | N | Entier encodé sur 64 bits | Identifie de manière *unique* un adhérent | Oui |
| `nom` | Nom du terrain | AN | Variable | Nom du terrain de badminton | Oui |
| `geoposition` | Position géographique du terrain | AN | Variable | Coordonnées géographiques du terrain | Oui |


### Nommer les ressources avec des URI 

- *Les liste des terrains* : `/terrains`
- *Détail d'un terrain* : `/terrains/{id}`
- *Créneaux disponibles pour un terrain spécifique* : `/terrains/{id}/creneaux`
- *Ajouter une réservation* : `POST /creneaux/{id}/reservation`
- *Supprimer une réservation* : `DELETE /reservation/{id}/delete`
- *Liste des réservations* : `/reservation`
- *Page d'accueil* : `/`
- *Liste des créneaux* : `/creneaux`
- *Détail d'un créneau* : `/creneaux/{id}`
- *Liste des adhérents* : `/adherents`
- *Détails d'un adhérent* : `/adherents/{id}`
- *afficher les Réservations d'un adhérent* : `/adherents/{id}/reservation`

### Implémenter un sous-ensemble de l'interface uniforme (`GET`, `POST`, `DELETE`, `PUT`) pour chaque ressource


## Afficher tous les terrains disponibles

- **Type de requête :** GET
- **Endpoint :** `/terrains`
- **Description :** Renvoie la liste de tous les terrains disponibles.

## Afficher les détails d'un terrain particulier

- **Type de requête :** GET
- **Endpoint :** `/terrains/:id`
- **Description :** Renvoie les détails d'un terrain spécifique en fonction de son identifiant.

## Afficher les créneaux disponibles pour un terrain donné

- **Type de requête :** GET
- **Endpoint :** `/terrains/:id/creneaux`
- **Description :** Renvoie les créneaux disponibles pour la réservation sur un terrain spécifique.

## Réserver un créneau sur un terrain

- **Type de requête :** POST
- **Endpoint :** `/creneaux/{id}/reservation`
- **Description :** Permet à un adhérent de réserver un créneau sur un terrain spécifique.

## Afficher les réservations d'un adhérent

- **Type de requête :** GET
- **Endpoint :** `/adherents/:id/reservation`
- **Description :** Renvoie les réservations effectuées par un adhérent en fonction de son identifiant.

## Annuler une réservation

- **Type de requête :** DELETE
- **Endpoint :** `/reservation/:id/delete`
- **Description :** Annule une réservation en fonction de son identifiant.

## Afficher les détails d'un adhérent

- **Type de requête :** GET
- **Endpoint :** `/adherents/:id`
- **Description :** Renvoie les détails d'un adhérent en fonction de son identifiant.


## Tableau Récapitulatif des Ressources

| Ressource                                      | URL                                      | Méthodes HTTP       | Paramètres d'URL/Variations                    | Commentaires                                      |
|-----------------------------------------------|------------------------------------------|---------------------|-----------------------------------------------|--------------------------------------------------|
| Terrains                                      | `/terrains`                              | GET,            | N/A                                           | Liste des terrains,             |
| Créneaux                                      | `/creneaux`                              | GET,    | N/A                                           | Liste des créneaux,           |
| Adhérents                                     | `/adherents`                             | GET,            | N/A                                           | Liste des adhérents,           |
| Réservations                                  | `/reservations`                          | GET,    | N/A                                           | Liste des réservations,        |
| Détails d'un terrain                          | `/terrains/:id`                         | GET                 | `:id` - Identifiant du terrain                 | Détails d'un terrain spécifique                    |
| Créneaux pour un terrain                      | `/terrains/:id/creneaux`                | GET                 | `:id` - Identifiant du terrain                 | Liste des créneaux pour un terrain donné           |
| Détails d'un adhérent                         | `/adherents/:id`                        | GET                 | `:id` - Identifiant de l'adhérent              | Détails d'un adhérent spécifique                   |
| Effectuer une réservation sur un créneaux spécifique | `/creneaux/:id/reservation`        | POST                | `:id` - Identifiant du terrain                 | Permet à un adhérent de réserver un créneau sur un terrain spécifique |
| Détails d'un créneau                          | `/creneaux/:id`                         | GET                 | `:id` - Identifiant du créneau                | Détails d'un créneau spécifique                    |
| Liste des réservations d'un adhérent          | `/adherents/:id/reservation`          | GET                 | `:id` - Identifiant de l'adhérent              | Liste des réservations effectuées par un adhérent |


### Concevoir la ou les représentations à mettre à disposition des clients

Maintenant, il faut déterminer les représentations que les clients peuvent fabriquer et qui seront comprises par le serveur. Il faut définir la représentation pour :

- Une réservation
- Une authentification

Le client enverra sa représentation par de simples `clef=valeur` dans le corps de la requête HTTP.

#### Faire une réservation 

POST /creneaux/[id-creneau]/reservation HTTP/1.1
Authorization: Bearer [votre-token]
Content-Type: application/json
```json
{
  "pseudo": "votre-pseudo"
}

HTTP/1.1 201 Created
Content-Type: application/hal+json

1. {
  "_links": [
    {
      "self": {
        "href": "/creneaux/[id-creneau]/reservation"
      }
    }
  ],
  "message": "Réservation ajoutée avec succès!"
}
```



#### Annuler une réservation 

DELETE /reservation/[id-reservation]/delete HTTP/1.1
Authorization: Bearer [votre-token]
Content-Type: application/json
```json
{
  "pseudo": "votre-pseudo",
  "password": "votre-mot-de-passe"
}

HTTP/1.1 200 OK
Content-Type: application/hal+json

{
  "_links": [
    {
      "self": {
        "href": "/reservation/[id-reservation]/delete"
      }
    }
  ],
  "message": "Réservation supprimée avec succès!"
}
```
### S'authentifier

POST /login HTTP/1.1
Content-Type: application/json
```json
{
  "pseudo": "admybad",
  "password": "admybad"
}

HTTP/1.1 201 Created
Content-Type: application/hal+json

{
  "_links": {
    "self": {
      "href": "/login"
    },
    "terrains": {
      "href": "/terrains"
    },
    "creneaux": {
      "href": "/creneaux"
    },
    "reservations": {
      "href": "/creneaux/:id/reservation"
    },
    "adherents": {
      "href": "/adherents"
    }
  },
  "access_token": "[votre-token]"
}
```

## Modèle Conceptuel des Données (MCD)


![Modèle Conceptuel des Données (MCD)](mcd.png)


## Remarques

J'ai trouvé que le travail était vraiment compliqué, étant débutant dans le domaine des API. Heureusement, la documentation fournie ainsi que l'exemple de correction m'ont aidé à avancer sur le projet. Malgré cela, je suis un peu déçu car j'ai réalisé seulement une partie du projet en raison d'un manque de temps. L'analyse, la mise en oeuvre et surtout la compréhension ont pris beaucoup de temps.

CHATGPT a été d'une grande aide pour comprendre des concepts clés, en particulier pour la gestion des tokens et la réalisation des méthodes de test de l'API avec Postman.Malheureusement, je n'ai pas réussi à mettre en place Swagger ni Docker. Après avoir passé trop de temps dessus, j'ai décidé d'arrêter.... Ce projet a été ma première expérience dans la réalisation d'un tel projet, et il m'a appris énormément, notamment en ce qui concerne la gestion des routes, les connexions aux bases de données et, mine de rien, les requêtes SQL, car j'ai dû en faire beaucoup pour récupérer les bonnes données dans chaque route.


En résumé, j'ai acquis les compétences suivantes :

Initialisation d'un projet avec Node.js et Express en tant que serveur.

Création de routes :

Configuration de la route et des params requis.
Renvoi de données au format JSON.
Émission de réponses HAL.
Gestion de vues, même si cela n'était pas explicitement requis (par exemple, redirection vers une vue d'index pour accéder à différentes pages). Au départ, j'ai utilisé les vues Pug pour mieux comprendre le projet.

Maîtrise des requêtes SQL :

Utilisation de requêtes SQL pour récupérer les données nécessaires dans chaque route ou vérifier des informations de données.

En conclusion, malgré les difficultés, cette expérience a été enrichissante et formatrice.


## Références

Support de cours, camardes de classes (ewen), le projet sur la reservation de billeterie de concerts (corrigé) et ChatGPT en grande partie.
