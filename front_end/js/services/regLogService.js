var app = angular.module("HueMeApp");
app.service("regLogService", function($http, $localStorage) {
	var self = this;
	this.isLoggedIn = false;
	this.registerUser = function(userData, callback){
		//console.dir(userData);
		// var config = {headers: {'Content-Type' : 'application/x-www-form-urlencoded;charset=utf-8;'}};
		// console.log({'user': userData });
		$http.post('http://localhost:8888/hueme/register',{'user': userData })
		.then(function(response) {
			var user = JSON.parse(response.data);
			$localStorage.user = user;
			self.toggleLogin();
			callback(true);
		}, function(error) {
			callback(false);
		});
	}
	this.toggleLogin = function() {
			self.isLoggedIn = !self.isLoggedIn;
	}
})
