// Controller de la modal, ici on s'occupe de ce qui est fermeture au clic sur le bouton
app.controller('ModalDetailsCtrl', function ($scope, $uibModalInstance, site) {
	$scope.site = site;

	$scope.ok = function () {
		$uibModalInstance.close();
	};
});
