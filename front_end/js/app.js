var app = angular.module("HueMeApp", ['ui.router', 'ui.bootstrap']);


//router definition
app.config(function($stateProvider, $urlRouterProvider) {
	$urlRouterProvider.otherwise("/");

	$stateProvider
		.state('landing', {
			url: "/",
			template: "<landing-dir></landing-dir>"
		})
});




