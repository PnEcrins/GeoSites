<?php
include ("dbconnect.php");
?>

<!doctype html>
<html ng-app="GeoSiteApp">
	<head>
		<title>Sites géologiques du Parc national des Écrins</title>
		<meta charset="utf-8" />

		<!-- Feuilles de styles -->
		<link href="vendors/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link href="vendors/leaflet/leaflet.css" rel="stylesheet" />
        <link rel="stylesheet" href="vendors/opacity/Control.Opacity.css" />
        <link rel="stylesheet" href="vendors/jquery/jquery-ui-1.10.3.custom.min.css" />
		<link href="vendors/angular-bootstrap/ui-bootstrap-custom-1.1.1-csp.css" rel="stylesheet" />
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="css/style.css" rel="stylesheet" />			

		<!-- La balise meta viewport sert à forcer le niveau de zoom pour les navigateurs mobiles, elle est indispensable pour faire l'application en responsive, ici je ne permet pas à l'utilisateur de zoomer (le zoom sur la page n'est pas utile, il l'est par contre pour la carte) -->
		<meta name="viewport" content="initial-scale=1,user-scalable=no,maximum-scale=1,width=device-width" />		
	</head>
	<!-- 
		ng-app et ng-controller sont des directives.
		ng-app défini la portée de l'application (le scope)
		ng-controller défini la portée du controller, c'est à dire que les propriétés dans HomeController sont utilisables dans tout le body
	-->
	<body ng-controller="HomeController">
            <!-- <div ng-view></div>-->
            <div ng-include src="'templates/home.html'"></div>		

		<!-- Biliothèques js -->
		<script src="vendors/jquery/jquery.min.js"></script>	
		<script src="vendors/jquery/jquery-ui-1.10.3.custom.min.js"></script>	
		<script src="vendors/bootstrap/js/bootstrap.min.js"></script>			
		<script src="vendors/pdfjs/pdf.js"></script>
 		<script src="vendors/angular/angular.min.js"></script>
        <script src="vendors/angular/angular-pdf.min.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular-animate.js"></script>
		<script src="vendors/leaflet/leaflet.js"></script>
        <script src="vendors/opacity/Control.Opacity.js"></script>
		<script src="https://code.angularjs.org/1.2.28/angular-route.min.js"></script>
		<script src="vendors/angular-bootstrap/ui-bootstrap-custom-1.1.1.min.js"></script>
		<script src="vendors/angular-bootstrap/ui-bootstrap-custom-tpls-1.1.1.min.js"></script>

		<!-- Modules -->
		<script src="js/app.js"></script>

		<!-- Controllers -->
		<script src="js/controllers/homeController.js"></script>
		<script src="js/controllers/modalNavbarController.js"></script>
		<script src="js/controllers/modalDetailsController.js"></script>			
		<script src="js/controllers/modalAccueilController.js"></script>
		<script src="js/controllers/modalAideController.js"></script>
		<script src="js/controllers/modalContactController.js"></script>
		<script src="js/controllers/modalPneController.js"></script>

		<!-- Services -->
		<script src="js/services/htmlContent.js"></script>

		<!-- Config JS -->
		<script src="js/config/config.js"></script>

	</body>
</html>
