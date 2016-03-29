var app = angular.module('HueMeApp');
app.directive('profileCommentingDir', function() {
	return {
		restrict: 'E',  
		templateUrl: "templates/profileCommenting.html",
		controller: function($scope){ 
		},
		controllerAs: "profileCommentingCtrl"
	} 
})