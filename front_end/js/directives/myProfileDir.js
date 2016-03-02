var app = angular.module("HueMeApp");

app.directive('myProfileDir', function($localStorage) {
  return {
    restrict: "E",
    templateUrl: "templates/myProfile.html",
    controller: function() {
      this.user = $localStorage.user;
    },
    controllerAs: "profileCtrl"

  }
})
