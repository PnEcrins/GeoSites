============
INSTALLATION
============
.. image:: http://geotrek.fr/images/logo-pne.png
    :target: http://www.ecrins-parcnational.fr

-----

Création de la base de données
==============================

TODO : script sql de création de la base.

Une vue doit renvoyer les sites avec les informations suivantes :
CREATE OR REPLACE VIEW geologie.v_sites AS 
    SELECT DISTINCT 
       s.id_site, 
       s.nom_site, 
       s.typologie3, 
       s.typologie2, 
       s.eval_interet_patrim, 
       s.confidentialite, 
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

3 autres vues retournes des données nécessaires à un bon affichage du contenu de l'application

  CREATE OR REPLACE VIEW geologie.v_interets_sites AS 
    SELECT i.id_site, i.interet1, i.interet2, i.justification
    FROM geologie.interet_second i
    ORDER BY i.interet1 DESC, i.interet2; 
  
  CREATE OR REPLACE VIEW geologie.v_documents_sites AS 
    SELECT documentation.id_site, documentation.type_document, documentation.fichier, documentation.commentaire
    FROM geologie.documentation
    ORDER BY documentation.type_document;
  
  CREATE OR REPLACE VIEW geologie.v_photos AS 
    SELECT photos.id_site, photos.fichier, photos.legende, photos.ordre, photos.id_photo
    FROM geologie.photos
    ORDER BY photos.id_site;

Installation de l'application
=============================

Exécuter la commande suivante :
::
  wget https://github.com/PnEcrins/GeoSiteApp/archive/master.zip
  unzip master.zip

Connexion à la base de données :
::
  cp config/config.php.sample config/config.php

Renseignez vos informations de connexion dans le fichier `config/config.php`.


Personnalisation de l'application
==============================
Personnalisez le contenu en modifiant la valeur des variables disponibles dans `config/config.php`.

Modifiez les images dans le répertoire `img`

    * Par exemple : `img/logo.png` pour le logo de votre organisme.

Modifier les templates html dans le répertoire `templates` et notamment, adaptez le contenu des fichiers
    * modalAccueil.html
    * modalAccueil.html
    * modalAide.html
    * modalContact.html
    * modalAPne.html
    
quelques éléments de personnalisation se trouvent également dans
    * navBar.html
    * listeSidebar.html

