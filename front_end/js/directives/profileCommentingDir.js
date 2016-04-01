var app = angular.module('HueMeApp');
app.directive('profileCommentingDir', function(postingService, commentingService) {
	return {
		restrict: "E", 
		templateUrl: "templates/profileCommenting.html",
		scope: {
			dataarg: "="
		},
		controller: function($scope,commentingService, postingService, timeSinceService) {
			var self = this;
			this.submitted = false;
  		 	this.commentData = {};

			this.userId = $scope.dataarg.commenterId;
			this.postIndex = $scope.dataarg.index;
			this.postId = $scope.dataarg.posts[this.postIndex].id;
		   	
		   	
  
  		 	this.submitComment = function(){
  		 		this.submitted = true;
  		 		this.commentData.userId = this.userId;
  		 		this.commentData.postId = this.postId;
  		 		console.log(this.commentData);
 				
 				if(this.commentData.content == ''){
 					commentingService.sendComment(this.commentData);
  		 			this.commentData = {};
 				} 
  		 	}
		},
		controllerAs: "postCommentingCtrl"
	}
});