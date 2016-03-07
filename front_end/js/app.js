var app = angular.module("HueMeApp", ['ui.router', 'ui.bootstrap', 'jcs-autoValidate', 'ngStorage']);

//router definition
app.config(function($stateProvider, $urlRouterProvider) {
	$urlRouterProvider.otherwise("/");

	$stateProvider
		.state('landing',{
			url: "/",
			template: "<landing-dir></landing-dir>",
			controller: function(posts) {
				this.posts = posts;
			},
			controllerAs: "postsCtrl",
			resolve: {
				posts: function($http, $q, timeSinceService) {
					var deferred = $q.defer();
					$http({method: 'GET', url: 'http://localhost/hueme/'})
					//http://24.57.53.41/git/master/HueMe/index.php/Home/
						.then(function(data) {
							var temp = JSON.parse(data.data);
							temp = temp.map(function(post) {
								var post = post;
								post.time = timeSinceService.timeSince(new Date(post.time));
								return post;
							})
							deferred.resolve(temp);
						});
						return deferred.promise;
				}
			}
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
		.state('myprofile', {
			url: "/myprofile",
			template: "<my-profile-dir></my-profile-dir>"
		})
});

app.run([
//registration form validation config
    'defaultErrorMessageResolver', 'bootstrap3ElementModifier',
    function (defaultErrorMessageResolver) {

        defaultErrorMessageResolver.getErrorMessages().then(function (errorMessages) {
        	errorMessages['tooSimplePass'] = 'Password should be at least 8 characters including upper/lower case, special character and numbers';
        	errorMessages['invalidDOB'] = 'Age requirement for this website is 17 - 90';
        	errorMessages['unameErr'] = "Username must be shorter than 15 characters";
        });
    }
]);
