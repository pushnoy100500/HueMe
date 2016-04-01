'use strict'
var app = angular.module("HueMeApp", ['ui.router', 'ui.bootstrap', 'jcs-autoValidate', 'ngStorage', 'ui.select', 'ngSanitize']);

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
				posts: function($http, $q, timeSinceService, urlService) {
					var deferred = $q.defer();
					$http({method: 'GET', url: urlService.recentPostsUrl})
						.then(function(data) {
							var temp = data.data;
							temp = temp.map(function(post) {
								//var post = post;
								post.time = timeSinceService.timeSince(new Date(post.time));
								return post;
							});
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
		.state('myprofile.profileposting', {
			url: "/profileposting/",
			template: "<profile-posting-dir></profile-posting-dir>"
		})
		.state('myprofile.profilecommenting', {
			url: "/profilecommenting/",
			template: "<profile-commenting-dir></profile-commenting-dir>"
		})
		.state('myprofile.commentlist', {
			url: "/commentlist/",
			template: "<comment-listing-dir></comment-listing-dir>"
		});
});

app.run(
    function (defaultErrorMessageResolver, regLogService, $rootScope, $state, $location, $localStorage) {
			/* form verification */
        defaultErrorMessageResolver.getErrorMessages().then(function (errorMessages) {
        	errorMessages['tooSimplePass'] = 'Password should be at least 8 characters including upper/lower case, special character and numbers';
        	errorMessages['invalidDOB'] = 'Age requirement for this website is 17 - 90';
        	errorMessages['unameErr'] = "Username must be shorter than 15 characters";
        });
				/* authentication middleware */
				$rootScope.$on('$stateChangeStart', function(event, toState, toParams, fromState, fromParams, options){
					var authStates = ['myprofile'];
					console.log($localStorage.isLoggedIn);
					if(authStates.indexOf(toState.name) >= 0) {
						if(!$localStorage.isLoggedIn) {
								alert('you must be authorized to view this page');
								$location.path('/');
							} else {
								$location.path(toState.url);
							}
					} else {
							$location.path(toState.url);
					}
					/*   */
				});
    }
);
