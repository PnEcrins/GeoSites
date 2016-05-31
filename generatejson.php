<?php
include ("dbconnect.php");

$idSite = $_GET['id_site'];
$view = $_GET['view'];
header('Content-type: application/json');

$rs = pg_query_params($dbconnect, "SELECT * FROM " . pg_escape_string($view). " WHERE id_site = $1" , array($idSite)) or die("La requete suivante ne peut pas etre executee : $query\n");
//Construction du GeoJSON
$json = array();

while ($row = pg_fetch_assoc($rs)) {
              
    // on push chaque enregistrement
    array_push($json, $row);
}

echo json_encode($json);

?>