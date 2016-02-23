app.controller('ModalPneInstanceCtrl', function ($scope, $uibModalInstance) {
	$scope.ok = function () {
		$uibModalInstance.close();
	};
});
