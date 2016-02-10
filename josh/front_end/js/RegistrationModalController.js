var app = angular.module("HueMeApp");
app.controller("RegistrationModalController", function($uibModalInstance, $scope) {

	$scope.submit = function () {
		$uibModalInstance.close();
	}

	$scope.cancel = function () {
		$uibModalInstance.close();
	}
});