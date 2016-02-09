<?php
include ("config.php");
include ("dbconnect.php");
$idSite = $_GET['id_site'];
header('Content-type: application/json');
$query = "SELECT id_site, type_document, fichier, commentaire FROM geologie.documentation WHERE id_site = '".$idSite."' ORDER BY type_document";
$rs = pg_query($dbconnect, $query) or die("La requete suivante ne peut pas etre executee : $query\n");

//Construction du GeoJSON
$json = array();

while ($row = pg_fetch_assoc($rs)) {
              
    // on push chaque enregistrement
    array_push($json, $row);
}

echo json_encode($json);

?>