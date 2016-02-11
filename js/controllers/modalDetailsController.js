// Controller de la modal, ici on s'occupe de ce qui est fermeture au clic sur le bouton
app.controller('ModalDetailsCtrl', function ($scope, $http, $uibModalInstance, site) {

    // Initialisation
    $scope.site = site;
    
    // Insertion PDF
    $scope.pdfName = '';
    $scope.pdfUrl = '';
    $scope.scroll = 0;
    $scope.loading = 'Chargement...';

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
        $scope.loading = 'Chargement en cours...';
    }
    
    $scope.updatePdfView = function(doc) {
        $scope.pdfUrl = 'data/pdf/'+doc.fichier;
        $scope.pdfName = doc.commentaire;
    }
    
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
        $scope.pdfUrl = 'data/pdf/'+$scope.docs[0].fichier;
        $scope.pdfName = $scope.docs[0].commentaire;
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
