var app = angular.module("HueMeApp");
app.service("regService", function($http) {
	this.registerUser = function(userData){
		//console.dir(userData);
		// var config = {headers: {'Content-Type' : 'application/x-www-form-urlencoded;charset=utf-8;'}};
		console.log({'user': userData });
		$http.post('http://localhost:8888/hueme/register',{'user': userData })
		.then(function(response) {
			console.dir(response.data);
		}, function(error) {
			console.log(error);
		});
	}
})
