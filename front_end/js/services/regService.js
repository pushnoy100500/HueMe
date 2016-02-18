var app = angular.module("HueMeApp");
app.service("regService", function($http) {
	this.registerUser = function(userData){
		$http.post('regi.php', userData);
	}
})
