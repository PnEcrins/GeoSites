// Création du module
var app = angular.module('GeoSiteApp', ['ui.bootstrap']);


/* ------------------- *
* --------------------- *
* ---- DIRECTIVES ----- *
* --------------------- *
* -------------------- */

// Création d'une nouvelle directive pour modifier le sens du chevron sur le bouton en bas de la sidebar
app.directive('showSidebar', function() {
	return {
		restrict: 'E',
		scope: {},
		templateUrl: 'js/directives/showSidebar.html',
		
		link: function(scope, element, attrs) {
			scope.sensChevron = "icon-chevron-left",
			scope.shown = false,

			scope.showPanel = function() {
				element.toggleClass('btn-default')
				if(scope.shown) {
					scope.sensChevron = "icon-chevron-left";
					scope.shown = false;
				} else {
					scope.sensChevron = "icon-chevron-right";
					scope.shown = true;
				}
			}
		}
	};
});


/* ------------------- *
* --------------------- *
* ------- CARTE ------- *
* --------------------- *
* -------------------- */

// Création de la carte, on choisi la vue de départ
var carte = L.map('carte', {attributionControl: false, zoomControl: false}).setView([44.83, 6.18], 10);

// Les control sur la carte (le zoom et l'échelle)
L.control.zoom({position: 'topright', zoomInTitle: 'Zoomer', zoomOutTitle: 'Dézoomer'}).addTo(carte);
L.control.scale({position: 'bottomright', imperial: false}).addTo(carte);

// Icon custom, à faire
/*L.Icon.Default.imagePath = 'img/';
L.Icon.iconSize(25,25);*/

// Fond de carte Open Street Map
var osm = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	maxZoom: 19
});

// Ajout du fond de carte à la carte
carte.addLayer(osm);

/* ------------------- *
* --------------------- *
* ------ FILTRES ------ *
* --------------------- *
* -------------------- */

// Filtre pour afficher du html dans la modal, sce est un service qui permet à AngularJS de lire du HTML depuis un fichier Json
app.filter("sanitize", ['$sce', function($sce) {
  return function(htmlCode){
    return $sce.trustAsHtml(htmlCode);
  }
}]);


/* ------------------- *
* --------------------- *
* ------- TODO -------- *
* --------------------- *
* -------------------- */

/*
- Système de route
- Afficher le GeoJSON avec AngularJS et Leaflet (pas seulement leaflet)
- Faire un script php pour générer un JSON qui contient les attributs ainsi que la géométrie
- Créer la liaison entre carte et liste
- Créer la modal contenant les détails d'un site et le lien du pdf
- Mettre en place le fitrage
- Mettre en place la recherche avec auto-complétion pour rechercher une commune
- Mettre l'application sur GitHub
*/




// Système de route 

/*,['ngRoute']);
app.config(function ($routeProvider) {
	$routeProvider
	.when('/', {
		controller: 'HomeController',
		templateUrl: 'views/home.html'		
	})
	.otherwise({
		redirectTo: '/'
	});
});*/