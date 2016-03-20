var app = angular.module("HueMeApp");
app.directive("profilePostingDir", function() {
	return {
		restrict: "E",
		templateUrl: "templates/profilePosting.html",
		controller: function() {
			this.postingData = {};
			this.makePost = function() {
				console.log(this.postingData);
			}
		},
		controllerAs: "profilePostingCtrl"
	}
})