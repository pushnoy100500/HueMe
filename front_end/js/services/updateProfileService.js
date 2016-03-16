var app = angular.module("HueMeApp");
app.service("updateProfileService", function($http, $localStorage) {
	this.updateUser = function(userData, callback){
		$http.post('http://localhost:8888/hueme/updateProfile',{'user': userData })
		.then(function(response) {
			console.log(response);
			callback(response.result);
		}, function(error) {
			callback(false);
		});
	}
})
