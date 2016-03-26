var app = angular.module('HueMeApp');

app.directive('navigationDir', function() {
	return {
		restrict: "E",
		templateUrl: "templates/navigation.html",
		controller: function() {
			this.postingMode = false;
		},
		controllerAs: "navigationCtrl"
	}
})