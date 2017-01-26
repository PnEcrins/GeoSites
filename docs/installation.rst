============
INSTALLATION
============
.. image:: http://geonature.fr/img/logo-pne.jpg
    :target: http://www.ecrins-parcnational.fr

-----

Prérequis
=========

Application développée et installée sur un serveur contenant :

- Ubuntu 12.04
- PostgreSQL 9.1
- PostGIS 1.5
- Apache


Création de la base de données
==============================

La BDD PostgreSQL/PostGIS a été créée à partir de la BDD Access GEOTOPE mise en place en place par le BRGM pour la réalisation de l'Inventaire National du Patrimoine Géologique. 

Elle a été dupliquée tel quel en gardant les noms des tables et des champs. Seule une table ``photos`` a été ajoutée pour pouvoir stocker les photos complémentaires de chaque site géologique. 

Pour créer la base de données, éxécutez le fichier ``/data/shema_geologie.sql``.

Cette BDD contient une vue qui doit renvoyer les sites avec les informations suivantes :
::
    CREATE OR REPLACE VIEW geologie.v_sites AS 
    SELECT DISTINCT 
       s.id_site, 
       s.nom_site, 
       s.typologie3, 
       s.typologie2, 
       s.eval_interet_patrim, 
       s.lieudit, 
       s.description_physique, 
       s.superficie, 
       s.unite_superficie, 
       s.periode_ouverture, 
       s.rarete, 
       s.comment_description, 
       s.etat1, 
       s.etat2, 
       g.coupe_geol, 
       g.commentaire_geol, 
       g.phenomene_geol, 
       lg.libelle, 
       g.interet_geol, 
       g.justif_interet_geol, 
       s1.nom_francais AS strati_ancien_phenom, 
       s2.nom_francais AS strati_recent_phenom, 
       s3.nom_francais AS strati_ancien_terrain, 
       s4.nom_francais AS strati_recent_terrain, 
       s.interet_tourist_economique, 
       s.vulnerabilite_naturelle, 
       s.menace_anthrop_actuelle, 
       s.menace_anthrop_previsible, 
       s.itineraire, 
       s.createur, 
       s.date_creat_site, 
       s.accessibilite1, 
       s.accessibilite2, 
       s.autorisation_prealable, 
       ((((st.statut_proprietaire1::text || ' - '::text) || st.statut_proprietaire2::text) || ' ('::text) || st.nom_proprietaire::text) || ')'::text AS proprietaire, 
       ((((st.statut_gestionnaire1::text || ' - '::text) || st.statut_gestionnaire2::text) || ' ('::text) || st.nom_gestionnaire::text) || ')'::text AS gestionnaire, 
       st.commentaire, st.protection_juridique, 
       st.protection_physique, 
       array_to_string(array_agg(DISTINCT lc.nom_commune ORDER BY lc.nom_commune), ', '::text) AS commune, 
       lr.nom AS nom_region, 
       ld.nom AS nom_departement, 
       s.code_region, 
       array_to_string(array_agg(DISTINCT l.nom_francais ORDER BY l.nom_francais), ', '::text) AS lithologie_nom_francais, 
       st_asgeojson(s.the_geom_point) AS geometry
   FROM geologie.site s
       LEFT JOIN geologie.geologie g ON s.id_site::text = g.id_site::text
       LEFT JOIN geologie.l_gilges lg ON g.code_gilges::text = lg.code::text
       LEFT JOIN geologie.coupe_geol cg ON g.id_site::text = cg.id_site::text
       LEFT JOIN geologie.ln_lithologie l ON cg.id_litho::text = l.id_litho::text
       LEFT JOIN geologie.ln_stratigraphie s1 ON s1.id_strati::text = g.strati_ancien_phenom::text
       LEFT JOIN geologie.ln_stratigraphie s2 ON s2.id_strati::text = g.strati_recent_phenom::text
       LEFT JOIN geologie.ln_stratigraphie s3 ON s3.id_strati::text = g.strati_ancien_terrain::text
       LEFT JOIN geologie.ln_stratigraphie s4 ON s4.id_strati::text = g.strati_recent_terrain::text
       LEFT JOIN geologie.statut st ON s.id_site::text = st.id_site::text
       LEFT JOIN geologie.site_commune sc ON s.id_site::text = sc.id_site::text
       LEFT JOIN geologie.ln_commune lc ON sc.num_insee::text = lc.num_insee::text
       LEFT JOIN geologie.site_departement sd ON s.id_site::text = sd.id_site::text
       LEFT JOIN geologie.ln_departement ld ON sd.num_dept::text = ld.num_dept::text
       LEFT JOIN geologie.ln_region lr ON s.code_region::text = lr.code_region::text
   WHERE s.confidentialite::text = 'Public'::text
   GROUP BY s.id_site, lg.libelle, g.commentaire_geol, g.coupe_geol, g.phenomene_geol, g.interet_geol, g.justif_interet_geol, s1.nom_francais, s2.nom_francais, s3.nom_francais, s4.nom_francais, st.statut_proprietaire1, st.statut_proprietaire2, st.nom_proprietaire, st.statut_gestionnaire1, st.statut_gestionnaire2, st.nom_gestionnaire, st.commentaire, st.protection_juridique, st.protection_physique, lr.nom, ld.nom
   ORDER BY s.id_site;
   
Le nom de cette vue peut être différent et paramétré dans le fichier ``config/config.php``. Si votre BDD est différente de celle par défaut, modifiez la pour qu'elle renvoie bien les mêmes données et noms de champs. 

3 autres vues retournent des données nécessaires à un bon affichage du contenu de l'application. Celles-ci ne sont pas configurables (en dur dans le fichier `/js/controllers/modalDetailsController.js`) et doivent donc avoir le même nom et renvoyer le même contenu :
::
  CREATE OR REPLACE VIEW geologie.v_interets_sites AS -- Intérêt géologique de chaque site
    SELECT i.id_site, i.interet1, i.interet2, i.justification
    FROM geologie.interet_second i
    ORDER BY i.interet1 DESC, i.interet2; 
  
  CREATE OR REPLACE VIEW geologie.v_documents_sites AS -- Documents attachés à chaque site
    SELECT documentation.id_site, documentation.type_document, documentation.fichier, documentation.commentaire
    FROM geologie.documentation
    ORDER BY documentation.type_document;
  
  CREATE OR REPLACE VIEW geologie.v_photos AS -- Photos associées à chaque site (en plus de la photo principale non stockée en BDD)
    SELECT photos.id_site, photos.fichier, photos.legende, photos.ordre, photos.id_photo
    FROM geologie.photos
    ORDER BY photos.id_site;

Une fois la BDD créée, les données ont été importées tel quel dans chaque table en exportant des CSV deuis la BDD Access d'origine. 

La photo principale de chaque site (affichée dans la liste des résultats et dans la fiche détail) a été extraite manuellement de chaque PDF, ensuite être nommée ``photoID_DU_SITE.png`` (par exemple ``photoPAC0052.png``) et chargée dans le dossier ``/data/img/``.

Il est possible d'ajouter des photos complémentaires pour chaque site. Elles seront affichées dans une galerie dans la fiche détail du site. Elles doivent être chargées dans le dossier ``/data/img/`` et être renseignées dans la table ``geologie.photos``.

Les coordonnées des sites géologiques sont stockées dans la table ``geologie.emprise`` en L2E (27572). A partir de ces suites ordonnées de coordonnées, il est possible de récréer la géométrie des polygones pour les stocker dans un champs géométrie ajouté dans la BDD (en WGS 84 / 4326). 
::
	SELECT AddGeometryColumn('geologie', 'site', 'the_geom_4326', 4326, 'POLYGON', 2);

	ALTER TABLE geologie.site DROP CONSTRAINT enforce_geotype_the_geom_4326;

	ALTER TABLE geologie.site
	  ADD CONSTRAINT enforce_geotype_the_geom_4326 CHECK (geometrytype(the_geom_4326) = 'POLYGON'::text OR geometrytype(the_geom_4326) = 'POINT'::text OR the_geom_4326 IS NULL);

	UPDATE geologie.site SET the_geom_4326 = (SELECT ST_transform(SetSrid(ST_GeomFromText('POLYGON((' || string_agg(x || ' ' || y, ',')  ||'))'),27572),4326) FROM geologie.emprise WHERE id_site = 'PAC0057') WHERE id_site = 'PAC0057';


Nous avons ensuite remplacé ce champs ``the_geom_4326`` contenant les polygones de chaque site par le champs ``the_geom_point`` contenant le centroïde de chaque site géologique. 
	
	
Installation de l'application
=============================

Exécutez la commande suivante :
::
        wget https://github.com/PnEcrins/GeoSites/archive/master.zip
        unzip master.zip

**Connexion à la base de données** 

Créez un fichier de configuration à partir du fichier d'exemple :
::
        cp config/config.php.sample config/config.php

Renseignez vos informations de connexion dans le fichier ``config/config.php``.


**Configuration Apache** 

Créez un fichier de configuration apache ``.htaccess`` à partir du fichier d'exemple :
::
        cp .htaccess.sample .htaccess

Si l'url de votre application n'est pas celle de votre domaine (ou sous domaine), modifiez la partie 
::
        RewriteBase / 

Et indiquez le chemin après le ``/``. Par exemple si votre application se trouve à cette url ``http://mondomaine/geologie``, modifiez la variable ``RewriteBase`` ainsi
::
       RewriteBase /geologie/ 
       
**Configuration de la recherche par localisation géographique** 

Créez un fichier de configuration apache ``.htaccess`` à partir du fichier d'exemple :
::
        cp data/communes.json.sample data/communes.json
        
Adaptez le contenu du fichier ``communes.json`` à votre contexte.
        
        
Personnalisation de l'application
=================================

Personnalisez le contenu en modifiant la valeur des variables disponibles dans ``config/config.php``.

Personnalisez la carte en créant le fichier de configuration ``/config/configmap.json`` à partir du fichier exemple ``/config/configmap.json.sample`` :
::
        cp config/configmap.json.sample config/configmap.json
  
Complétez le fichier ``/config/configmap.json`` avec le centre de votre territoire, votre clé IGN...


Modifiez les images dans le répertoire ``img``.

* Par exemple ``img/logo.png`` pour le logo de votre organisme.

Vous pouvez modifier lespages d'information en éditant les fichiers HTML dans le répertoire ``/templates/`` et notamment, adaptez le contenu des fichiers :

* modalAccueil.html
* modalAide.html
* modalContact.html
* modalPne.html
    
Quelques éléments de personnalisation se trouvent également dans :

* navBar.html
* listeSidebar.html

Le fichier GeoJSON des communes (``/data/communes.json``) permet de se recentrer sur une commune. 

Il ne contient que la BBOX de chaque commune pour être le plus léger possible et permettre de se recentrer rapidement sur une commune. 

Format de données attendu :
::
	[
		{		
			"label":"Besse",
			"st_xmax":6.2656616177016,
			"st_xmin":6.15196886390156,
			"st_ymax":45.1647637218539,
			"st_ymin":45.0565025414142
		},
		{		
			"label":"Clavans-en-Haut-Oisans",
			"st_xmax":6.20440719882425,
			"st_xmin":6.13229295244551,
			"st_ymax":45.1565961339785,
			"st_ymin":45.0501814057885
		}
	]

Pour cela vous pouvez partir de la couche SIG des communes de votre territoire, l'intégrer dans une table dans une BDD PostGIS.

Il faut ensuite créer les champs ``x_min``, ``x_max``, ``y_min``, ``y_max`` et les renseigner avec la commande :
::
	UPDATE zonage."Communes_PNE" set x_min = ST_XMin(ST_Transform(ST_SetSRID(the_geom,2154),4326))

Vous pouvez alors ouvrir la table dans QGIS pour l'enregistrer au format GEOJSON.

Adaptez le fichier généré pour qu'il corresponde au format attendu et importez le dans le dossier ``/data/``.

Le nom du fichier et son label peuvent être paramétrés dans le fichier ``config/configmap.json``.

Développement
=============

Cette application WEB peut aussi être utilisée pour mettre en ligne d'autres types de données localisées. 

Pour cela il faut créer une nouvelle base de données, mettre en place une vue qui sera interrogée par l'application.

Il faut ensuite modifier les fichiers de template de l'application pour redéfinir les champs de la vue à afficher dans la liste des résultats et dans les fiches détails (``/templates/listeSidebar.html`` et ``/templates/modalDetails.html``).

Le champ ``id_site`` est nécéssaire car il est utilisé au-delà des templates (``generatejson.php``, ``js/controllers/homeController.js``  et ``js/controllers/modalDetailsController.js``).

Généricité à compléter...
