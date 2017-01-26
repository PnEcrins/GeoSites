GeoSites
========

Application WEB permettant de consulter l'inventaire du patrimoine géologique. 

Développée par le Parc national des Ecrins pour mettre à disposition du grand public les sites géologiques remarquables de son territoire : `<http://geologie.ecrins-parcnational.fr/>`_.

GeoSites permet de mettre en ligne une application WEB grand public pour consulter l'inventaire du patrimoine géologique d'un territoire. Cet inventaire est coordonné au niveau national par la CPPG (Commission permanente du patrimoine géologique) et validé scientifiquement par le MNHN (Muséum national d'Histoire naturelle) et le BRGM (Bureau de Recherches Géologiques et Minières). 
`<https://inpn.mnhn.fr/programme/patrimoine-geologique/presentation>`_
`<http://www.brgm.fr/projet/patrimoine-geologique-outil-saisie-inventaire-i-geotope>`_

Initialement saisi dans la base de données GEOTOPE mis en place avec Microsoft Access par le BRGM, le Parc national des Ecrins a souhaité migrer ces données dans une BDD PostgreSQL / PostGIS et développer une application WEB grand public pour consulter ces données.

.. image :: docs/images/geositeapp-presentation.jpg

Cette application WEB peut aussi être utilisée pour mettre en ligne d'autres types de données localisées. Voir rubrique Développement de la documentation.

Présentation au `Forum TIC 2016 <http://forum-tic.espaces-naturels.fr/edition/2016>`_ : http://forum-tic.espaces-naturels.fr/sites/default/files/fichiers/presentations/5_geosites_cmonchicourt.pdf

Technologies
------------

- Langages : PHP, HTML, JS, CSS
- BDD : PostgreSQL, PostGIS
- Serveur : Debian ou Ubuntu
- Framework JS : AngularJS
- Framework CSS : Bootstrap
- Framework carto : LeafLet
- Fonds carto : Geoportail, OpenStreetMap, Google Maps, WMS

Fonctionnalités
---------------

- Liste des sites géologiques (sites publics uniquement)
- Carte des objets navigable avec fonds IGN, Openstreetmap et affichage de la carte géologique (WMS BRGM)
- Fiche détaillée de chaque objet (texte, photos, PDF)
- Recherche libre + filtre
- Recentrage sur une commune
- Filtre de la liste des résultats en fonction de la zone de la carte affichée
- Responsive design pour s'adapter aux différentes tailles d'écrans (dont les mobiles)

Installation
------------

Consulter la documentation :  `<https://github.com/PnEcrins/GeoSites/blob/master/docs/installation.rst>`_

License
-------

* Application développée par Thibault Romanin et Gil Deluermoz (Parc national des Ecrins)
* OpenSource - BSD
* Copyright (c) 2016 - Parc National des Écrins


.. image:: http://geonature.fr/img/logo-pne.jpg
    :target: http://www.ecrins-parcnational.fr
