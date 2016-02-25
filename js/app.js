// Création du module
var app = angular.module('GeoSiteApp', ['ngRoute','ui.bootstrap','pdf']);


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

app.directive('dirFilterElement', function() {
  return {
	restrict: 'E',
	scope: {
	  key: '=key',
	  filterInfo: '=filter',
	  onCheck:'&'
	},
	templateUrl: 'templates/directive-filterpanel.html',    
	controller: function($scope){
		$scope.state = angular.isDefined($scope.state) ? Boolean($scope.state) : true;
	}
  };
});

// Filtre pour afficher du html dans la modal, sce est un service qui permet à AngularJS de lire du HTML depuis un fichier Json
app.filter("sanitize", ['$sce', function($sce) {
  return function(htmlCode){
    return $sce.trustAsHtml(htmlCode);
  }
}]);

/* ------------------- *
* --------------------- *
* ------ ROUTING ------ *
* --------------------- *
* -------------------- */
// app.config(['$routeProvider',
    // function($routeProvider) {
        // $routeProvider
            // .when('/site/:siteId', {
                // templateUrl: 'templates/home.html',
                // controller: 'HomeController'
            // })
            // .when('/#anchor:siteId', {})
            // .when('/', {
                // templateUrl: 'templates/home.html',
                // controller: 'HomeController'
            // })
            // .otherwise({
                // redirectTo: '/'
            // });
    // }
// ]);
// gestion d'un conflit entre anchorscroll et le routing
// app.run(function($rootScope, $location, $anchorScroll, $routeParams) {
  // $rootScope.$on('$routeChangeSuccess', function(newRoute, oldRoute) {
    // $location.hash($routeParams.scrollTo);
    // $anchorScroll();  
  // });
// });