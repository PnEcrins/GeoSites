// Controller de la modal, ici on s'occupe de ce qui est fermeture au clic sur le bouton
app.controller('ModalDetailsCtrl', ['$scope', '$rootScope', '$http', '$uibModalInstance', 'site', '$location', 'vue', function ($scope, $rootScope, $http, $uibModalInstance, site, $location, vue) {
    // Initialisation
    $scope.site = site;
    $rootScope.pageTitle = $scope.site.nom_site + ' | ';
    
    // Insertion PDF
    $scope.pdfName = '';
    $scope.pdfUrl = '';
    $scope.scroll = 0;
    $scope.loading = 'Chargement en cours...';

    $scope.getNavStyle = function(scroll) {
        if(scroll > 100) return 'pdf-controls fixed';
        else return 'pdf-controls';
    }

    $scope.onLoad = function() {
        $scope.loading = '';
    }

    $scope.onProgress = function(progress) {
        $scope.loading = 'Chargement en cours...';
    }
    
    $scope.updatePdfView = function(doc) {
        $scope.pdfUrl = 'data/pdf/'+doc.fichier;
        $scope.pdfName = doc.commentaire;
    }
    
    // Hack to display the first pdf
    $scope.renderPdf = false;
    $scope.expandDocs = function(){
        $scope.renderPdf = true;
        $scope.loading = '';
    }
    
    // Chargement des documents du site
    var viewDocs = vue.documents;
	var urlDocs = 'generatejson.php?view='+viewDocs+'&id_site=' + $scope.site.id_site;
	$http.get(urlDocs).success(function(response) {
		// Tableau d'objets contenant les informations à propos des fichiers PDF pour un seul site passé en paramètre
		$scope.docs = response;
        $scope.pdfUrl = 'data/pdf/'+$scope.docs[0].fichier;
        $scope.pdfName = $scope.docs[0].commentaire;
	});

    // Chargement des intérêts secondaires du site
    var viewInterets = 'geologie.v_interets_sites';
	var urlInterets = 'generatejson.php?view=' + viewInterets + '&id_site=' + $scope.site.id_site;
	$http.get(urlInterets).success(function(response) {
		// Tableau d'objets contenant les informations à propos des intérêts secondaires pour un seul site passé en paramètre
		$scope.interets = response;
	});

    // Chargement des photos pour la galerie d'images
    var viewPhotos = vue.photos;
    var urlPhotos = 'generatejson.php?view=' + viewPhotos + '&id_site=' + $scope.site.id_site;
    $http.get(urlPhotos).success(function(response) {
        $scope.photos = response;
    });
    
    // Fermeture de la modale
	$scope.ok = function () {
	  $uibModalInstance.close();
	};

	$scope.$on('modal.closing', function(){
	  $location.path('/');
 	 $rootScope.pageTitle = '';
	});
}]);
