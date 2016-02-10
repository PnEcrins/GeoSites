// Controller de la modal, ici on s'occupe de ce qui est fermeture au clic sur le bouton
app.controller('ModalDetailsCtrl', function ($scope, $http, $uibModalInstance, site) {
	$scope.site = site;
	$scope.longueurChaineAfficherSuite = longueurChaineAfficherSuite;
	$scope.longueur = $scope.longueurChaineAfficherSuite;

	$scope.afficherSuite = function (chaine) {
		$scope.longueur = chaine.length + 1;
	}
    
    //chargement des documents du site
	var urlDocs = 'generatedocs.php?id_site=' + $scope.site.id_site;
	$http.get(urlDocs).success(function(response) {
		// Tableau d'objets contenant les informations à propos des fichiers pdf pour un seul site passé en paramètre
		$scope.docs = response;
	});

    //chargement des intérêts du site
	var urlInterets = 'generateinterets.php?id_site=' + $scope.site.id_site;
	$http.get(urlInterets).success(function(response) {
		// Tableau d'objets contenant les informations à propos des fichiers pdf pour un seul site passé en paramètre
		$scope.interets = response;
	});
    
    //fermeture de la modale
	$scope.ok = function () {
		$uibModalInstance.close();
	};
});
