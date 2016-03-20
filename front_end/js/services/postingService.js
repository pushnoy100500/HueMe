var app = angular.module("HueMeApp");
app.service('postingService', function($http) {
	this.sendPost = function(postData) {
		$http.post("http://localhost:8888/hueme/post", {"post": postData})
			.then(function(success) {
				
			}, function(error) {

			})
	}
})