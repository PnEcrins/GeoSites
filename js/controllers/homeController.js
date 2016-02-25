// Création du controller HomeController
// Un controller gère les données de l'application
app.controller('HomeController', ['$scope','$rootScope', '$compile', '$routeParams', '$uibModal', '$http','LeafletServices', '$location', '$anchorScroll', '$rootScope', function ($scope,$rootScope, $compile, $routeParams, $uibModal, $http, LeafletServices, $location, $anchorScroll, $rootScope) {

    // Initialisation
    $scope.loadingClass = 'onloading';
    $scope.previousLinkSelected = null;
    $scope.monsite = null;
    $scope.siteId = null;
    
    $scope.abbrListe1 = abbrListe1;
    $scope.abbrListe2 = abbrListe2;
    $scope.abbrListe3 = abbrListe3;
    $scope.abbrListe4 = abbrListe4;
    $scope.abbrListe5 = abbrListe5;
    $scope.abbrListe6 = abbrListe6;
    $scope.abbrListe7 = abbrListe7;
    $scope.abbrListe8 = abbrListe8;
    $scope.abbrListe9 = abbrListe9;

    // Comportement de la barre de navigation
    $scope.navBarCollapse = function() {
        $(".navbar-collapse").collapse("toggle");
        return false;
    };
    
    //ouverture et fermeture de la side bar contenant la liste des sites
    $scope.SideBarToggle = function () {
        $("#sidebar").toggle();
        if($("#sidebar").is(":visible")){
            var isVisible = true;
            document.getElementById("containerCarte").className = "col-lg-offset-3 col-md-offset-4 col-sm-offset-6 col-lg-9 col-md-8 col-sm-6 hidden-xs";
            document.getElementById("sidebar").className = "col-lg-3 col-md-4 col-sm-6 col-xs-12";
            $scope.map.invalidateSize();            
        }
        else{
            var isVisible = false;
            document.getElementById("containerCarte").className = "col-lg-12 col-md-12 col-sm-12 col-xs-12";
            document.getElementById("sidebar").className = "";
            $scope.map.invalidateSize();
        }
        // $(".navbar-collapse").collapse("toggle");
        return false;
    };
    
    $("show-sidebar").click(function(){
        $scope.SideBarToggle();
    });
    
    $scope.pne = function () {
        var modalInstance = $uibModal.open({
            templateUrl: 'templates/modalPne.html',
            controller: 'ModalPneInstanceCtrl',
            size: 'lg',
            resolve: {}
        });
        $(".navbar-collapse.in").collapse("hide");
        return false;
    };
    
    $scope.info = function () {
        var modalInstance = $uibModal.open({
            templateUrl: 'templates/modalAccueil.html',
            controller: 'ModalAccueilInstanceCtrl',
            size: 'lg',
            resolve: {}
        });
        $(".navbar-collapse.in").collapse("hide");
        return false;
    };
    
    $scope.contact = function () {
        var modalInstance = $uibModal.open({
            templateUrl: 'templates/modalContact.html',
            controller: 'ModalContactInstanceCtrl',
            size: 'lg',
            resolve: {}
        });
        $(".navbar-collapse.in").collapse("hide");
        return false;
    };
    
    $scope.help = function () {
        var modalInstance = $uibModal.open({
            templateUrl: 'templates/modalAide.html',
            controller: 'ModalAideInstanceCtrl',
            size: 'lg',
            resolve: {}
        });
        $(".navbar-collapse.in").collapse("hide");
        return false;
    };

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
    // Modal accueil
    $scope.openAccueil = function () {
        var modalInstance = $uibModal.open({
            templateUrl: 'templates/modalAccueil.html',
            controller: 'ModalAccueilInstanceCtrl',
            size: 'lg',
            resolve: {}
        });
    };
    $scope.openAccueil(); //ouverture de la modal

    // Modal affichant les détails d'un site
    $rootScope.openDetails = function (site) {
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
        $scope.controlBaseLayers = {},
        $scope.controlOverlayLayers = {},
        $scope.mainLayer = null,
        $scope.mainLayerData = null,        
        
        $('#info-popup').hide();
        
        $scope.map = L.map('carte', { zoomControl: false });
        L.control.zoom({position: 'topright', zoomInTitle: 'Zoomer', zoomOutTitle: 'Dézoomer'}).addTo($scope.map);
        L.control.scale({position: 'bottomright', imperial: false}).addTo($scope.map);
        var opacitySlider = new L.Control.opacitySlider();
        $scope.map.addControl(opacitySlider);

        $http.get("config/configmap.json").then(
            function(results) {
                //----Fonds de carte
                angular.forEach(results.data.layers.baselayers, function(value, key) {
                    var l = LeafletServices.loadData(value);
                    $scope.baselayers[key] = l;
                    $scope.controlBaseLayers[l.name] = l.map;
                    if (value.active) {
                      $scope.baselayers[key].map.addTo($scope.map);
                    }
                    // if (value.changeopacity) {
                      // opacitySlider.setOpacityLayer($scope.baselayers[key].map);
                    // }
                });
                
                $scope.map.setView(new L.LatLng(results.data.center.lat, results.data.center.lng),results.data.center.zoom);

                //couche opacity
                var l = LeafletServices.loadData(results.data.layers.opacitylayer);
                $scope.opacitylayer = l;
                $scope.map.addLayer(l.map);
                $scope.controlOverlayLayers[l.name] = l.map;//pour l'ajout de la couche dans le LayerControl
                opacitySlider.setOpacityLayer(l.map);
                l.map.setOpacity(0);

                //----Couche principale
                //options
                var mainLayerOptions = {
                    style: function (feature) {return {weight: 1.3, opacity: 1, fillOpacity: 0.5 };}
                    ,onEachFeature: function (feature, layer) {
                        var popup = '<div><h4>'+feature.properties.nom_site+'</h4><a role="button" href="#" ng-model="infoObj" ng-click="openDetails(infoObj)" tooltip="Voir les détails de ce site"><iclass="fa fa-plus-square-o"></i>&nbsp;Détails</a></div>';
                        var popupContent = $compile(popup)($scope); //On doit compiler le html pour que les directives angular comme ici 'ng-clik' soient interprétées
                        layer.bindPopup(popupContent[0]);
                        layer._properties = feature.properties;
                        layer.on({
                            click : function(e){$rootScope.$apply($rootScope.$broadcast("feature:click", layer))},
                            popupclose: function() {$('#info-popup').hide();}
                        });
                    }
                };
                $scope.mainLayerFilters = {
                    "code_region" :{
                        "name" : "Région"
                        ,"values" : {
                            "PAC":{"label":"PACA", "visible":true}
                            ,"RHA":{"label":"RHONE ALPES", "visible":true}
                        }
                    }
                };
                //Chargement des données et affichage sur la carte    
                $scope.mainLayerData = $scope.geojsonSites;
                $scope.mainLayer = new L.geoJson($scope.geojsonSites,mainLayerOptions);
                $scope.map.addLayer($scope.mainLayer );
                $scope.controlOverlayLayers[mainLayerName] = $scope.mainLayer; //pour l'ajout de la couche dans le LayerControl
                
                //ajout du Layer Control pour gérer les couches affichées
                $scope.map.addControl(new L.Control.Layers($scope.controlBaseLayers,$scope.controlOverlayLayers));
                
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
                    document.getElementById('heading' + site.properties.id_site).className="panel-heading";
                    $('.chimereClass').collapse('hide');
                    $('#collapse' + site.properties.id_site).collapse('show');
                    if(document.getElementById('heading' + site.properties.id_site).className!="panel-heading listHighlight"){
                        if($scope.previousLinkSelected != null && $scope.previousLinkSelected != 'heading' + site.properties.id_site){
                            document.getElementById($scope.previousLinkSelected).className="panel-heading";
                        }            
                        document.getElementById('heading' + site.properties.id_site).className="panel-heading listHighlight";
                        $scope.previousLinkSelected = 'heading' + site.properties.id_site;                            
                    }
                    $scope.mainLayer.eachLayer(function(layer) { 
                        if(site.properties.id_site == layer._properties.id_site){
                            var x = site.geometry.coordinates[0];                        
                            var y = site.geometry.coordinates[1];                           
                            var latlng = new L.LatLng(y,x);
                            layer.openPopup(latlng);
                        }
                    });        
                };         
            }
        );
        $scope.loadingClass = 'isload';        
    })
    .error(function(err) {
        $scope.erreur = err;
    });
    
    $scope.scrollTo = function(id) {
        var old = $location.hash();
        $location.hash(id);
        $anchorScroll();
        //reset to old to keep any additional routing logic from kicking in
        $location.hash(old);
    }
    
    //Action selection d'un élément sur la carte
    $scope.$on('feature:click', function(ev, item){
        $rootScope.infoObj = item.feature.properties;
        $('#filter-panel').collapse('hide');
        $('#info-popup').show();
        $scope.scrollTo('anchor'+item.feature.properties.id_site);
        $scope.bindListMap(item.feature); // interraction carte --> liste           
    });
    

    //Action zoom sur une localisation
    $scope.$watch('selectedLocation', function (newvalue, oldvalue) {
        // alert('xmin : '+newvalue.st_xmin);
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
                    angular.forEach($scope.mainLayerFilters, function(arrayFilter, key) {
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
        angular.forEach($scope.mainLayerFilters[filterType].values, function(arrayFilter, key) {
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

