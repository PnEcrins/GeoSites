// Controller de la modal, ici on s'occupe de ce qui est fermeture au clic sur le bouton
app.controller('ModalDetailsCtrl', function ($scope, $http, $uibModalInstance, site) {
	$scope.site = site;

	var url = 'generatedocs.php?id_site=' + $scope.site.id_site;
	$http.get(url).success(function(response) {
		// Tableau d'objets contenant les informations à propos des fichiers pdf pour un seul site passé en paramètre
		$scope.docs = response;
	});


	$scope.ok = function () {
		$uibModalInstance.close();
	};
});
