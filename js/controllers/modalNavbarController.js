// Controller de la modal, ici on s'occupe de ce qui est fermeture au clic sur le bouton
app.controller('ModalNavbarInstanceCtrl', function ($scope, $uibModalInstance, title, content) {
	$scope.title = title;
	$scope.content = content;

	$scope.ok = function () {
		$uibModalInstance.close();
	};
});
