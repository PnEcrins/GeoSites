<?php
include ("dbconnect.php");

$idSite = $_GET['id_site'];
$view = $_GET['view'];
header('Content-type: application/json');

$query = "SELECT * FROM ".$view." WHERE id_site = '".$idSite."'";
$rs = pg_query($dbconnect, $query) or die("La requete suivante ne peut pas etre executee : $query\n");

//Construction du GeoJSON
$json = array();

while ($row = pg_fetch_assoc($rs)) {
              
    // on push chaque enregistrement
    array_push($json, $row);
}

echo json_encode($json);

?>