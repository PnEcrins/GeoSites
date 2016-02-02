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
		<link href="vendors/angular-bootstrap/ui-bootstrap-custom-1.1.1-csp.css" rel="stylesheet" />
		<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="css/style.css" rel="stylesheet" />			

		<!-- La balise meta viewport sert à forcer le niveau de zoom pour les navigateurs mobiles, elle est indispensable pour faire l'application en responsive, ici je ne permet pas à l'utilisateur de zoomer (le zoom sur la page n'est pas utile, il l'est par contre pour la carte) -->
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />		
	</head>
	<!-- 
		ng-app et ng-controller sont des directives.
		ng-app défini la portée de l'application (le scope)
		ng-controller défini la portée du controller, c'est à dire que les propriétés dans HomeController sont utilisables dans tout le body
	-->
	<body ng-app="GeoSiteApp" ng-controller="HomeController">

		<!-- Barre de navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<!-- Entête de la barre de navigation (le logo et l'affichage mobile) -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">
						<img class="logoPNE" alt="Logo Parc National des Ecrins" ng-src="{{contentHTML.navBarHeader.icon}}">
					</a>
					<!-- Titre de l'appli -->
					<span class="navbar-brand" >{{ contentHTML.navBarHeader.title }}</span>
				</div>

				<!-- Les autres éléments de la barre de navigation, on récupère les données dans le controller et on fait une boucle avec ng-repeat -->
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li ng-repeat="navBarElement in contentHTML.navBarElements">
							<!-- Je passe en paramètres le contenu et le titre pour la modal -->
							<a role="button" href="#" ng-click="open(navBarElement.title, navBarElement.content)">
								<img class="icon" ng-src="{{ navBarElement.icon }}">{{ navBarElement.title }}
							</a>							
						</li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- Panneau latéral -->
		<show-sidebar></show-sidebar>
		<div id="sidebar" class="col-md-4">
			<div id="containerSidebar">
				<div class="row" ng-bind-html="contentHTML.sideBarContent.content | sanitize"></div>
				<hr>
				<div ng-repeat="site in geojsonSites">

					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="{{ 'heading' + site.properties.id_site }}">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse" data-parent="#accordion" href="{{ '#collapse' + site.properties.id_site }}" aria-expanded="false" aria-controls="{{ 'collapse' + site.properties.id_site }}">
									<strong>{{ site.properties.nom_site }}</strong>
									</a>
								</h4>
							</div>
							<div id="{{ 'collapse' + site.properties.id_site }}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="{{ 'heading' + site.properties.id_site }}">
								<div class="panel-body">
									<strong>Lieu-dit : </strong>{{ site.properties.lieudit }} <br />
									<strong>Période d'ouverture : </strong>{{ site.properties.periode_ouverture }} <br />
									<strong>Superficie : </strong>{{ site.properties.superficie }} {{ site.properties.unite_superficie }}<br />
									<strong>Rareté : </strong>{{ site.properties.rarete }} <br />
									<a role="button" class="btn btn-default" href="#" ng-click="openDetails(site.properties)">Afficher détails &raquo </a>
								</div>
							</div>
						</div>
					</div>

				</div> 		
			</div>			
		</div>						

		<!-- La carte -->
		<div id="containerCarte" class="col-md-offset-4 col-md-8">
			<div id="carte"></div>
		</div>		

		<!-- Biliothèques js -->
		<script src="vendors/jquery/jquery.min.js"></script>	
		<script src="vendors/bootstrap/js/bootstrap.min.js"></script>			
		<script src="vendors/angular/angular.min.js"></script>
		<script src="vendors/leaflet/leaflet.js"></script>
		<script src="https://code.angularjs.org/1.2.28/angular-route.min.js"></script>
		<script src="vendors/angular-bootstrap/ui-bootstrap-custom-1.1.1.min.js"></script>
		<script src="vendors/angular-bootstrap/ui-bootstrap-custom-tpls-1.1.1.min.js"></script>

		<!-- Modules -->
		<script src="js/app.js"></script>

		<!-- Controllers -->
		<script src="js/controllers/homeController.js"></script>
		<script src="js/controllers/modalController.js"></script>
		<script src="js/controllers/modalDetailsController.js"></script>			
		<script src="js/controllers/mapController.js"></script>

		<!-- Services -->
		<script src="js/services/htmlContent.js"></script>

		 <!-- Script JS -->
		 <script src="js/script.js"></script>

	</body>
</html>
