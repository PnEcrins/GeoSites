<?php
include ("dbconnect.php");
header('Content-type: text/html; charset=utf-8');
$query = "SELECT * FROM geologie.site ORDER BY id_site";
$rs = pg_query($dbconnect, $query) or die("La requete suivante ne peut pas etre executee : $query\n");

echo ("{ <br />");
echo ("\"type\": \"FeatureCollection\", <br />");
echo ("\"crs\": { \"type\": \"name\", \"properties\": { \"name\": \"urn:ogc:def:crs:OGC:1.3:CRS84\" } }, <br />");
echo ("<br />");
echo ("\"features\": [ <br />");

while ($row = pg_fetch_row($rs)) {
	$req1 = "SELECT ST_X(the_geom_point) FROM geologie.site WHERE id_site = '$row[0]'";
	$exec1 = pg_query($dbconnect, $req1) or die("La requete suivante ne peut pas etre executee : $req1\n");
	$req2 = "SELECT st_Y(the_geom_point) FROM geologie.site WHERE id_site = '$row[0]'";
	$exec2 = pg_query($dbconnect, $req2) or die("La requete suivante ne peut pas etre executee : $req2\n");
	$row2 = pg_fetch_row($exec1);
	$row3 = pg_fetch_row($exec2);
	echo ("{ \"type\": \"Feature\", \"properties\": { \"id_site\": \"$row[0]\", \"nom_site\": \"$row[1]\", \"code_region\": \"$row[2]\", \"typologie1\": \"$row[3]\", \"typologie2\": \"$row[4]\", \"typologie3\": \"$row[5]\", \"confidentialite\": \"$row[6]\", \"lieudit\": \"$row[7]\", \"type_coordonnees\": $row[8], \"precision_coordonnees\": \"$row[9]\", \"origine_coordonnees\": \"$row[10]\", \"z_min\": $row[11], \"z_max\": $row[12], \"nom_siege_site\": \"$row[13]\", \"adresse_siege\": \"$row[14]\", \"ville_siege\": \"$row[15]\", \"code_postal\": \"$row[16]\", \"telephone_siege\": \"$row[17]\", \"fax_siege\": \"$row[18]\", \"e_mail\": \"$row[19]\", \"site_web\": \"$row[20]\", \"itineraire\": \"$row[21]\", \"accessibilite1\": \"$row[22]\", \"accessibilite2\": \"$row[23]\", \"autorisation_prealable\": \"$row[24]\", \"periode_ouverture\": \"$row[25]\", \"payant\": \"$row[26]\", \"description_physique\": \"$row[27]\", \"superficie\": $row[28], \"unite_superficie\": \"$row[29]\", \"etat1\": \"$row[30]\", \"etat2\": \"$row[31]\", \"interet_tourist_economique\": $row[32], \"rarete\": \"$row[33]\", \"menace_anthrop_actuelle\": \"$row[34]\", \"menace_anthrop_previsible\": \"$row[35]\", \"vulnerabilite_naturelle\": \"$row[36]\", \"comment_description\": $row[37], \"___evaluation\": $row[38], \"note_interet_geol1\": $row[39], \"eval_interet_geol1\": $row[40], \"note_interet_geol2\": $row[41], \"eval_interet_geol2\": $row[42], \"note_interet_pedag\": $row[43], \"eval_interet_pedag\": $row[44], \"note_interet_hist_geol\": $row[45], \"eval_interet_hist_geol\": $row[46], \"note_interet_autre\": $row[47], \"eval_interet_autre\": $row[48], \"note_rarete_region\": $row[49], \"eval_rarete_region\": $row[50], \"note_conservation\": $row[51], \"eval_conservation\": $row[52], \"total_eval_interet\": $row[53], \"eval_interet_patrim\": $row[54], \"comment_interet_patrim\": $row[55], \"note_vuln_naturelle\": $row[56], \"eval_vuln_naturelle\": $row[57], \"note_menace_anthrop\": $row[58], \"eval_menace_anthrop\": $row[59], \"note_protection_effective\": $row[60], \"eval_protection_effective\": $row[61], \"total_eval_protection\": $row[62], \"besoin_protection\": $row[63], \"comment_protection\": $row[64], \"comment_evaluation\": $row[65], \"date_creat_site\": \"$row[66]\", \"createur\": \"$row[67]\", \"date_modif\": \"$row[68]\", \"id_auteur_modif\": \"$row[69]\", \"comment_fiche\": $row[70] }, \"geometry\": { \"type\": \"Point\", \"coordinates\": [ $row2[0], $row3[0] ] } }");
	if ($row[0] != 'RHA0054'){
		echo (",<br />");
	}	
}
echo ("<br />]<br />");
echo ("}<br />");
pg_close($dbconnect); 
?>