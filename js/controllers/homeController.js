// Création du controller HomeController
// Un controller gère les données de l'application
app.controller('HomeController', ['$scope', 'htmlcontent', '$uibModal', '$http','LeafletServices', '$location', '$anchorScroll', '$rootScope', function ($scope, htmlcontent, $uibModal, $http, LeafletServices, $location, $anchorScroll, $rootScope) {

	// Initialisation
	$scope.loadingClass = 'onloading';
	// On récupère dans le fichier Json toutes les données de la barre de navigation (le logo, le titre, les liens)
	htmlcontent.success(function(data) {
		$scope.contentHTML = data;
	});

	// Ouverture de la modal, on passe en paramètre le contenu et le titre.
	$scope.openNavbar = function (title, content) {
		var modalInstance = $uibModal.open({
			templateUrl: 'js/directives/modalNavbar.html',
			controller: 'ModalNavbarInstanceCtrl',
			size: 'lg',
			resolve: {
				title: function () {
					return title;
				},
				content: function () {
					return content;
				}
			}
		});
	};

	$scope.openAccueil = function () {
		var modalInstance = $uibModal.open({
			templateUrl: 'templates/modalAccueil.html',
			controller: 'ModalAccueilInstanceCtrl',
			size: 'lg',
			resolve: {}
		});
	};

	$scope.openAccueil();

	$scope.openDetails = function (site) {
		var modalInstance = $uibModal.open({
			templateUrl: 'templates/modalDetails.html',
			controller: 'ModalDetailsCtrl',
			size: 'lg',
			resolve: {
				site: function () {
					return site;
				}
			}
		});
	};	

	//geojson
	$http.get('generategeojson.php')
	.success(function(response) {
		$scope.geojsonSites = response.features;
		//carte
		$scope.baselayers = {},
		$scope.controllayers = {},
		$scope.mainLayer = null,
		$scope.mainLayerData = null,		
		
		$('#info-popup').hide();
		
		$scope.map = L.map('carte', { zoomControl: false });
		L.control.zoom({position: 'topright', zoomInTitle: 'Zoomer', zoomOutTitle: 'Dézoomer'}).addTo($scope.map);
		L.control.scale({position: 'bottomright', imperial: false}).addTo($scope.map);

		$http.get("data/map.json").then(
			function(results) {
				//----Fonds de carte
				angular.forEach(results.data.layers.baselayers, function(value, key) {
					var l = LeafletServices.loadData(value);
					$scope.baselayers[key] = l;
					$scope.controllayers[l.name] = l.map;
					if (value.active) {
					  $scope.baselayers[key].map.addTo($scope.map);
					}
				});
				$scope.map.setView(new L.LatLng(results.data.center.lat, results.data.center.lng),results.data.center.zoom);
				
				$scope.mapOptions = results.data;

				$scope.map.addControl(new L.Control.Layers($scope.controllayers));
				
				//----Couche principale
				//options
				$scope.mainLayerOptions = eval("("+(results.data.layers.overlay.options || {}) +")");
				$scope.mainLayerOptions.customOnEachFeature = $scope.mainLayerOptions.onEachFeature || function () {};
				$scope.mainLayerOptions.onEachFeature = function(feature, layer) {
					$scope.mainLayerOptions.customOnEachFeature(feature, layer);
					layer.on({
						click : function(e){
							$rootScope.$apply($rootScope.$broadcast("feature:click", layer))
						},
						popupclose: function() {
							$('#info-popup').hide();
						}
					});					
				};				

				//Chargement des données et affichage sur la carte    
				$scope.mainLayerData = $scope.geojsonSites;
				$scope.mainLayer = new L.geoJson($scope.geojsonSites,$scope.mainLayerOptions);
				$scope.map.addLayer($scope.mainLayer );
				
				//----Selecteur de localisation
				if (results.data.location) {
					$http.get(results.data.location.url).then(
						function(results) {    
						  $scope.locationData = results.data;
						}
					);
				}

				// Interraction liste/carte
				$scope.bindListMap = function (site) {			
					document.getElementById(site.properties.id_site).className="couleurNoire";
					$scope.mainLayer.eachLayer(function(layer) { 
						if(site.properties.id_site == layer._siteId){
							// alert('monsite = ' + layer._siteId);
							var x = site.geometry.coordinates[0];                        
							var y = site.geometry.coordinates[1];
							// alert('x = ' + x);                            
							var latlng = new L.LatLng(y,x);
							layer.openPopup(latlng);
						}
					});		
				};
			}
		);
		$scope.loadingClass = 'isload';
		openAccueil();		
	})
	.error(function(err) {
		$scope.erreur = err;
	});

	$scope.previousLinkSelected = null;
	//Action selection d'un élément sur la carte
	$scope.$on('feature:click', function(ev, item){
		$scope.infoObj = item.feature.properties;
		$('#filter-panel').collapse('hide');
		$('#info-popup').show();
		$location.hash('anchor'+item.feature.properties.id_site);
		// call $anchorScroll()
		$anchorScroll();
		//$scope.couleurPolice = "couleurRouge";
		/*$scope.collapser = "panel-collapse collapse";*/
		document.getElementById(item.feature.properties.id_site).className="couleurNoire";
		if(document.getElementById(item.feature.properties.id_site).className!="couleurRouge"){
			/*var x =document.getElementByClassName("couleurRouge");
			x[0].className="panel-collapse collapse in";*/
			if($scope.previousLinkSelected != null && $scope.previousLinkSelected != item.feature.properties.id_site){
				document.getElementById($scope.previousLinkSelected).className="couleurNoire";
			}			
			document.getElementById(item.feature.properties.id_site).className="couleurRouge";
			$scope.previousLinkSelected = item.feature.properties.id_site;							
		}	    	   
	});
	
	//Action zoom sur une localisation
	$scope.$watch('selectedLocation', function (newvalue, oldvalue) {
		if (newvalue) {
			$scope.map.fitBounds([
				[newvalue.st_ymin, newvalue.st_xmin],
				[newvalue.st_ymax, newvalue.st_xmax]
			], {zoom:17});
		}
	});
	
	//Action filtre d'un élément sur la carte
	$scope.dofilterOnMap= function () {
		$scope.map.removeLayer($scope.mainLayer);
		var options = angular.extend(
			$scope.mainLayerOptions,
			{
				filter: function(feature, layer) {
					var fil=0;
					angular.forEach($scope.mapOptions.layers.overlay.filters, function(arrayFilter, key) {
						if (feature.properties[key]) fil += arrayFilter.values[feature.properties[key]].visible;
					});
					return fil > 1 ? true : false ;
				}
			}
		);
		$scope.mainLayer = new L.geoJson($scope.mainLayerData,options);
		$scope.mainLayer.addTo($scope.map);
	}
	
	$scope.checkUncheckAll= function (filterType, val) {
		var toggleStatus = val;
		angular.forEach($scope.mapOptions.layers.overlay.filters[filterType].values, function(arrayFilter, key) {
			arrayFilter.visible = toggleStatus;
		});
		$scope.dofilterOnMap();
	}		
}]);

app.factory('LeafletServices', ['$http', function($http) {
	return {
	  layer : {}, 	  
	  loadData : function(layerdata) {
		this.layer = {};
		this.layer.name = layerdata.name;
		this.layer.active = layerdata.active;
		
		if (layerdata.type == 'xyz' || layerdata.type == 'ign') {
		  var url = layerdata.url;
		  if ( layerdata.type == 'ign') {
			url = 'https://gpp3-wxs.ign.fr/' + layerdata.key + '/geoportail/wmts?LAYER='+layerdata.layer+'&EXCEPTIONS=text/xml&FORMAT=image/jpeg&SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&STYLE=normal&TILEMATRIXSET=PM&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}'; 
		  }
		  this.layer.map = new L.TileLayer(url,layerdata.options);
		}
		else if (layerdata.type == 'wms') {
		  this.layer.map = L.tileLayer.wms(layerdata.url,layerdata.options);
		}
		return this.layer;
	  }	  
   };
}]);

