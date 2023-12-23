# Projet de Réservation de Terrains de Badminton

## Table des matières

- [Projet de Réservation de Terrains de Badminton](#projet-de-réservation-de-terrains-de-badminton)
  - [Table des matières](#table-des-matières)
  - [Lancer le Projet](#lancer-le-projet)
    - [Installer les Dépendances](#installer-les-dépendances)
  - [Conception :](#conception-)
    - [Dictionnaire des Données](#dictionnaire-des-données)
      - [Terrains](#terrains)
      - [Créneaux](#créneaux)
      - [Adhérents](#adhérents)
      - [Réservations](#réservations)
      - [Administrateurs](#administrateurs)
    - [Dictionnaire des Données](#dictionnaire-des-données-1)
    - [Tableau Récapitulatif des Ressources](#tableau-récapitulatif-des-ressources)
  - [Modèle Conceptuel des Données (MCD)](#modèle-conceptuel-des-données-mcd)
  - [Remarques](#remarques)
  - [Références](#références)

## Lancer le Projet

### Installer les Dépendances

Assurez-vous d'avoir [Node.js](https://nodejs.org/) installé sur votre machine.

## Conception :

### Dictionnaire des Données

#### Terrains

- **Ressource :** `/terrains`
- **URL :** `/terrains`
- **Méthodes HTTP :** GET, POST
- **Paramètres d'URL/Variations :** N/A
- **Commentaires :** Liste des terrains, ajout d'un terrain

#### Créneaux

- **Ressource :** `/creneaux`
- **URL :** `/creneaux`
- **Méthodes HTTP :** GET, POST, DELETE
- **Paramètres d'URL/Variations :** N/A
- **Commentaires :** Liste des créneaux, ajout et suppression

#### Adhérents

- **Ressource :** `/adherents`
- **URL :** `/adherents`
- **Méthodes HTTP :** GET, POST
- **Paramètres d'URL/Variations :** N/A
- **Commentaires :** Liste des adhérents, ajout d'un adhérent

#### Réservations

- **Ressource :** `/reservations`
- **URL :** `/reservations`
- **Méthodes HTTP :** GET, POST, DELETE
- **Paramètres d'URL/Variations :** N/A
- **Commentaires :** Liste des réservations, ajout et suppression

#### Administrateurs

- **Ressource :** `/administrateurs`
- **URL :** `/administrateurs`
- **Méthodes HTTP :** GET, POST
- **Paramètres d'URL/Variations :** N/A
- **Commentaires :** Liste des administrateurs, ajout d'un administrateur

### Dictionnaire des Données

| Ressource         | Code            | Type | Obligatoire ? | Taille | Commentaires |
| ------------------ | --------------- | ---- | ------------- | ------ | ------------ |
| Terrains           | terrain_id      | AN   | Oui           | 1      | Identifiant unique du terrain (A, B, C, D) |
| Créneaux           | creneau_id      | AN   | Oui           |        | Identifiant unique du créneau |
| Adhérents          | adherent_id     | AN   | Oui           |        | Identifiant unique de l'adhérent |
| Réservations       | reservation_id  | AN   | Oui           |        | Identifiant unique de la réservation |
| Administrateurs    | admin_id        | AN   | Oui           |        | Identifiant unique de l'administrateur |
| Date et Heure      | datetime        | D    | Oui           |        | Date et heure de la réservation |
| Statut Réservation | status          | A    | Oui           |        | to_confirm, confirmed, canceled |


### Tableau Récapitulatif des Ressources

| Ressource         | URL              | Méthodes HTTP       | Paramètres d'URL/Variations | Commentaires                        |
|-------------------|------------------|---------------------|-----------------------------|------------------------------------|
| Terrains          | `/terrains`      | GET, POST           | N/A                         | Liste des terrains, ajout d'un terrain |
| Créneaux          | `/creneaux`      | GET, POST, DELETE   | N/A                         | Liste des créneaux, ajout et suppression |
| Adhérents         | `/adherents`     | GET, POST           | N/A                         | Liste des adhérents, ajout d'un adhérent |
| Réservations      | `/reservations`  | GET, POST, DELETE   | N/A                         | Liste des réservations, ajout et suppression |
| Administrateurs   | `/administrateurs` | GET, POST         | N/A                         | Liste des administrateurs, ajout d'un administrateur |

Nom de la ressource | URL | Méthodes HTTP | Paramètres d’URL/Variations | Commentaires
--- | --- | --- | --- | ---
Liste des Terrains | `/terrains` | GET | N/A | Liste des terrains disponibles
Détails d'un Terrain | `/terrains/{id-terrain}` | GET | N/A | Informations détaillées sur un terrain spécifique
Réserver un Terrain | `/terrains/{id-terrain}/reservations` | POST | N/A | Effectuer une réservation pour un terrain spécifique
Liste des Réservations d'un Terrain | `/terrains/{id-terrain}/reservations` | GET | N/A | Liste des réservations pour un terrain spécifique
Annuler une Réservation | `/terrains/{id-terrain}/reservations/{id-reservation}` | DELETE | N/A | Annuler une réservation pour un terrain spécifique


## Modèle Conceptuel des Données (MCD)

[Lien vers le MCD](#lien-mcd)

## Remarques

Ajoutez ici vos remarques sur le travail réalisé, les difficultés rencontrées, etc.

## Références

Ajoutez ici la liste des références (sites web, cours, livres, articles, billets de blog, etc.) qui vous ont aidé à concevoir et développer votre système.
