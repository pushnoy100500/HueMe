var app = angular.module("HueMeApp");
app.service("regLogService", function($http, $localStorage) {
	var self = this;
	this.registerUser = function(userData, callback){ 
		$http.post('http://localhost/hueme/register',{'user': userData }) 
		$http.post('http://localhost/hueme/index.php/register',{'user': userData }) 
		.then(function(response) {
			var user = response.data;
			$localStorage.user = user;
			$localStorage.isLoggedIn = true;
			callback(true);
		}, function(error) {
			callback(false);
		});
	};
	this.logUserIn = function(userData, callback) { 
		$http.post('http://localhost/hueme/login', {'user': userData}) 
		$http.post('http://localhost/hueme/index.php/login', {'user': userData}) 
			.then(function(response) {
					var user = response.data;
					if(user) {
						$localStorage.user = user;
						$localStorage.isLoggedIn = true;
						callback(true);
					} else {
						$localStorage.isLoggedIn = false;
						callback(false);
					}
				},
				function(error) {
					console.log('here');
					callback(false);
				});
	};
	this.logOut = function(callback) {
		console.log('logout');
		$localStorage.isLoggedIn = false;
		$localStorage.user = {};
		callback();
	};
});
