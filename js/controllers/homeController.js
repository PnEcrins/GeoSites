// Création du controller HomeController
// Un controller gère les données de l'application
app.controller('HomeController', ['$scope', 'htmlcontent', '$uibModal', function($scope, htmlcontent, $uibModal) {
	// On récupère dans le fichier Json toutes les données de la barre de navigation (le logo, le titre, les liens)
	htmlcontent.success(function(data) {
		$scope.contentHTML = data;
	});

	// Ouverture de la modal, on passe en paramètre le contenu et le titre.
	$scope.open = function (title, content) {
		var modalInstance = $uibModal.open({
			templateUrl: 'js/directives/modal.html',
			controller: 'ModalInstanceCtrl',
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

}]);