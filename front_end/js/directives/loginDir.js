var app = angular.module("HueMeApp");

app.directive("loginDir", function() {
	return {
		restrict: "E",
		// this is a relative path to the template from index.html file
		templateUrl: "templates/login.html",
		controller: function() {
			this.formModel = {}; 
			this.inputType = "password";

			this.HideShow = function(){
				if(this.inputType == 'password')
					this.inputType = 'text';
				else
					this.inputType = 'password';
			}
		},
		controllerAs: "ctrl"
	}
});