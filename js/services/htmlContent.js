app.factory('htmlcontent', ['$http', function($http) {
	return $http.get('data/htmlContent.json')
	.success(function(data) {
		return data;
	})
	.error(function(err) {
		return err;
	});
}]);