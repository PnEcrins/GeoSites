app.controller('SiteDetailController', ['$scope', '$rootScope', '$timeout', '$compile', '$routeParams', '$uibModal', '$http', 'LeafletServices', '$location', '$anchorScroll', '$rootScope', function ($scope, $rootScope, $timeout, $compile, $routeParams, $uibModal, $http, LeafletServices, $location, $anchorScroll, $rootScope, HomeController) {
  var sites = $rootScope.mapSites;
  if (!sites) {
    // Coming here from a direct acces. Sites haven't been loaded yet, HomeController will show the modal once it's loaded.
    return;
  }
  var siteId = $routeParams.siteId;

  $scope.siteId = siteId;
  $rootScope.openDetails(sites[siteId].properties);
}]);