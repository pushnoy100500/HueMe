var app = angular.module("HueMeApp");
app.service("regLogService", function($http, $localStorage) {
	var self = this;
	this.isLoggedIn = false;
	this.registerUser = function(userData, callback){
		$http.post('http://localhost:8888/hueme/register',{'user': userData })
		.then(function(response) {
			var user = JSON.parse(response.data);
			$localStorage.user = user;
			self.toggleLogin();
			callback(true);
		}, function(error) {
			callback(false);
		});
	};
	this.logUserIn = function(userData, callback) {
		$http.post('http://localhos:8888/hueme/login', {'user': userData})
			.then(function(response) {
					var user = JSON.parse(response.data);
					$localStorage.user = user;
					self.toggleLogin();
					callback(true);
				},
				function(error) {
					callback(false);
				})
	}
	this.logOut = function(callback) {
		self.toggleLogin();
		$localStorage.$reset();
		callback();
	}
	this.toggleLogin = function() {
			self.isLoggedIn = !self.isLoggedIn;
	}
})
