var app = angular.module("HueMeApp");

app.directive('myProfileDir', function($localStorage, $state, regLogService) {
  return {
    restrict: "E",
    templateUrl: "templates/myProfile.html",
    controller: function() {
      this.user = $localStorage.user;
      this.logOut = function() {
        regLogService.logOut(function() {
          $state.go('landing');
        })
      }
    },
    controllerAs: "profileCtrl"

  }
})
