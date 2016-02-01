<?php
include ("dbconnect.php");
header('Content-type: application/json');
$query = "Select id_site, nom_site, lieudit, superficie, unite_superficie, periode_ouverture, rarete, st_asgeojson(the_geom_point) as geometry from geologie.site order by id_site";
$rs = pg_query($dbconnect, $query) or die("La requete suivante ne peut pas etre executee : $query\n");

//Construction du GeoJSON
$geojson = array(
    'type'      => 'FeatureCollection',
    'features'  => array()
);

while ($row = pg_fetch_assoc($rs)) {
    
    $geometry = json_decode($row['geometry']);
    unset($row['geometry']);
    $properties = $row;
        //On enlève les propriétés des géométries
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