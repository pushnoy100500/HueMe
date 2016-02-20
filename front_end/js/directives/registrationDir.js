var app = angular.module("HueMeApp");

app.directive("registrationDir", function() {
	return {
		restrict: "E",
		// this is a relative path to the template from index.html file
		templateUrl: "templates/registration.html",
		controller: function(regService){  
			this.formModel = {};
			this.inputType = "password";

			this.showPass = function(){
				this.inputType = 'text';
			}

			this.hidePass = function(){
				this.inputType = 'password';
			}

			this.onSubmit = function(){
			//var data = $.param(this.formModel);
			//console.dir(data);
			console.log(this.formModel);
			this.newUser = regService.registerUser(this.formModel);
			}; 
		},
		controllerAs: "ctrl"
	}
});