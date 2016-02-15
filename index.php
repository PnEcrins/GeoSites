<?php
include ("dbconnect.php");
?>

<!doctype html>
<html>
	<head>
		<title>Carte des Sites Géologiques</title>
		<meta charset="utf-8" />

		<!-- Feuilles de styles -->
		<link href="vendors/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link href="vendors/leaflet/leaflet.css" rel="stylesheet" />
        <link rel="stylesheet" href="vendors/opacity/Control.Opacity.css" />
        <link rel="stylesheet" href="vendors/jquery/jquery-ui-1.10.3.custom.min.css" />
		<link href="vendors/angular-bootstrap/ui-bootstrap-custom-1.1.1-csp.css" rel="stylesheet" />
		<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="css/style.css" rel="stylesheet" />			

		<!-- La balise meta viewport sert à forcer le niveau de zoom pour les navigateurs mobiles, elle est indispensable pour faire l'application en responsive, ici je ne permet pas à l'utilisateur de zoomer (le zoom sur la page n'est pas utile, il l'est par contre pour la carte) -->
		<meta name="viewport" content="initial-scale=1,user-scalable=no,maximum-scale=1,width=device-width" />		
	</head>
	<!-- 
		ng-app et ng-controller sont des directives.
		ng-app défini la portée de l'application (le scope)
		ng-controller défini la portée du controller, c'est à dire que les propriétés dans HomeController sont utilisables dans tout le body
	-->
	<body ng-app="GeoSiteApp" ng-controller="HomeController">
		<div id="loadmask" ng-model="loadingClass" ng-class="loadingClass">
        	<div class="row"><div class="col-md-offset-3 jumbotron col-md-6"><img alt="logoPNE" src="img/logo.png" class="img-responsive center-block" style="height: 50px;"><br /><p class="centrage">L'application est en cours de chargement, veuillez patienter...</p></div></div>
 		</div>

		<!-- Barre de navigation -->
		<div ng-include src="'templates/navBar.html'"></div>

		<!-- Panneau latéral -->
		<show-sidebar></show-sidebar>
		<div ng-include src="'templates/listeSidebar.html'"></div>

		<!-- La carte -->
		<div id="containerCarte" class="col-lg-offset-3 col-md-offset-4 col-sm-offset-6 col-xs-offset-2 col-lg-9 col-md-8 col-sm-6 col-xs-10">
			<div id="carte"></div>
		</div>		

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

		<!-- Services -->
		<script src="js/services/htmlContent.js"></script>

		<!-- Config JS -->
		<script src="js/config/config.js"></script>

	</body>
</html>
