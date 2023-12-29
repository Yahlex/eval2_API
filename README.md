# Projet de Réservation de Terrains de Badminton

## Table des matières

- [Projet de Réservation de Terrains de Badminton](#projet-de-réservation-de-terrains-de-badminton)
  - [Table des matières](#table-des-matières)
  - [Lancer le Projet](#lancer-le-projet)
    - [Installer les Dépendances](#installer-les-dépendances)
  - [Conception :](#conception-)
    - [Dictionnaire des Données](#dictionnaire-des-données)
    - [Nommer les ressources avec des URI](#nommer-les-ressources-avec-des-uri)
    - [3. **Nommer** les ressources avec des URI](#3-nommer-les-ressources-avec-des-uri)
    - [**Implémenter** un sous-ensemble de l'interface uniforme (`GET`, `POST`, `DELETE`, `PUT`) pour chaque ressource](#implémenter-un-sous-ensemble-de-linterface-uniforme-get-post-delete-put-pour-chaque-ressource)
  - [Afficher tous les terrains disponibles](#afficher-tous-les-terrains-disponibles)
  - [Afficher les détails d'un terrain particulier](#afficher-les-détails-dun-terrain-particulier)
  - [Afficher les créneaux disponibles pour un terrain donné](#afficher-les-créneaux-disponibles-pour-un-terrain-donné)
  - [Réserver un créneau sur un terrain](#réserver-un-créneau-sur-un-terrain)
  - [Afficher les réservations d'un adhérent](#afficher-les-réservations-dun-adhérent)
  - [Annuler une réservation](#annuler-une-réservation)
  - [Afficher les détails d'un adhérent](#afficher-les-détails-dun-adhérent)
  - [Effectuer une réservation sur un terrain spécifique](#effectuer-une-réservation-sur-un-terrain-spécifique)
  - [Tableau Récapitulatif des Ressources](#tableau-récapitulatif-des-ressources)
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

Cette commande installe les dépendances requises pour le bon fonctionnement du projet.


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

### 3. **Nommer** les ressources avec des URI

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

### **Implémenter** un sous-ensemble de l'interface uniforme (`GET`, `POST`, `DELETE`, `PUT`) pour chaque ressource


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

## Effectuer une réservation sur un terrain spécifique

- **Type de requête :** POST
- **Endpoint :** `/terrains/:id/reservation`
- **Description :** Permet à un adhérent de réserver un créneau sur un terrain spécifique.

## Tableau Récapitulatif des Ressources

| Ressource                                      | URL                                      | Méthodes HTTP       | Paramètres d'URL/Variations                    | Commentaires                                      |
|-----------------------------------------------|------------------------------------------|---------------------|-----------------------------------------------|--------------------------------------------------|
| Terrains                                      | `/terrains`                              | GET, POST           | N/A                                           | Liste des terrains, ajout d'un terrain             |
| Créneaux                                      | `/creneaux`                              | GET, POST, DELETE   | N/A                                           | Liste des créneaux, ajout et suppression           |
| Adhérents                                     | `/adherents`                             | GET, POST           | N/A                                           | Liste des adhérents, ajout d'un adhérent          |
| Réservations                                  | `/reservations`                          | GET, POST, DELETE   | N/A                                           | Liste des réservations, ajout et suppression       |
| Détails d'un terrain                          | `/terrains/:id`                         | GET                 | `:id` - Identifiant du terrain                 | Détails d'un terrain spécifique                    |
| Créneaux pour un terrain                      | `/terrains/:id/creneaux`                | GET                 | `:id` - Identifiant du terrain                 | Liste des créneaux pour un terrain donné           |
| Détails d'un adhérent                         | `/adherents/:id`                        | GET                 | `:id` - Identifiant de l'adhérent              | Détails d'un adhérent spécifique                   |
| Effectuer une réservation sur un créneaux spécifique | `/creneaux/:id/reservation`        | POST                | `:id` - Identifiant du terrain                 | Permet à un adhérent de réserver un créneau sur un terrain spécifique |
| Détails d'un créneau                          | `/creneaux/:id`                         | GET                 | `:id` - Identifiant du créneau                | Détails d'un créneau spécifique                    |
| Liste des réservations d'un adhérent          | `/adherents/:id/reservation`          | GET                 | `:id` - Identifiant de l'adhérent              | Liste des réservations effectuées par un adhérent |


## Modèle Conceptuel des Données (MCD)


![Modèle Conceptuel des Données (MCD)](mcd.png)


## Remarques

Ajoutez ici vos remarques sur le travail réalisé, les difficultés rencontrées, etc.

## Références

Ajoutez ici la liste des références (sites web, cours, livres, articles, billets de blog, etc.) qui vous ont aidé à concevoir et développer votre système.
