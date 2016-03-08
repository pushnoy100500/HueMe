var app = angular.module("HueMeApp");
app.service("updateProfileService", function($http, $localStorage) { 
	this.updateUser = function(userData, callback){ 
		$http.post('http://localhost:8888/hueme/updateProfile',{'user': userData })
		.then(function(response) {
			var user = JSON.parse(response.data);
			$localStorage.user = user; 
			callback(true);
		}, function(error) {
			callback(false);
		});
	}
})
