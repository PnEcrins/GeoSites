=========
CHANGELOG
=========

1.2.0 (unreleased)
------------------

**Nouveautés**

- Ajout du suivi des statistiques avec Google Analytics (paramètre `$ID_GA` à ajouter dans `config/config.php`)
- Ajout de `ng-cloak` à la balise `<body>` pour améliorer l'affichage du `title` de l'application
- Passage des vues renvoyant la liste des photos et des documents des sites en paramètre (`$vuephotos` et `$vuedocuments` à ajouter dans `config/config.php`)
- Simplification du MASK de chargement en retirant le logo PNE et le background

**Corrections**

- Amélioration du caroussel affichant les photos dans le fiche d'un site
- Valeurs du filtre trié par ordre alphabétique
- Améliorations mineures du contenu des modales
- Nettoyage mineu du code


1.1.1 (2017-01-26)
------------------

**Corrections**

- Correction fermeture puis ouverture modale. Fix #71


1.1.0 (2016-05-31)
------------------

**Nouveautés**

- Chaque modale affichant le détail d'un site dispose désormais de sa propre URL. Fixes #45 
- Chaque modale dispose désormais de son propre titre (`<title>`), contenant le nom du site pour optisimiser son référencement. Fixes #45 
- Les filtres sont désormais dynamiques. Chaque fois qu'une valeur est sélectionnée, la liste et la carte sont mis à jour. Fixes #61 
- Correction d'une faille de sécurité dans la génération dynamique du fichier GeoJSON.


1.0.0 (2016-05-27)
------------------

Première version de GeoSites
- Liste des sites géologiques (sites publics uniquement)
- Carte des objets navigable avec fonds IGN, Openstreetmap et affichage de la carte géologique (WMS BRGM)
- Fiche détaillée de chaque objet (texte, photos, PDF)
- Recherche libre + filtre par Intérêt géologique
- Recentrage sur une commune
- Responsive design pour s'adapter aux différentes tailles d'écrans (dont les mobiles)

