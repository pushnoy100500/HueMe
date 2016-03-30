var app = angular.module('HueMeApp');
app.directive('profileCommentingDir', function(postingService) {
	return {
		restrict: "E", 
		templateUrl: "templates/profileCommenting.html",
		scope: {
			dataArg: "="
		},
		controller: function($scope, postingService) {
			var self = this;
			//console.log($scope.dataArg.userId);	 
		   
		   	this.submitted = false;
  		 	this.commentData = {};
  
  		 	this.submitComment = function(){
  		 		this.submitted = true;
  		 	}
		},
		controllerAs: "postCommentingCtrl"
	}
});