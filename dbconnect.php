<?php
	include ("config/config.php");
	$dbconnect = pg_connect("host=$serveur dbname=$base user=$user password=$passe") 
    or die('Connexion impossible : ' . pg_last_error());  
?>