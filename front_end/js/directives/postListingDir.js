var app = angular.module('HueMeApp');
/*
	this directive requires a filter attribute that will contain an object 
	of the following format: 
	{
		'criteria': 'search criteria', // this defines what method in posting service we are triggering,
										// ex. userId will trigger getPostsByUser method
		'value': 'search value'     // value we are passing as a parameter to search function
	}
*/

app.directive('postListingDir', function(postingService) {
	return {
		restrict: "E",
		templateUrl: "templates/postListing.html",
		scope: {
			filter: "="
		},
		controller: function($scope, postingService, timeSinceService) {
			var self = this;
			this.filter = $scope.filter;
			this.waiting = true;
			this.posts = [];
			this.commentingMode = false;
			this.viewCommentMode = false;
			// based on what is a search criteria providedin filter attribute to directive
			// do different post search and rendering logic
			switch (this.filter.criteria) {
				case "userId":
					postingService.getPostsByUser(this.filter.value, 
					function(result) {
						self.waiting = false;
						self.posts = result;
						self.posts = self.posts.map(function(post) {
								//var post = post;
								post.time = timeSinceService.timeSince(new Date(post.time));
								return post; 
						});
					}, 
					function(error) {
						console.log(error);
					})
					break;

				default:
					// other search criteria logic
					break;
			}

  		 	this.userId = this.filter.value; 
  		 	this.enableComment = function ($index){
  		 		this.selectedIndex = $index;
  		 		this.commentingMode = !this.commentingMode;   
  		 	}

  		 	this.viewComment = function ($index){   
  		 		this.selectedIndex = $index; 
  		 		this.viewCommentMode = !this.viewCommentMode;   
  		 	}
		},
		controllerAs: "postListingCtrl"
	}
});