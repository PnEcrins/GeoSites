// Controller de la modal, ici on s'occupe de ce qui est fermeture au clic sur le bouton
app.controller('ModalDetailsCtrl', function ($scope, $http, $uibModalInstance, site) {
	

  $scope.pdfName = 'my test so ggod';
  $scope.pdfUrl = 'data/pdf/PAC-0002-Dessin.pdf';
  $scope.scroll = 0;
  $scope.loading = 'loading';

  $scope.getNavStyle = function(scroll) {
    if(scroll > 100) return 'pdf-controls fixed';
    else return 'pdf-controls';
  }

  $scope.onError = function(error) {
    console.log(error);
  }

  $scope.onLoad = function() {
    $scope.loading = '';
  }

  $scope.onProgress = function(progress) {
    console.log(progress);
  }
    
    // Initialisation
    $scope.site = site;

	// On récupère dans le fichier Json toutes les données de la barre de navigation (le logo, le titre, les liens)
	$scope.longueurChaineAfficherSuite = longueurChaineAfficherSuite;
	$scope.longueur = $scope.longueurChaineAfficherSuite;

	$scope.afficherSuite = function (chaine) {
		$scope.longueur = chaine.length + 1;
	}
    
    //chargement des documents du site
    var viewDocs = 'geologie.v_documents_sites';
	var urlDocs = 'generatejson.php?view='+viewDocs+'&id_site=' + $scope.site.id_site;
	$http.get(urlDocs).success(function(response) {
		// Tableau d'objets contenant les informations à propos des fichiers pdf pour un seul site passé en paramètre
		$scope.docs = response;
	});

    //chargement des intérêts du site
    var viewInterets = 'geologie.v_interets_sites';
	var urlInterets = 'generatejson.php?view='+viewInterets+'&id_site=' + $scope.site.id_site;
	$http.get(urlInterets).success(function(response) {
		// Tableau d'objets contenant les informations à propos des fichiers pdf pour un seul site passé en paramètre
		$scope.interets = response;
	});
    
    //fermeture de la modale
	$scope.ok = function () {
		$uibModalInstance.close();
	};
});
