(function() {
  "use strict";

  angular.module("app").controller("leagueCtrl", function($scope, $http) {

    $scope.setup = function() {
      $http.get('/leagues/indexes.json').then(function(response){
        $scope.leagues = response.data;
      });
    }

    window.$scope = $scope;
  });

}());