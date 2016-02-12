// Création du module
var app = angular.module('GeoSiteApp', ['ui.bootstrap','pdf']);


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
- Système de route ---------------------------------------------------------------------------------- TODO
- Afficher le GeoJSON avec AngularJS et Leaflet (pas seulement leaflet) ----------------------------- DONE
- Faire un script php pour générer un JSON qui contient les attributs ainsi que la géométrie -------- DONE
- Créer la liaison entre carte et liste ------------------------------------------------------------- TODO
- Créer la modal contenant les détails d'un site et le lien du pdf ---------------------------------- TODO
- Mettre en place le fitrage ------------------------------------------------------------------------ TODO
- Mettre en place la recherche avec auto-complétion pour rechercher une commune --------------------- TODO
- Mettre l'application sur GitHub ------------------------------------------------------------------- DONE
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