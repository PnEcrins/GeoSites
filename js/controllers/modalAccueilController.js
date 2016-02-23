app.controller('ModalAccueilInstanceCtrl', function ($scope, $uibModalInstance) {
	$scope.ok = function () {
		$uibModalInstance.close();
	};
});
