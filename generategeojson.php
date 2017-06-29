<?php
include ("dbconnect.php");

header('Content-type: application/json');

//$vuesites est définie dans config/config.php
$query = "Select * from $vuesites";
$rs = pg_query($dbconnect, $query) or die("La requete suivante ne peut pas etre executee : $query\n");

//Construction du GeoJSON
$geojson = array(
    'type'      => 'FeatureCollection',
    'features'  => array()
);

while ($row = pg_fetch_assoc($rs)) {
    
    $geometry = json_decode($row['geometry']);
    //On enlève les propriétés des géométries
    unset($row['geometry']);
    $properties = $row;        
    $feature = array(
        'type' => 'Feature'
        ,'properties' => $properties
        ,'geometry' => $geometry
    );
    // on push la feature
    array_push($geojson['features'], $feature);
}

echo json_encode($geojson);

?>