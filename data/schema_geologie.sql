--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.20
-- Dumped by pg_dump version 9.2.0
-- Started on 2016-03-04 13:52:22

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 18264)
-- Name: geologie; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA geologie;


SET search_path = geologie, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 166 (class 1259 OID 18265)
-- Name: collection; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE collection (
    id_site character varying(10) NOT NULL,
    type_collection character varying(50) NOT NULL,
    description character varying(255) NOT NULL,
    adresse character varying(255) NOT NULL,
    date_modif date NOT NULL,
    id_auteur_modif character varying(10) NOT NULL
);


--
-- TOC entry 167 (class 1259 OID 18271)
-- Name: coupe_geol; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE coupe_geol (
    id_site character varying(10) NOT NULL,
    id_litho character varying(8) NOT NULL,
    id_strati character varying(3) NOT NULL,
    "position" integer,
    epaisseur double precision,
    age_abs double precision,
    prof_deb integer DEFAULT 0,
    prof_fin integer DEFAULT 0,
    commentaire character varying(100),
    date_modif date NOT NULL,
    id_auteur_modif character varying(10) NOT NULL
);


--
-- TOC entry 168 (class 1259 OID 18276)
-- Name: documentation; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE documentation (
    id_site character varying(10) NOT NULL,
    numero real NOT NULL,
    type_document character varying(30) NOT NULL,
    numerise character varying(3),
    fichier character varying(255) NOT NULL,
    commentaire character varying(255) NOT NULL,
    date_modif date NOT NULL,
    id_auteur_modif character varying(10) NOT NULL
);


--
-- TOC entry 169 (class 1259 OID 18282)
-- Name: emprise; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE emprise (
    id_site character varying(10) NOT NULL,
    no_ordre integer NOT NULL,
    x double precision NOT NULL,
    y double precision NOT NULL,
    x_l2e double precision NOT NULL,
    y_l2e double precision NOT NULL
);


--
-- TOC entry 170 (class 1259 OID 18285)
-- Name: geologie; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE geologie (
    id_site character varying(10) NOT NULL,
    code_gilges character varying(1) NOT NULL,
    phenomene_geol character varying(30),
    strati_ancien_phenom character varying(3),
    age_ancien_phenom integer,
    strati_recent_phenom character varying(3),
    age_recent_phenom integer,
    strati_ancien_terrain character varying(3),
    age_ancien_terrain integer,
    strati_recent_terrain character varying(3),
    age_recent_terrain integer,
    coupe_geol character varying(3),
    commentaire_coupe_geol character varying(255),
    interet_geol character varying(30) NOT NULL,
    justif_interet_geol character varying(255) NOT NULL,
    interet_histoire_geol character varying(255),
    commentaire_geol text NOT NULL,
    date_modif date NOT NULL,
    id_auteur_modif character varying(10) NOT NULL
);


--
-- TOC entry 171 (class 1259 OID 18291)
-- Name: interet_second; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE interet_second (
    id_site character varying(10) NOT NULL,
    interet1 character varying(30) NOT NULL,
    interet2 character varying(30) NOT NULL,
    justification text NOT NULL,
    date_modif date NOT NULL,
    id_auteur_modif character varying(10) NOT NULL
);


--
-- TOC entry 172 (class 1259 OID 18297)
-- Name: inventaire; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE inventaire (
    id_site character varying(10) NOT NULL,
    type_inventaire character varying(50) NOT NULL,
    ref_inventaire character varying(20) NOT NULL,
    date_inventaire date,
    date_modif date NOT NULL,
    id_auteur_modif character varying(10) NOT NULL
);


--
-- TOC entry 173 (class 1259 OID 18300)
-- Name: l_accessibilite; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_accessibilite (
    accessibilite1 character varying(30) NOT NULL,
    accessibilite2 character varying(30) NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 18303)
-- Name: l_confidentialite; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_confidentialite (
    libelle character varying(15) NOT NULL
);


--
-- TOC entry 175 (class 1259 OID 18306)
-- Name: l_etat; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_etat (
    etat1 character varying(30) NOT NULL,
    etat2 character varying(30) NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 18309)
-- Name: l_gilges; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_gilges (
    code character varying(3) NOT NULL,
    libelle character varying(200) NOT NULL
);


--
-- TOC entry 177 (class 1259 OID 18312)
-- Name: l_interet; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_interet (
    interet1 character varying(30) NOT NULL,
    interet2 character varying(30) NOT NULL
);


--
-- TOC entry 178 (class 1259 OID 18315)
-- Name: l_nature_even; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_nature_even (
    code character varying(2) NOT NULL,
    libelle character varying(50) NOT NULL
);


--
-- TOC entry 179 (class 1259 OID 18318)
-- Name: l_origine_coordonnee; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_origine_coordonnee (
    libelle character varying(30) NOT NULL
);


--
-- TOC entry 180 (class 1259 OID 18321)
-- Name: l_ouinon; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_ouinon (
    libelle character varying(15) NOT NULL
);


--
-- TOC entry 181 (class 1259 OID 18324)
-- Name: l_periode; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_periode (
    libelle character varying(15) NOT NULL
);


--
-- TOC entry 182 (class 1259 OID 18327)
-- Name: l_phenomene_geol; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_phenomene_geol (
    phenomene character varying(30) NOT NULL,
    explication character varying(255)
);


--
-- TOC entry 183 (class 1259 OID 18330)
-- Name: l_qualite; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_qualite (
    libelle character varying(30) NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 18333)
-- Name: l_rarete; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_rarete (
    libelle character varying(15) NOT NULL
);


--
-- TOC entry 185 (class 1259 OID 18336)
-- Name: l_statut_gestion; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_statut_gestion (
    statut1 character varying(20) NOT NULL,
    statut2 character varying(20) NOT NULL
);


--
-- TOC entry 186 (class 1259 OID 18339)
-- Name: l_statut_protection; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_statut_protection (
    statut1 character varying(15) NOT NULL,
    statut2 character varying(80) NOT NULL,
    num_fiche_juridique character varying(5) NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 18342)
-- Name: l_titre; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_titre (
    code character varying(4) NOT NULL,
    libelle character varying(50) NOT NULL
);


--
-- TOC entry 188 (class 1259 OID 18345)
-- Name: l_type_coordonnees; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_type_coordonnees (
    code integer NOT NULL,
    libelle character varying(30) NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 18348)
-- Name: l_type_inventaire; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_type_inventaire (
    type_inventaire character varying(50) NOT NULL
);


--
-- TOC entry 190 (class 1259 OID 18351)
-- Name: l_typologie; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_typologie (
    typologie1 character varying(30) NOT NULL,
    typologie2 character varying(30) NOT NULL,
    typologie3 character varying(30) NOT NULL
);


--
-- TOC entry 191 (class 1259 OID 18354)
-- Name: l_unite_superficie; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_unite_superficie (
    libelle character varying(15) NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 18357)
-- Name: l_usage_actuel; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE l_usage_actuel (
    libelle character varying(30) NOT NULL
);


--
-- TOC entry 193 (class 1259 OID 18360)
-- Name: ln_carte_geol50; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE ln_carte_geol50 (
    num_carte character varying(8) NOT NULL,
    nom_carte character varying(50),
    num_ign character varying(4),
    lamb_carte integer NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 18363)
-- Name: ln_carte_marine; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE ln_carte_marine (
    num_carte character varying(6) NOT NULL,
    nom_carte character varying(60) NOT NULL,
    commentaire_nom character varying(100),
    echelle character varying(6) NOT NULL,
    annee integer NOT NULL
);


--
-- TOC entry 195 (class 1259 OID 18366)
-- Name: ln_cartes_ign25; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE ln_cartes_ign25 (
    num_carte character varying(8) NOT NULL,
    nom_carte character varying(100) NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 18369)
-- Name: ln_commune; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE ln_commune (
    num_insee character varying(5) NOT NULL,
    nom_commune character varying(60) NOT NULL,
    num_dept character varying(3) NOT NULL,
    num_commune character varying(3) NOT NULL,
    x double precision,
    y double precision,
    zone_lambert integer,
    num_carte_geol50 character varying(4),
    x_lambert2e integer,
    y_lambert2e integer
);


--
-- TOC entry 197 (class 1259 OID 18372)
-- Name: ln_departement; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE ln_departement (
    num_dept character varying(3) NOT NULL,
    nom character varying(40) NOT NULL,
    code_region character varying(3) NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 18375)
-- Name: ln_lithologie; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE ln_lithologie (
    id_litho character varying(8) NOT NULL,
    id_pere character varying(8),
    origine_litho character varying(8) NOT NULL,
    ord double precision,
    nom_francais character varying(80) NOT NULL,
    commentaire character varying(100),
    cod_list_litho character varying(44)
);


--
-- TOC entry 199 (class 1259 OID 18378)
-- Name: ln_region; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE ln_region (
    code_region character varying(3) NOT NULL,
    nom character varying(40) NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 18381)
-- Name: ln_stratigraphie; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE ln_stratigraphie (
    id_strati character varying(3) NOT NULL,
    nom_francais character varying(100) NOT NULL,
    pere character varying(3),
    ordre double precision NOT NULL,
    code_strati character varying(20),
    int1 double precision,
    int2 double precision,
    idsyn_debut character varying(3) NOT NULL,
    idsyn_fin character varying(3),
    obselete character varying(3),
    regroupement character varying(3),
    anglais character varying(100),
    espagnol character varying(100)
);


--
-- TOC entry 201 (class 1259 OID 18384)
-- Name: lr_auteur; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE lr_auteur (
    id_auteur character varying(10) NOT NULL,
    titre character varying(4),
    nom_auteur character varying(30) NOT NULL,
    prenom_auteur character varying(30),
    qualite character varying(30),
    organisme character varying(50) NOT NULL,
    adresse1 character varying(50),
    adresse2 character varying(50),
    cp character varying(6),
    ville character varying(50),
    cedex character varying(10),
    tel character varying(50),
    fax character varying(50),
    email character varying(50),
    web character varying(50),
    ___caduc character varying(1),
    type_maj character varying(1)
);


--
-- TOC entry 202 (class 1259 OID 18390)
-- Name: lr_biblio; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE lr_biblio (
    id_biblio character varying(50) NOT NULL,
    auteurs character varying(150) NOT NULL,
    date_publication date,
    reference character varying(255),
    titre character varying(200) NOT NULL,
    date_modif date NOT NULL,
    id_auteur_modif character varying(10) NOT NULL,
    organisme character varying(50) NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 18396)
-- Name: ouverture; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE ouverture (
    id_site character varying(10) NOT NULL,
    ouverture_de character varying(9) NOT NULL,
    fermeture_a character varying(9) NOT NULL,
    date_modif date NOT NULL,
    id_auteur_modif character varying(10) NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 18399)
-- Name: photos; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE photos (
    id_site character varying(10) NOT NULL,
    fichier character varying(255),
    legende character varying(255),
    ordre real NOT NULL,
    id_photo integer NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 18405)
-- Name: photos_id_photo_seq; Type: SEQUENCE; Schema: geologie; Owner: -
--

CREATE SEQUENCE photos_id_photo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 205
-- Name: photos_id_photo_seq; Type: SEQUENCE OWNED BY; Schema: geologie; Owner: -
--

ALTER SEQUENCE photos_id_photo_seq OWNED BY photos.id_photo;


--
-- TOC entry 206 (class 1259 OID 18407)
-- Name: site; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE site (
    id_site character varying(10) NOT NULL,
    nom_site character varying(100) NOT NULL,
    code_region character varying(3) NOT NULL,
    typologie1 character varying(30) NOT NULL,
    typologie2 character varying(30) NOT NULL,
    typologie3 character varying(30) NOT NULL,
    confidentialite character varying(15) NOT NULL,
    lieudit character varying(200) NOT NULL,
    type_coordonnees integer NOT NULL,
    precision_coordonnees character varying(1) NOT NULL,
    origine_coordonnees character varying(30) NOT NULL,
    z_min integer,
    z_max integer,
    nom_siege_site character varying(60),
    adresse_siege character varying(200),
    ville_siege character varying(50),
    code_postal character varying(6),
    telephone_siege character varying(14),
    fax_siege character varying(14),
    e_mail character varying(30),
    site_web character varying(50),
    itineraire text NOT NULL,
    accessibilite1 character varying(30) NOT NULL,
    accessibilite2 character varying(30) NOT NULL,
    autorisation_prealable character varying(3) NOT NULL,
    periode_ouverture character varying(15) NOT NULL,
    payant character varying(3) NOT NULL,
    description_physique text NOT NULL,
    superficie double precision NOT NULL,
    unite_superficie character varying(15) NOT NULL,
    etat1 character varying(30),
    etat2 character varying(30),
    interet_tourist_economique character varying(255),
    rarete character varying(15) NOT NULL,
    menace_anthrop_actuelle text NOT NULL,
    menace_anthrop_previsible text NOT NULL,
    vulnerabilite_naturelle text NOT NULL,
    comment_description text,
    ___evaluation text,
    note_interet_geol1 integer,
    eval_interet_geol1 integer,
    note_interet_geol2 integer,
    eval_interet_geol2 integer,
    note_interet_pedag integer,
    eval_interet_pedag integer,
    note_interet_hist_geol integer,
    eval_interet_hist_geol integer,
    note_interet_autre integer,
    eval_interet_autre integer,
    note_rarete_region integer,
    eval_rarete_region integer,
    note_conservation integer,
    eval_conservation integer,
    total_eval_interet integer,
    eval_interet_patrim integer,
    comment_interet_patrim character varying(255),
    note_vuln_naturelle integer,
    eval_vuln_naturelle integer,
    note_menace_anthrop integer,
    eval_menace_anthrop integer,
    note_protection_effective integer,
    eval_protection_effective integer,
    total_eval_protection integer,
    besoin_protection integer,
    comment_protection character varying(255),
    comment_evaluation character varying(255),
    date_creat_site date NOT NULL,
    createur character varying(50) NOT NULL,
    date_modif date NOT NULL,
    id_auteur_modif character varying(10) NOT NULL,
    comment_fiche character varying(255),
    the_geom_point public.geometry,
    CONSTRAINT "enforce_dims_the_geom_POINT" CHECK ((public.st_ndims(the_geom_point) = 2)),
    CONSTRAINT "enforce_geotype_the_geom_POINT" CHECK (((public.geometrytype(the_geom_point) = 'POINT'::text) OR (the_geom_point IS NULL))),
    CONSTRAINT "enforce_srid_the_geom_POINT" CHECK ((public.st_srid(the_geom_point) = 4326)),
    CONSTRAINT site_note_conservation_check CHECK (((note_conservation >= 0) AND (note_conservation <= 3))),
    CONSTRAINT site_note_interet_geol1_check CHECK (((note_interet_geol1 >= 0) AND (note_interet_geol1 <= 3))),
    CONSTRAINT site_note_interet_geol2_check CHECK (((note_interet_geol2 >= 0) AND (note_interet_geol2 <= 3))),
    CONSTRAINT site_note_interet_hist_geol_check CHECK (((note_interet_hist_geol >= 0) AND (note_interet_hist_geol <= 3))),
    CONSTRAINT site_note_interet_pedag_check CHECK (((note_interet_pedag >= 0) AND (note_interet_pedag <= 3))),
    CONSTRAINT site_note_menace_anthrop_check CHECK (((note_menace_anthrop >= 0) AND (note_menace_anthrop <= 3))),
    CONSTRAINT site_note_protection_effective_check CHECK (((note_protection_effective >= 0) AND (note_protection_effective <= 3))),
    CONSTRAINT site_note_rarete_region_check CHECK (((note_rarete_region >= 0) AND (note_rarete_region <= 3))),
    CONSTRAINT site_note_vuln_naturelle_check CHECK (((note_vuln_naturelle >= 0) AND (note_vuln_naturelle <= 3)))
);


--
-- TOC entry 207 (class 1259 OID 18425)
-- Name: site_biblio; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE site_biblio (
    id_site character varying(10) NOT NULL,
    id_biblio character varying(10) NOT NULL,
    date_modif date NOT NULL,
    id_auteur_modif character varying(10) NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 18428)
-- Name: site_carte_25; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE site_carte_25 (
    id_site character varying(10) NOT NULL,
    num_carte character varying(8) NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 18431)
-- Name: site_carte_50; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE site_carte_50 (
    id_site character varying(10) NOT NULL,
    num_carte character varying(8) NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 18434)
-- Name: site_carte_marine; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE site_carte_marine (
    id_site character varying(10) NOT NULL,
    num_carte character varying(6) NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 18437)
-- Name: site_commune; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE site_commune (
    id_site character varying(10) NOT NULL,
    num_insee character varying(5) NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 18440)
-- Name: site_departement; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE site_departement (
    id_site character varying(10) NOT NULL,
    num_dept character varying(3) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 18443)
-- Name: statut; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE statut (
    id_site character varying(10) NOT NULL,
    protection_juridique character varying(3),
    protection_physique character varying(3),
    statut_proprietaire1 character varying(20),
    statut_proprietaire2 character varying(20),
    nom_proprietaire character varying(50),
    statut_gestionnaire1 character varying(20),
    statut_gestionnaire2 character varying(20),
    nom_gestionnaire character varying(50),
    commentaire character varying(255),
    date_modif date,
    id_auteur_modif character varying(10)
);


--
-- TOC entry 214 (class 1259 OID 18446)
-- Name: statut_protection; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE statut_protection (
    id_site character varying(10) NOT NULL,
    statut1 character varying(15) NOT NULL,
    statut2 character varying(80) NOT NULL,
    depuis_le date NOT NULL,
    date_modif date NOT NULL,
    id_auteur_modif character varying(10) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 18449)
-- Name: suivi; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE suivi (
    id_site character varying(10) NOT NULL,
    date date NOT NULL,
    operation text NOT NULL,
    date_modif date NOT NULL,
    id_auteur_modif character varying(10) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 18455)
-- Name: tracabilite; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE tracabilite (
    id_site character varying(10) NOT NULL,
    date_even date NOT NULL,
    auteur_even character varying(255) NOT NULL,
    code_nature_even character varying(2) NOT NULL,
    comment_even character varying(255) NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 18461)
-- Name: u_dossier; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE u_dossier (
    type_document character varying(30) NOT NULL,
    organisme character varying(50) NOT NULL,
    dossier character varying(100) NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 18464)
-- Name: u_erreurcsv; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE u_erreurcsv (
    id_site character varying(50) NOT NULL,
    erreur character varying(250) NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 18467)
-- Name: u_naturedoc; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE u_naturedoc (
    type_document character varying(30) NOT NULL,
    dossier character varying(100)
);


--
-- TOC entry 220 (class 1259 OID 18470)
-- Name: u_organisme; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE u_organisme (
    code_region character varying(3) NOT NULL,
    organisme character varying(50) NOT NULL,
    emprise boolean DEFAULT false,
    nomini integer NOT NULL,
    nomaxi integer NOT NULL,
    pkmini character varying(10) NOT NULL,
    pkmaxi character varying(10) NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 18474)
-- Name: usage_actuel; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE usage_actuel (
    id_site character varying(10) NOT NULL,
    usage character varying(30) NOT NULL,
    depuis_le date NOT NULL,
    commentaire character varying(255) NOT NULL,
    date_modif date NOT NULL,
    id_auteur_modif character varying(10) NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 18477)
-- Name: v_documents_sites; Type: VIEW; Schema: geologie; Owner: -
--

CREATE VIEW v_documents_sites AS
    SELECT documentation.id_site, documentation.type_document, documentation.fichier, documentation.commentaire FROM documentation ORDER BY documentation.type_document;


--
-- TOC entry 223 (class 1259 OID 18481)
-- Name: v_interets_sites; Type: VIEW; Schema: geologie; Owner: -
--

CREATE VIEW v_interets_sites AS
    SELECT i.id_site, i.interet1, i.interet2, i.justification FROM interet_second i ORDER BY i.interet1 DESC, i.interet2;


--
-- TOC entry 224 (class 1259 OID 18485)
-- Name: v_photos; Type: VIEW; Schema: geologie; Owner: -
--

CREATE VIEW v_photos AS
    SELECT photos.id_site, photos.fichier, photos.legende, photos.ordre, photos.id_photo FROM photos ORDER BY photos.id_site;


--
-- TOC entry 226 (class 1259 OID 19091)
-- Name: v_sites; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE v_sites (
    id_site character varying(10),
    nom_site character varying(100),
    typologie3 character varying(30),
    typologie2 character varying(30),
    eval_interet_patrim integer,
    lieudit character varying(200),
    description_physique text,
    superficie double precision,
    unite_superficie character varying(15),
    periode_ouverture character varying(15),
    rarete character varying(15),
    comment_description text,
    etat1 character varying(30),
    etat2 character varying(30),
    coupe_geol character varying(3),
    commentaire_geol text,
    phenomene_geol character varying(30),
    libelle character varying(200),
    interet_geol character varying(30),
    justif_interet_geol character varying(255),
    strati_ancien_phenom character varying(100),
    strati_recent_phenom character varying(100),
    strati_ancien_terrain character varying(100),
    strati_recent_terrain character varying(100),
    interet_tourist_economique character varying(255),
    vulnerabilite_naturelle text,
    menace_anthrop_actuelle text,
    menace_anthrop_previsible text,
    itineraire text,
    createur character varying(50),
    date_creat_site date,
    accessibilite1 character varying(30),
    accessibilite2 character varying(30),
    autorisation_prealable character varying(3),
    proprietaire text,
    gestionnaire text,
    commentaire character varying(255),
    protection_juridique character varying(3),
    protection_physique character varying(3),
    commune text,
    nom_region character varying(40),
    nom_departement character varying(40),
    code_region character varying(3),
    lithologie_nom_francais text,
    geometry text
);


--
-- TOC entry 225 (class 1259 OID 18495)
-- Name: v_sites_old; Type: TABLE; Schema: geologie; Owner: -; Tablespace: 
--

CREATE TABLE v_sites_old (
    id_site character varying(10),
    nom_site character varying(100),
    typologie3 character varying(30),
    typologie2 character varying(30),
    eval_interet_patrim integer,
    confidentialite character varying(15),
    lieudit character varying(200),
    description_physique text,
    superficie double precision,
    unite_superficie character varying(15),
    periode_ouverture character varying(15),
    rarete character varying(15),
    comment_description text,
    etat1 character varying(30),
    etat2 character varying(30),
    commentaire_geol text,
    coupe_geol character varying(3),
    phenomene_geol character varying(30),
    libelle character varying(200),
    interet_geol character varying(30),
    justif_interet_geol character varying(255),
    interet_archeologie text,
    interet_faune text,
    interet_flore text,
    interet_histore text,
    interet_prehistorie text,
    interet_geochronologie text,
    interet_geomorphologie text,
    interet_hydrogeologie text,
    interet_hydrothermalisme text,
    interet_metamorphisme text,
    interet_mineralogie text,
    interet_paleontologie text,
    interet_plutonisme text,
    interet_ressources_naturelles text,
    interet_sedimentologie text,
    interet_stratigraphie text,
    interet_tectonique text,
    interet_volcanisme text,
    interet_amateurs text,
    interet_enseignants text,
    interet_etudiants text,
    interet_geologues text,
    interet_scolaires text,
    interet_tous_publics text,
    strati_ancien_phenom character varying(100),
    strati_recent_phenom character varying(100),
    strati_ancien_terrain character varying(100),
    strati_recent_terrain character varying(100),
    interet_tourist_economique character varying(255),
    vulnerabilite_naturelle text,
    menace_anthrop_actuelle text,
    menace_anthrop_previsible text,
    itineraire text,
    createur character varying(50),
    date_creat_site date,
    accessibilite1 character varying(30),
    accessibilite2 character varying(30),
    autorisation_prealable character varying(3),
    proprietaire text,
    gestionnaire text,
    commentaire character varying(255),
    protection_juridique character varying(3),
    protection_physique character varying(3),
    commune text,
    nom_region character varying(40),
    nom_departement character varying(40),
    code_region character varying(3),
    lithologie_nom_francais text,
    geometry text
);


--
-- TOC entry 2991 (class 2604 OID 18501)
-- Name: id_photo; Type: DEFAULT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY photos ALTER COLUMN id_photo SET DEFAULT nextval('photos_id_photo_seq'::regclass);


--
-- TOC entry 3082 (class 2606 OID 18624)
-- Name: photos_pkey; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id_photo);


--
-- TOC entry 3006 (class 2606 OID 18626)
-- Name: pk_collection; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY collection
    ADD CONSTRAINT pk_collection PRIMARY KEY (id_site, type_collection);


--
-- TOC entry 3008 (class 2606 OID 18628)
-- Name: pk_coupe_geol; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY coupe_geol
    ADD CONSTRAINT pk_coupe_geol PRIMARY KEY (id_site, id_litho, id_strati);


--
-- TOC entry 3010 (class 2606 OID 18630)
-- Name: pk_documentation; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY documentation
    ADD CONSTRAINT pk_documentation PRIMARY KEY (id_site, numero);


--
-- TOC entry 3012 (class 2606 OID 18632)
-- Name: pk_emprise; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY emprise
    ADD CONSTRAINT pk_emprise PRIMARY KEY (id_site, no_ordre);


--
-- TOC entry 3014 (class 2606 OID 18634)
-- Name: pk_geologie; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY geologie
    ADD CONSTRAINT pk_geologie PRIMARY KEY (id_site);


--
-- TOC entry 3016 (class 2606 OID 18636)
-- Name: pk_interet_second; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY interet_second
    ADD CONSTRAINT pk_interet_second PRIMARY KEY (id_site, interet1, interet2);


--
-- TOC entry 3018 (class 2606 OID 18638)
-- Name: pk_inventaire; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY inventaire
    ADD CONSTRAINT pk_inventaire PRIMARY KEY (id_site, type_inventaire);


--
-- TOC entry 3020 (class 2606 OID 18640)
-- Name: pk_l_accessibilite; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_accessibilite
    ADD CONSTRAINT pk_l_accessibilite PRIMARY KEY (accessibilite1, accessibilite2);


--
-- TOC entry 3022 (class 2606 OID 18642)
-- Name: pk_l_confidentialite; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_confidentialite
    ADD CONSTRAINT pk_l_confidentialite PRIMARY KEY (libelle);


--
-- TOC entry 3024 (class 2606 OID 18644)
-- Name: pk_l_etat; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_etat
    ADD CONSTRAINT pk_l_etat PRIMARY KEY (etat1, etat2);


--
-- TOC entry 3026 (class 2606 OID 18646)
-- Name: pk_l_gilges; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_gilges
    ADD CONSTRAINT pk_l_gilges PRIMARY KEY (code);


--
-- TOC entry 3028 (class 2606 OID 18648)
-- Name: pk_l_interet; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_interet
    ADD CONSTRAINT pk_l_interet PRIMARY KEY (interet1, interet2);


--
-- TOC entry 3030 (class 2606 OID 18650)
-- Name: pk_l_nature_even; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_nature_even
    ADD CONSTRAINT pk_l_nature_even PRIMARY KEY (code);


--
-- TOC entry 3032 (class 2606 OID 18652)
-- Name: pk_l_origine_coordonnee; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_origine_coordonnee
    ADD CONSTRAINT pk_l_origine_coordonnee PRIMARY KEY (libelle);


--
-- TOC entry 3034 (class 2606 OID 18654)
-- Name: pk_l_ouinon; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_ouinon
    ADD CONSTRAINT pk_l_ouinon PRIMARY KEY (libelle);


--
-- TOC entry 3036 (class 2606 OID 18656)
-- Name: pk_l_periode; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_periode
    ADD CONSTRAINT pk_l_periode PRIMARY KEY (libelle);


--
-- TOC entry 3038 (class 2606 OID 18658)
-- Name: pk_l_phenomene_geol; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_phenomene_geol
    ADD CONSTRAINT pk_l_phenomene_geol PRIMARY KEY (phenomene);


--
-- TOC entry 3040 (class 2606 OID 18660)
-- Name: pk_l_qualite; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_qualite
    ADD CONSTRAINT pk_l_qualite PRIMARY KEY (libelle);


--
-- TOC entry 3042 (class 2606 OID 18662)
-- Name: pk_l_rarete; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_rarete
    ADD CONSTRAINT pk_l_rarete PRIMARY KEY (libelle);


--
-- TOC entry 3044 (class 2606 OID 18664)
-- Name: pk_l_statut_gestion; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_statut_gestion
    ADD CONSTRAINT pk_l_statut_gestion PRIMARY KEY (statut1, statut2);


--
-- TOC entry 3046 (class 2606 OID 18666)
-- Name: pk_l_statut_protection; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_statut_protection
    ADD CONSTRAINT pk_l_statut_protection PRIMARY KEY (statut1, statut2);


--
-- TOC entry 3048 (class 2606 OID 18668)
-- Name: pk_l_titre; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_titre
    ADD CONSTRAINT pk_l_titre PRIMARY KEY (code);


--
-- TOC entry 3050 (class 2606 OID 18670)
-- Name: pk_l_type_coordonnees; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_type_coordonnees
    ADD CONSTRAINT pk_l_type_coordonnees PRIMARY KEY (code);


--
-- TOC entry 3052 (class 2606 OID 18672)
-- Name: pk_l_type_inventaire; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_type_inventaire
    ADD CONSTRAINT pk_l_type_inventaire PRIMARY KEY (type_inventaire);


--
-- TOC entry 3054 (class 2606 OID 18674)
-- Name: pk_l_typologie; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_typologie
    ADD CONSTRAINT pk_l_typologie PRIMARY KEY (typologie1, typologie2, typologie3);


--
-- TOC entry 3056 (class 2606 OID 18676)
-- Name: pk_l_unite_superficie; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_unite_superficie
    ADD CONSTRAINT pk_l_unite_superficie PRIMARY KEY (libelle);


--
-- TOC entry 3058 (class 2606 OID 18678)
-- Name: pk_l_usage_actuel; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY l_usage_actuel
    ADD CONSTRAINT pk_l_usage_actuel PRIMARY KEY (libelle);


--
-- TOC entry 3060 (class 2606 OID 18680)
-- Name: pk_ln_carte_geol50; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ln_carte_geol50
    ADD CONSTRAINT pk_ln_carte_geol50 PRIMARY KEY (num_carte);


--
-- TOC entry 3062 (class 2606 OID 18682)
-- Name: pk_ln_carte_marine; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ln_carte_marine
    ADD CONSTRAINT pk_ln_carte_marine PRIMARY KEY (num_carte);


--
-- TOC entry 3064 (class 2606 OID 18684)
-- Name: pk_ln_cartes_ign25; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ln_cartes_ign25
    ADD CONSTRAINT pk_ln_cartes_ign25 PRIMARY KEY (num_carte);


--
-- TOC entry 3066 (class 2606 OID 18686)
-- Name: pk_ln_commune; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ln_commune
    ADD CONSTRAINT pk_ln_commune PRIMARY KEY (num_insee);


--
-- TOC entry 3068 (class 2606 OID 18688)
-- Name: pk_ln_departement; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ln_departement
    ADD CONSTRAINT pk_ln_departement PRIMARY KEY (num_dept);


--
-- TOC entry 3070 (class 2606 OID 18690)
-- Name: pk_ln_lithologie; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ln_lithologie
    ADD CONSTRAINT pk_ln_lithologie PRIMARY KEY (id_litho);


--
-- TOC entry 3072 (class 2606 OID 18692)
-- Name: pk_ln_region; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ln_region
    ADD CONSTRAINT pk_ln_region PRIMARY KEY (code_region);


--
-- TOC entry 3074 (class 2606 OID 18694)
-- Name: pk_ln_stratigraphie; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ln_stratigraphie
    ADD CONSTRAINT pk_ln_stratigraphie PRIMARY KEY (id_strati);


--
-- TOC entry 3076 (class 2606 OID 18696)
-- Name: pk_lr_auteur; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lr_auteur
    ADD CONSTRAINT pk_lr_auteur PRIMARY KEY (id_auteur);


--
-- TOC entry 3078 (class 2606 OID 18698)
-- Name: pk_lr_biblio; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lr_biblio
    ADD CONSTRAINT pk_lr_biblio PRIMARY KEY (id_biblio);


--
-- TOC entry 3080 (class 2606 OID 18700)
-- Name: pk_ouverture; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ouverture
    ADD CONSTRAINT pk_ouverture PRIMARY KEY (ouverture_de, id_site);


--
-- TOC entry 3084 (class 2606 OID 18702)
-- Name: pk_site; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY site
    ADD CONSTRAINT pk_site PRIMARY KEY (id_site);


--
-- TOC entry 3086 (class 2606 OID 18704)
-- Name: pk_site_biblio; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY site_biblio
    ADD CONSTRAINT pk_site_biblio PRIMARY KEY (id_site, id_biblio);


--
-- TOC entry 3088 (class 2606 OID 18706)
-- Name: pk_site_carte_25; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY site_carte_25
    ADD CONSTRAINT pk_site_carte_25 PRIMARY KEY (id_site, num_carte);


--
-- TOC entry 3090 (class 2606 OID 18708)
-- Name: pk_site_carte_50; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY site_carte_50
    ADD CONSTRAINT pk_site_carte_50 PRIMARY KEY (id_site, num_carte);


--
-- TOC entry 3092 (class 2606 OID 18710)
-- Name: pk_site_carte_marine; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY site_carte_marine
    ADD CONSTRAINT pk_site_carte_marine PRIMARY KEY (id_site, num_carte);


--
-- TOC entry 3094 (class 2606 OID 18712)
-- Name: pk_site_commune; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY site_commune
    ADD CONSTRAINT pk_site_commune PRIMARY KEY (id_site, num_insee);


--
-- TOC entry 3096 (class 2606 OID 18714)
-- Name: pk_site_departement; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY site_departement
    ADD CONSTRAINT pk_site_departement PRIMARY KEY (id_site, num_dept);


--
-- TOC entry 3098 (class 2606 OID 18716)
-- Name: pk_statut; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY statut
    ADD CONSTRAINT pk_statut PRIMARY KEY (id_site);


--
-- TOC entry 3100 (class 2606 OID 18718)
-- Name: pk_statut_protection; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY statut_protection
    ADD CONSTRAINT pk_statut_protection PRIMARY KEY (id_site, statut1, statut2);


--
-- TOC entry 3102 (class 2606 OID 18720)
-- Name: pk_suivi; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY suivi
    ADD CONSTRAINT pk_suivi PRIMARY KEY (id_site, date);


--
-- TOC entry 3104 (class 2606 OID 18722)
-- Name: pk_tracabilite; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tracabilite
    ADD CONSTRAINT pk_tracabilite PRIMARY KEY (id_site, date_even);


--
-- TOC entry 3106 (class 2606 OID 18724)
-- Name: pk_u_dossier; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY u_dossier
    ADD CONSTRAINT pk_u_dossier PRIMARY KEY (type_document, organisme);


--
-- TOC entry 3108 (class 2606 OID 18726)
-- Name: pk_u_erreurcsv; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY u_erreurcsv
    ADD CONSTRAINT pk_u_erreurcsv PRIMARY KEY (id_site);


--
-- TOC entry 3110 (class 2606 OID 18728)
-- Name: pk_u_naturedoc; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY u_naturedoc
    ADD CONSTRAINT pk_u_naturedoc PRIMARY KEY (type_document);


--
-- TOC entry 3112 (class 2606 OID 18730)
-- Name: pk_u_organisme; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY u_organisme
    ADD CONSTRAINT pk_u_organisme PRIMARY KEY (code_region, organisme);


--
-- TOC entry 3114 (class 2606 OID 18732)
-- Name: pk_usage_actuel; Type: CONSTRAINT; Schema: geologie; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usage_actuel
    ADD CONSTRAINT pk_usage_actuel PRIMARY KEY (id_site, usage, depuis_le);


--
-- TOC entry 2987 (class 2618 OID 18733)
-- Name: _RETURN; Type: RULE; Schema: geologie; Owner: -
--

CREATE RULE "_RETURN" AS ON SELECT TO v_sites_old DO INSTEAD SELECT DISTINCT s.id_site, s.nom_site, s.typologie3, s.typologie2, s.eval_interet_patrim, s.confidentialite, s.lieudit, s.description_physique, s.superficie, s.unite_superficie, s.periode_ouverture, s.rarete, s.comment_description, s.etat1, s.etat2, g.commentaire_geol, g.coupe_geol, g.phenomene_geol, lg.libelle, g.interet_geol, g.justif_interet_geol, i1.justification AS interet_archeologie, i2.justification AS interet_faune, i3.justification AS interet_flore, i4.justification AS interet_histore, i5.justification AS interet_prehistorie, i6.justification AS interet_geochronologie, i7.justification AS interet_geomorphologie, i8.justification AS interet_hydrogeologie, i9.justification AS interet_hydrothermalisme, i10.justification AS interet_metamorphisme, i11.justification AS interet_mineralogie, i12.justification AS interet_paleontologie, i13.justification AS interet_plutonisme, i14.justification AS interet_ressources_naturelles, i15.justification AS interet_sedimentologie, i16.justification AS interet_stratigraphie, i17.justification AS interet_tectonique, i18.justification AS interet_volcanisme, i19.justification AS interet_amateurs, i20.justification AS interet_enseignants, i21.justification AS interet_etudiants, i22.justification AS interet_geologues, i23.justification AS interet_scolaires, i24.justification AS interet_tous_publics, s1.nom_francais AS strati_ancien_phenom, s2.nom_francais AS strati_recent_phenom, s3.nom_francais AS strati_ancien_terrain, s4.nom_francais AS strati_recent_terrain, s.interet_tourist_economique, s.vulnerabilite_naturelle, s.menace_anthrop_actuelle, s.menace_anthrop_previsible, s.itineraire, s.createur, s.date_creat_site, s.accessibilite1, s.accessibilite2, s.autorisation_prealable, ((((((st.statut_proprietaire1)::text || ' - '::text) || (st.statut_proprietaire2)::text) || ' ('::text) || (st.nom_proprietaire)::text) || ')'::text) AS proprietaire, ((((((st.statut_gestionnaire1)::text || ' - '::text) || (st.statut_gestionnaire2)::text) || ' ('::text) || (st.nom_gestionnaire)::text) || ')'::text) AS gestionnaire, st.commentaire, st.protection_juridique, st.protection_physique, array_to_string(array_agg(DISTINCT lc.nom_commune ORDER BY lc.nom_commune), ', '::text) AS commune, lr.nom AS nom_region, ld.nom AS nom_departement, s.code_region, array_to_string(array_agg(DISTINCT l.nom_francais ORDER BY l.nom_francais), ', '::text) AS lithologie_nom_francais, public.st_asgeojson(s.the_geom_point) AS geometry FROM ((((((((((((((((((((((((((((((((((((((site s LEFT JOIN geologie g ON (((s.id_site)::text = (g.id_site)::text))) LEFT JOIN l_gilges lg ON (((g.code_gilges)::text = (lg.code)::text))) LEFT JOIN coupe_geol cg ON (((g.id_site)::text = (cg.id_site)::text))) LEFT JOIN ln_lithologie l ON (((cg.id_litho)::text = (l.id_litho)::text))) LEFT JOIN interet_second i1 ON (((((s.id_site)::text = (i1.id_site)::text) AND ((i1.interet1)::text = 'Annexe'::text)) AND ((i1.interet2)::text = 'Archéologie'::text)))) LEFT JOIN interet_second i2 ON (((((s.id_site)::text = (i2.id_site)::text) AND ((i2.interet1)::text = 'Annexe'::text)) AND ((i2.interet2)::text = 'Faune'::text)))) LEFT JOIN interet_second i3 ON (((((s.id_site)::text = (i3.id_site)::text) AND ((i3.interet1)::text = 'Annexe'::text)) AND ((i3.interet2)::text = 'Flore'::text)))) LEFT JOIN interet_second i4 ON (((((s.id_site)::text = (i4.id_site)::text) AND ((i4.interet1)::text = 'Annexe'::text)) AND ((i4.interet2)::text = 'Histoire'::text)))) LEFT JOIN interet_second i5 ON (((((s.id_site)::text = (i5.id_site)::text) AND ((i5.interet1)::text = 'Annexe'::text)) AND ((i5.interet2)::text = 'Préhistoire'::text)))) LEFT JOIN interet_second i6 ON (((((s.id_site)::text = (i6.id_site)::text) AND ((i6.interet1)::text = 'Géologique'::text)) AND ((i6.interet2)::text = 'Géochronologie'::text)))) LEFT JOIN interet_second i7 ON (((((s.id_site)::text = (i7.id_site)::text) AND ((i7.interet1)::text = 'Géologique'::text)) AND ((i7.interet2)::text = 'Géomorphologie'::text)))) LEFT JOIN interet_second i8 ON (((((s.id_site)::text = (i8.id_site)::text) AND ((i8.interet1)::text = 'Géologique'::text)) AND ((i8.interet2)::text = 'Hydrogéologie'::text)))) LEFT JOIN interet_second i9 ON (((((s.id_site)::text = (i9.id_site)::text) AND ((i9.interet1)::text = 'Géologique'::text)) AND ((i9.interet2)::text = 'Hydrothermalisme'::text)))) LEFT JOIN interet_second i10 ON (((((s.id_site)::text = (i10.id_site)::text) AND ((i10.interet1)::text = 'Géologique'::text)) AND ((i10.interet2)::text = 'Métamorphisme'::text)))) LEFT JOIN interet_second i11 ON (((((s.id_site)::text = (i11.id_site)::text) AND ((i11.interet1)::text = 'Géologique'::text)) AND ((i11.interet2)::text = 'Minéralogie'::text)))) LEFT JOIN interet_second i12 ON (((((s.id_site)::text = (i12.id_site)::text) AND ((i12.interet1)::text = 'Géologique'::text)) AND ((i12.interet2)::text = 'Paléontologie'::text)))) LEFT JOIN interet_second i13 ON (((((s.id_site)::text = (i13.id_site)::text) AND ((i13.interet1)::text = 'Géologique'::text)) AND ((i13.interet2)::text = 'Plutonisme'::text)))) LEFT JOIN interet_second i14 ON (((((s.id_site)::text = (i14.id_site)::text) AND ((i14.interet1)::text = 'Géologique'::text)) AND ((i14.interet2)::text = 'Ressources naturelles'::text)))) LEFT JOIN interet_second i15 ON (((((s.id_site)::text = (i15.id_site)::text) AND ((i15.interet1)::text = 'Géologique'::text)) AND ((i15.interet2)::text = 'Sédimentologie'::text)))) LEFT JOIN interet_second i16 ON (((((s.id_site)::text = (i16.id_site)::text) AND ((i16.interet1)::text = 'Géologique'::text)) AND ((i16.interet2)::text = 'Stratigraphie'::text)))) LEFT JOIN interet_second i17 ON (((((s.id_site)::text = (i17.id_site)::text) AND ((i17.interet1)::text = 'Géologique'::text)) AND ((i17.interet2)::text = 'Tectonique'::text)))) LEFT JOIN interet_second i18 ON (((((s.id_site)::text = (i18.id_site)::text) AND ((i18.interet1)::text = 'Géologique'::text)) AND ((i18.interet2)::text = 'Volcanisme'::text)))) LEFT JOIN interet_second i19 ON (((((s.id_site)::text = (i19.id_site)::text) AND ((i19.interet1)::text = 'Pédagogique'::text)) AND ((i19.interet2)::text = 'Pour les amateurs'::text)))) LEFT JOIN interet_second i20 ON (((((s.id_site)::text = (i20.id_site)::text) AND ((i20.interet1)::text = 'Pédagogique'::text)) AND ((i20.interet2)::text = 'Pour les enseignants'::text)))) LEFT JOIN interet_second i21 ON (((((s.id_site)::text = (i21.id_site)::text) AND ((i21.interet1)::text = 'Pédagogique'::text)) AND ((i21.interet2)::text = 'Pour les étudiants'::text)))) LEFT JOIN interet_second i22 ON (((((s.id_site)::text = (i22.id_site)::text) AND ((i22.interet1)::text = 'Pédagogique'::text)) AND ((i22.interet2)::text = 'Pour les géologues'::text)))) LEFT JOIN interet_second i23 ON (((((s.id_site)::text = (i23.id_site)::text) AND ((i23.interet1)::text = 'Pédagogique'::text)) AND ((i23.interet2)::text = 'Pour les scolaires'::text)))) LEFT JOIN interet_second i24 ON (((((s.id_site)::text = (i24.id_site)::text) AND ((i24.interet1)::text = 'Pédagogique'::text)) AND ((i24.interet2)::text = 'Pour tous publics'::text)))) LEFT JOIN ln_stratigraphie s1 ON (((s1.id_strati)::text = (g.strati_ancien_phenom)::text))) LEFT JOIN ln_stratigraphie s2 ON (((s2.id_strati)::text = (g.strati_recent_phenom)::text))) LEFT JOIN ln_stratigraphie s3 ON (((s3.id_strati)::text = (g.strati_ancien_terrain)::text))) LEFT JOIN ln_stratigraphie s4 ON (((s4.id_strati)::text = (g.strati_recent_terrain)::text))) LEFT JOIN statut st ON (((s.id_site)::text = (st.id_site)::text))) LEFT JOIN site_commune sc ON (((s.id_site)::text = (sc.id_site)::text))) LEFT JOIN ln_commune lc ON (((sc.num_insee)::text = (lc.num_insee)::text))) LEFT JOIN site_departement sd ON (((s.id_site)::text = (sd.id_site)::text))) LEFT JOIN ln_departement ld ON (((sd.num_dept)::text = (ld.num_dept)::text))) LEFT JOIN ln_region lr ON (((s.code_region)::text = (lr.code_region)::text))) WHERE ((s.confidentialite)::text = 'Public'::text) GROUP BY s.id_site, lg.libelle, g.commentaire_geol, g.coupe_geol, g.phenomene_geol, g.interet_geol, g.justif_interet_geol, i1.justification, i2.justification, i3.justification, i4.justification, i5.justification, i6.justification, i7.justification, i8.justification, i9.justification, i10.justification, i11.justification, i12.justification, i13.justification, i14.justification, i15.justification, i16.justification, i17.justification, i18.justification, i19.justification, i20.justification, i21.justification, i22.justification, i23.justification, i24.justification, s1.nom_francais, s2.nom_francais, s3.nom_francais, s4.nom_francais, st.statut_proprietaire1, st.statut_proprietaire2, st.nom_proprietaire, st.statut_gestionnaire1, st.statut_gestionnaire2, st.nom_gestionnaire, st.commentaire, st.protection_juridique, st.protection_physique, lr.nom, ld.nom ORDER BY s.id_site;
ALTER VIEW v_sites_old SET ();


--
-- TOC entry 2988 (class 2618 OID 19094)
-- Name: _RETURN; Type: RULE; Schema: geologie; Owner: -
--

CREATE RULE "_RETURN" AS ON SELECT TO v_sites DO INSTEAD SELECT DISTINCT s.id_site, s.nom_site, s.typologie3, s.typologie2, s.eval_interet_patrim, s.lieudit, s.description_physique, s.superficie, s.unite_superficie, s.periode_ouverture, s.rarete, s.comment_description, s.etat1, s.etat2, g.coupe_geol, g.commentaire_geol, g.phenomene_geol, lg.libelle, g.interet_geol, g.justif_interet_geol, s1.nom_francais AS strati_ancien_phenom, s2.nom_francais AS strati_recent_phenom, s3.nom_francais AS strati_ancien_terrain, s4.nom_francais AS strati_recent_terrain, s.interet_tourist_economique, s.vulnerabilite_naturelle, s.menace_anthrop_actuelle, s.menace_anthrop_previsible, s.itineraire, s.createur, s.date_creat_site, s.accessibilite1, s.accessibilite2, s.autorisation_prealable, ((((((st.statut_proprietaire1)::text || ' - '::text) || (st.statut_proprietaire2)::text) || ' ('::text) || (st.nom_proprietaire)::text) || ')'::text) AS proprietaire, ((((((st.statut_gestionnaire1)::text || ' - '::text) || (st.statut_gestionnaire2)::text) || ' ('::text) || (st.nom_gestionnaire)::text) || ')'::text) AS gestionnaire, st.commentaire, st.protection_juridique, st.protection_physique, array_to_string(array_agg(DISTINCT lc.nom_commune ORDER BY lc.nom_commune), ', '::text) AS commune, lr.nom AS nom_region, ld.nom AS nom_departement, s.code_region, array_to_string(array_agg(DISTINCT l.nom_francais ORDER BY l.nom_francais), ', '::text) AS lithologie_nom_francais, public.st_asgeojson(s.the_geom_point) AS geometry FROM ((((((((((((((site s LEFT JOIN geologie g ON (((s.id_site)::text = (g.id_site)::text))) LEFT JOIN l_gilges lg ON (((g.code_gilges)::text = (lg.code)::text))) LEFT JOIN coupe_geol cg ON (((g.id_site)::text = (cg.id_site)::text))) LEFT JOIN ln_lithologie l ON (((cg.id_litho)::text = (l.id_litho)::text))) LEFT JOIN ln_stratigraphie s1 ON (((s1.id_strati)::text = (g.strati_ancien_phenom)::text))) LEFT JOIN ln_stratigraphie s2 ON (((s2.id_strati)::text = (g.strati_recent_phenom)::text))) LEFT JOIN ln_stratigraphie s3 ON (((s3.id_strati)::text = (g.strati_ancien_terrain)::text))) LEFT JOIN ln_stratigraphie s4 ON (((s4.id_strati)::text = (g.strati_recent_terrain)::text))) LEFT JOIN statut st ON (((s.id_site)::text = (st.id_site)::text))) LEFT JOIN site_commune sc ON (((s.id_site)::text = (sc.id_site)::text))) LEFT JOIN ln_commune lc ON (((sc.num_insee)::text = (lc.num_insee)::text))) LEFT JOIN site_departement sd ON (((s.id_site)::text = (sd.id_site)::text))) LEFT JOIN ln_departement ld ON (((sd.num_dept)::text = (ld.num_dept)::text))) LEFT JOIN ln_region lr ON (((s.code_region)::text = (lr.code_region)::text))) WHERE ((s.confidentialite)::text = 'Public'::text) GROUP BY s.id_site, lg.libelle, g.commentaire_geol, g.coupe_geol, g.phenomene_geol, g.interet_geol, g.justif_interet_geol, s1.nom_francais, s2.nom_francais, s3.nom_francais, s4.nom_francais, st.statut_proprietaire1, st.statut_proprietaire2, st.nom_proprietaire, st.statut_gestionnaire1, st.statut_gestionnaire2, st.nom_gestionnaire, st.commentaire, st.protection_juridique, st.protection_physique, lr.nom, ld.nom ORDER BY s.id_site;
ALTER VIEW v_sites SET ();


--
-- TOC entry 3115 (class 2606 OID 18737)
-- Name: fk_collection; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY collection
    ADD CONSTRAINT fk_collection FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3116 (class 2606 OID 18742)
-- Name: fk_collection_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY collection
    ADD CONSTRAINT fk_collection_1 FOREIGN KEY (id_auteur_modif) REFERENCES lr_auteur(id_auteur);


--
-- TOC entry 3117 (class 2606 OID 18747)
-- Name: fk_coupe_geol; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY coupe_geol
    ADD CONSTRAINT fk_coupe_geol FOREIGN KEY (id_site) REFERENCES geologie(id_site);


--
-- TOC entry 3118 (class 2606 OID 18752)
-- Name: fk_coupe_geol_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY coupe_geol
    ADD CONSTRAINT fk_coupe_geol_1 FOREIGN KEY (id_strati) REFERENCES ln_stratigraphie(id_strati);


--
-- TOC entry 3119 (class 2606 OID 18757)
-- Name: fk_coupe_geol_2; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY coupe_geol
    ADD CONSTRAINT fk_coupe_geol_2 FOREIGN KEY (id_litho) REFERENCES ln_lithologie(id_litho);


--
-- TOC entry 3120 (class 2606 OID 18762)
-- Name: fk_coupe_geol_3; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY coupe_geol
    ADD CONSTRAINT fk_coupe_geol_3 FOREIGN KEY (id_auteur_modif) REFERENCES lr_auteur(id_auteur);


--
-- TOC entry 3121 (class 2606 OID 18767)
-- Name: fk_documentation; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY documentation
    ADD CONSTRAINT fk_documentation FOREIGN KEY (type_document) REFERENCES u_naturedoc(type_document);


--
-- TOC entry 3122 (class 2606 OID 18772)
-- Name: fk_documentation_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY documentation
    ADD CONSTRAINT fk_documentation_1 FOREIGN KEY (numerise) REFERENCES l_ouinon(libelle);


--
-- TOC entry 3123 (class 2606 OID 18777)
-- Name: fk_documentation_2; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY documentation
    ADD CONSTRAINT fk_documentation_2 FOREIGN KEY (id_auteur_modif) REFERENCES lr_auteur(id_auteur);


--
-- TOC entry 3124 (class 2606 OID 18782)
-- Name: fk_documentation_3; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY documentation
    ADD CONSTRAINT fk_documentation_3 FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3125 (class 2606 OID 18787)
-- Name: fk_emprise; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY emprise
    ADD CONSTRAINT fk_emprise FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3126 (class 2606 OID 18792)
-- Name: fk_geologie; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY geologie
    ADD CONSTRAINT fk_geologie FOREIGN KEY (strati_ancien_terrain) REFERENCES ln_stratigraphie(id_strati);


--
-- TOC entry 3127 (class 2606 OID 18797)
-- Name: fk_geologie_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY geologie
    ADD CONSTRAINT fk_geologie_1 FOREIGN KEY (strati_ancien_phenom) REFERENCES ln_stratigraphie(id_strati);


--
-- TOC entry 3128 (class 2606 OID 18802)
-- Name: fk_geologie_2; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY geologie
    ADD CONSTRAINT fk_geologie_2 FOREIGN KEY (phenomene_geol) REFERENCES l_phenomene_geol(phenomene);


--
-- TOC entry 3129 (class 2606 OID 18807)
-- Name: fk_geologie_3; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY geologie
    ADD CONSTRAINT fk_geologie_3 FOREIGN KEY (strati_recent_terrain) REFERENCES ln_stratigraphie(id_strati);


--
-- TOC entry 3130 (class 2606 OID 18812)
-- Name: fk_geologie_4; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY geologie
    ADD CONSTRAINT fk_geologie_4 FOREIGN KEY (id_auteur_modif) REFERENCES lr_auteur(id_auteur);


--
-- TOC entry 3131 (class 2606 OID 18817)
-- Name: fk_geologie_5; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY geologie
    ADD CONSTRAINT fk_geologie_5 FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3132 (class 2606 OID 18822)
-- Name: fk_geologie_6; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY geologie
    ADD CONSTRAINT fk_geologie_6 FOREIGN KEY (coupe_geol) REFERENCES l_ouinon(libelle);


--
-- TOC entry 3133 (class 2606 OID 18827)
-- Name: fk_geologie_8; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY geologie
    ADD CONSTRAINT fk_geologie_8 FOREIGN KEY (code_gilges) REFERENCES l_gilges(code);


--
-- TOC entry 3134 (class 2606 OID 18832)
-- Name: fk_geologie_9; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY geologie
    ADD CONSTRAINT fk_geologie_9 FOREIGN KEY (strati_recent_phenom) REFERENCES ln_stratigraphie(id_strati);


--
-- TOC entry 3135 (class 2606 OID 18837)
-- Name: fk_interet_second_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY interet_second
    ADD CONSTRAINT fk_interet_second_1 FOREIGN KEY (id_auteur_modif) REFERENCES lr_auteur(id_auteur);


--
-- TOC entry 3136 (class 2606 OID 18842)
-- Name: fk_interet_second_2; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY interet_second
    ADD CONSTRAINT fk_interet_second_2 FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3137 (class 2606 OID 18847)
-- Name: fk_inventaire; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY inventaire
    ADD CONSTRAINT fk_inventaire FOREIGN KEY (id_auteur_modif) REFERENCES lr_auteur(id_auteur);


--
-- TOC entry 3138 (class 2606 OID 18852)
-- Name: fk_inventaire_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY inventaire
    ADD CONSTRAINT fk_inventaire_1 FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3139 (class 2606 OID 18857)
-- Name: fk_inventaire_2; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY inventaire
    ADD CONSTRAINT fk_inventaire_2 FOREIGN KEY (type_inventaire) REFERENCES l_type_inventaire(type_inventaire);


--
-- TOC entry 3140 (class 2606 OID 18862)
-- Name: fk_ln_carte_geol50; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY ln_carte_geol50
    ADD CONSTRAINT fk_ln_carte_geol50 FOREIGN KEY (lamb_carte) REFERENCES l_type_coordonnees(code);


--
-- TOC entry 3141 (class 2606 OID 18867)
-- Name: fk_ln_commune; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY ln_commune
    ADD CONSTRAINT fk_ln_commune FOREIGN KEY (num_carte_geol50) REFERENCES ln_carte_geol50(num_carte);


--
-- TOC entry 3142 (class 2606 OID 18872)
-- Name: fk_ln_commune_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY ln_commune
    ADD CONSTRAINT fk_ln_commune_1 FOREIGN KEY (num_dept) REFERENCES ln_departement(num_dept);


--
-- TOC entry 3143 (class 2606 OID 18877)
-- Name: fk_ln_departement; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY ln_departement
    ADD CONSTRAINT fk_ln_departement FOREIGN KEY (code_region) REFERENCES ln_region(code_region);


--
-- TOC entry 3144 (class 2606 OID 18882)
-- Name: fk_lr_auteur; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY lr_auteur
    ADD CONSTRAINT fk_lr_auteur FOREIGN KEY (titre) REFERENCES l_titre(code);


--
-- TOC entry 3145 (class 2606 OID 18887)
-- Name: fk_lr_auteur_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY lr_auteur
    ADD CONSTRAINT fk_lr_auteur_1 FOREIGN KEY (qualite) REFERENCES l_qualite(libelle);


--
-- TOC entry 3146 (class 2606 OID 18892)
-- Name: fk_lr_biblio; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY lr_biblio
    ADD CONSTRAINT fk_lr_biblio FOREIGN KEY (id_auteur_modif) REFERENCES lr_auteur(id_auteur);


--
-- TOC entry 3147 (class 2606 OID 18897)
-- Name: fk_ouverture; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY ouverture
    ADD CONSTRAINT fk_ouverture FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3148 (class 2606 OID 18902)
-- Name: fk_ouverture_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY ouverture
    ADD CONSTRAINT fk_ouverture_1 FOREIGN KEY (id_auteur_modif) REFERENCES lr_auteur(id_auteur);


--
-- TOC entry 3149 (class 2606 OID 18907)
-- Name: fk_photos; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT fk_photos FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3150 (class 2606 OID 18912)
-- Name: fk_site; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site
    ADD CONSTRAINT fk_site FOREIGN KEY (origine_coordonnees) REFERENCES l_origine_coordonnee(libelle);


--
-- TOC entry 3151 (class 2606 OID 18917)
-- Name: fk_site_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site
    ADD CONSTRAINT fk_site_1 FOREIGN KEY (autorisation_prealable) REFERENCES l_ouinon(libelle);


--
-- TOC entry 3152 (class 2606 OID 18922)
-- Name: fk_site_10; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site
    ADD CONSTRAINT fk_site_10 FOREIGN KEY (periode_ouverture) REFERENCES l_periode(libelle);


--
-- TOC entry 3153 (class 2606 OID 18927)
-- Name: fk_site_11; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site
    ADD CONSTRAINT fk_site_11 FOREIGN KEY (confidentialite) REFERENCES l_confidentialite(libelle);


--
-- TOC entry 3154 (class 2606 OID 18932)
-- Name: fk_site_12; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site
    ADD CONSTRAINT fk_site_12 FOREIGN KEY (unite_superficie) REFERENCES l_unite_superficie(libelle);


--
-- TOC entry 3155 (class 2606 OID 18937)
-- Name: fk_site_2; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site
    ADD CONSTRAINT fk_site_2 FOREIGN KEY (rarete) REFERENCES l_rarete(libelle);


--
-- TOC entry 3156 (class 2606 OID 18942)
-- Name: fk_site_3; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site
    ADD CONSTRAINT fk_site_3 FOREIGN KEY (type_coordonnees) REFERENCES l_type_coordonnees(code);


--
-- TOC entry 3157 (class 2606 OID 18947)
-- Name: fk_site_4; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site
    ADD CONSTRAINT fk_site_4 FOREIGN KEY (payant) REFERENCES l_ouinon(libelle);


--
-- TOC entry 3158 (class 2606 OID 18952)
-- Name: fk_site_8; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site
    ADD CONSTRAINT fk_site_8 FOREIGN KEY (id_auteur_modif) REFERENCES lr_auteur(id_auteur);


--
-- TOC entry 3159 (class 2606 OID 18957)
-- Name: fk_site_9; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site
    ADD CONSTRAINT fk_site_9 FOREIGN KEY (code_region) REFERENCES ln_region(code_region);


--
-- TOC entry 3160 (class 2606 OID 18962)
-- Name: fk_site_biblio; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site_biblio
    ADD CONSTRAINT fk_site_biblio FOREIGN KEY (id_auteur_modif) REFERENCES lr_auteur(id_auteur);


--
-- TOC entry 3161 (class 2606 OID 18967)
-- Name: fk_site_biblio_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site_biblio
    ADD CONSTRAINT fk_site_biblio_1 FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3162 (class 2606 OID 18972)
-- Name: fk_site_biblio_2; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site_biblio
    ADD CONSTRAINT fk_site_biblio_2 FOREIGN KEY (id_biblio) REFERENCES lr_biblio(id_biblio);


--
-- TOC entry 3163 (class 2606 OID 18977)
-- Name: fk_site_carte_25; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site_carte_25
    ADD CONSTRAINT fk_site_carte_25 FOREIGN KEY (num_carte) REFERENCES ln_cartes_ign25(num_carte);


--
-- TOC entry 3164 (class 2606 OID 18982)
-- Name: fk_site_carte_25_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site_carte_25
    ADD CONSTRAINT fk_site_carte_25_1 FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3165 (class 2606 OID 18987)
-- Name: fk_site_carte_50; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site_carte_50
    ADD CONSTRAINT fk_site_carte_50 FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3166 (class 2606 OID 18992)
-- Name: fk_site_carte_50_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site_carte_50
    ADD CONSTRAINT fk_site_carte_50_1 FOREIGN KEY (num_carte) REFERENCES ln_carte_geol50(num_carte);


--
-- TOC entry 3167 (class 2606 OID 18997)
-- Name: fk_site_carte_marine; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site_carte_marine
    ADD CONSTRAINT fk_site_carte_marine FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3168 (class 2606 OID 19002)
-- Name: fk_site_carte_marine_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site_carte_marine
    ADD CONSTRAINT fk_site_carte_marine_1 FOREIGN KEY (num_carte) REFERENCES ln_carte_marine(num_carte);


--
-- TOC entry 3169 (class 2606 OID 19007)
-- Name: fk_site_commune; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site_commune
    ADD CONSTRAINT fk_site_commune FOREIGN KEY (num_insee) REFERENCES ln_commune(num_insee);


--
-- TOC entry 3170 (class 2606 OID 19012)
-- Name: fk_site_commune_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site_commune
    ADD CONSTRAINT fk_site_commune_1 FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3171 (class 2606 OID 19017)
-- Name: fk_site_departement; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site_departement
    ADD CONSTRAINT fk_site_departement FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3172 (class 2606 OID 19022)
-- Name: fk_site_departement_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY site_departement
    ADD CONSTRAINT fk_site_departement_1 FOREIGN KEY (num_dept) REFERENCES ln_departement(num_dept);


--
-- TOC entry 3173 (class 2606 OID 19027)
-- Name: fk_statut_2; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY statut
    ADD CONSTRAINT fk_statut_2 FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3174 (class 2606 OID 19032)
-- Name: fk_statut_3; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY statut
    ADD CONSTRAINT fk_statut_3 FOREIGN KEY (id_auteur_modif) REFERENCES lr_auteur(id_auteur);


--
-- TOC entry 3175 (class 2606 OID 19037)
-- Name: fk_statut_protection; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY statut_protection
    ADD CONSTRAINT fk_statut_protection FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3176 (class 2606 OID 19042)
-- Name: fk_statut_protection_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY statut_protection
    ADD CONSTRAINT fk_statut_protection_1 FOREIGN KEY (id_auteur_modif) REFERENCES lr_auteur(id_auteur);


--
-- TOC entry 3177 (class 2606 OID 19047)
-- Name: fk_suivi; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY suivi
    ADD CONSTRAINT fk_suivi FOREIGN KEY (id_auteur_modif) REFERENCES lr_auteur(id_auteur);


--
-- TOC entry 3178 (class 2606 OID 19052)
-- Name: fk_suivi_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY suivi
    ADD CONSTRAINT fk_suivi_1 FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- TOC entry 3179 (class 2606 OID 19057)
-- Name: fk_usage_actuel; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY usage_actuel
    ADD CONSTRAINT fk_usage_actuel FOREIGN KEY (usage) REFERENCES l_usage_actuel(libelle);


--
-- TOC entry 3180 (class 2606 OID 19062)
-- Name: fk_usage_actuel_1; Type: FK CONSTRAINT; Schema: geologie; Owner: -
--

ALTER TABLE ONLY usage_actuel
    ADD CONSTRAINT fk_usage_actuel_1 FOREIGN KEY (id_auteur_modif) REFERENCES lr_auteur(id_auteur);


-- Completed on 2016-03-04 13:53:10

--
-- PostgreSQL database dump complete
--

