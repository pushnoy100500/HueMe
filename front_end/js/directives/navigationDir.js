var app = angular.module('HueMeApp');

app.directive('navigationDir', function($state) {
	return {
		restrict: "E",
		templateUrl: "templates/navigation.html",
		controller: function() {
			this.postingMode = false;
			this.startSearch = function(tags, users) {
				$state.go('search', 
					{
						data: {
							tags: tags,
							users: users
						}
					});

			}
		},
		controllerAs: "navigationCtrl"
	}
})