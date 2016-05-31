app.controller('ModalPneInstanceCtrl', ['$scope', '$uibModalInstance', '$location', function ($scope, $uibModalInstance, $location) {
	$scope.ok = function () {
		$uibModalInstance.close();
    $location.path('/');
	};
}]);
