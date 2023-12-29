/**
 * Export des fonctions helpers pour la spécification HAL
 * Voir la spécification HAL : https://stateless.group/hal_specification.html
 * Voir la spécification HAL (RFC, source) : https://datatracker.ietf.org/doc/html/draft-kelly-json-hal
 */

/**
 * Retourne un Link Object, conforme à la spécification HAL
 * @param {string} url 
 * @param {string} type 
 * @param {string} name 
 * @param {boolean} templated 
 * @param {boolean} deprecation 
 * @returns {object}
 */
function halLinkObject(url, type = '', name = '', templated = false, deprecation = false) {
    return {
        href: url,
        templated: templated,
        type: type || undefined,
        name: name || undefined,
        deprecation: deprecation || undefined
    };
}

/**
 * Retourne une représentation Ressource Object (HAL) d'un terrain
 * @param {object} terrainData Données brutes d'un terrain
 * @param {string} baseURL URL de base de l'API
 * @returns {object} Ressource Object Terrain (spec HAL)
 */
function mapTerrainToResourceObject(terrainData, baseURL) {
    return {
        _links: {
            self: halLinkObject(baseURL + '/terrains/' + terrainData.id),
            creneaux: halLinkObject(baseURL + '/terrains/' + terrainData.id + '/creneaux'),
            reservations: halLinkObject(baseURL + '/terrains/' + terrainData.id + '/reservations')
        },
        id: terrainData.id,
        nom: terrainData.nom,
        geoposition: terrainData.geoposition,
    };
}

/**
 * Retourne une représentation Ressource Object (HAL) d'un créneau
 * @param {object} creneauData Données brutes d'un créneau
 * @param {string} baseURL URL de base de l'API
 * @returns {object} Ressource Object Créneau (spec HAL)
 */
function mapCreneauToResourceObject(creneauData, baseURL) {
    return {
        _links: {
            self: halLinkObject(baseURL + '/creneaux/' + creneauData.id),
            terrain: halLinkObject(baseURL + '/terrains/' + creneauData.terrain_id)
        },
        id: creneauData.id,
        heure_debut: creneauData.heure_debut,
        heure_fin: creneauData.heure_fin,
        jour: creneauData.jour,
        is_active: creneauData.is_active,
    };
}

/**
 * Retourne une représentation Ressource Object (HAL) d'une réservation
 * @param {object} reservationData Données brutes d'une réservation
 * @param {string} baseURL URL de base de l'API
 * @returns {object} Ressource Object Réservation (spec HAL)
 */
function mapReservationToResourceObject(reservationData, baseURL) {
    return {
        _links: {
            self: halLinkObject(baseURL + '/reservations/' + reservationData.id),
            creneau: halLinkObject(baseURL + '/creneaux/' + reservationData.creneaux_id),
            adherent: halLinkObject(baseURL + '/adherents/' + reservationData.id_adherent)
        },
        id: reservationData.id,
        date_debut: reservationData.date_debut,
        date_fin: reservationData.date_fin,
    };
}

/**
 * Retourne une représentation Ressource Object (HAL) d'un adhérent
 * @param {object} adherentData Données brutes d'un adhérent
 * @param {string} baseURL URL de base de l'API
 * @returns {object} Ressource Object Adhérent (spec HAL)
 */
function mapAdherentToResourceObject(adherentData, baseURL) {
    return {
        _links: {
            self: halLinkObject(baseURL + '/adherents/' + adherentData.id),
        },
        id: adherentData.id,
        pseudo: adherentData.pseudo,
        is_admin: adherentData.is_admin,
    };
}

module.exports = {
    halLinkObject,
    mapTerrainToResourceObject,
    mapCreneauToResourceObject,
    mapReservationToResourceObject,
    mapAdherentToResourceObject
};
