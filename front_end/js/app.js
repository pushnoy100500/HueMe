var app = angular.module("HueMeApp", ['ui.router', 'ui.bootstrap', 'jcs-autoValidate']);


//router definition
app.config(function($stateProvider, $urlRouterProvider) {
	$urlRouterProvider.otherwise("/");

	$stateProvider
		.state('landing', {
			url: "/",
			template: "<landing-dir></landing-dir>"
		})
		.state('landing.register', {
			url: "register/",
			template: "<registration-dir></registration-dir>"
		})
		.state('landing.tos', {
			url: "tos/",
			template: "<tos-dir class='custom-modal'></tos-dir>"
		})
		.state('landing.login', {
			url: "login/",
			template: "<login-dir></login-dir>"
		})
});

app.run([
//registration form validation config
    'defaultErrorMessageResolver',
    function (defaultErrorMessageResolver) { 
        defaultErrorMessageResolver.getErrorMessages().then(function (errorMessages) {
          errorMessages['tooSimplePass'] = 'Password should be at least 8 characters including upper/lower case, special character and numbers';
          errorMessages['invalidDOB'] = 'Age requirement for this website is 17 - 90';
          errorMessages['unameErr'] = "Username must be shorter than 15 characters";
        });
    }
]);


