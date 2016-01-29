// Création du controller pour tout ce qui est de angular et leaflet sur la carte
/*app.controller('MapController', ['$scope', '$http', function ($scope, $http) {
	$scope.mainLayer = null,
	$scope.mainLayerData = null,
	
	// Création de la carte, on choisi la vue de départ
	$scope.carte = L.map('carte', {attributionControl: false, zoomControl: false}).setView([44.83, 6.18], 10);

	// Les control sur la carte (le zoom et l'échelle)
	L.control.zoom({position: 'topright', zoomInTitle: 'Zoomer', zoomOutTitle: 'Dézoomer'}).addTo($scope.carte);
	L.control.scale({position: 'bottomright', imperial: false}).addTo($scope.carte);

	// Fond de carte Open Street Map
	$scope.osm = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
		maxZoom: 19
	});

	// Ajout du fond de carte à la carte
	$scope.carte.addLayer($scope.osm);

	$http.get(data/site_geol.geoJson).then(
		function(results) {    
		  $scope.mainLayerData = results.data;
		  $scope.mainLayer = new L.geoJson(results.data);
		  $scope.carte.addLayer($scope.mainLayer );
		}
	);		
}]);*/