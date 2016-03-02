var app = angular.module("HueMeApp");

app.directive('userProfileDir', function() {
  return {
    restrict: "E",
    templateUrl: "userProfile.html",
    controller: function() {

    },
    controllerAs: "profileCtrl"

  }
})
