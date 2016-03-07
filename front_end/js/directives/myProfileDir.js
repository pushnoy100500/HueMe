var app = angular.module("HueMeApp");

app.directive('myProfileDir', function($localStorage, $state, regLogService) {
  return {
    restrict: "E",
    templateUrl: "templates/myProfile.html",
    controller: function() {
      this.user = $localStorage.user;
      this.logOut = function() {
        regLogService.logOut(function() {
          $state.go('landing');
        })
      }
      this.avatars = [
        {'url' : 'http://localhost/front_end/styles/styleImgs/avatarD1.png'},
        {'url' : 'http://localhost/front_end/styles/styleImgs/avatarF1.png'},
        {'url' : 'http://localhost/front_end/styles/styleImgs/avatarF2.png'},
        {'url' : 'http://localhost/front_end/styles/styleImgs/avatarF3.png'},
        {'url' : 'http://localhost/front_end/styles/styleImgs/avatarM1.png'},
        {'url' : 'http://localhost/front_end/styles/styleImgs/avatarM2.png'},
        {'url' : 'http://localhost/front_end/styles/styleImgs/avatarM3.png'},
      ];
        this.genders = ['Female', 'Male', 'Other'];
        this.editorEnabled = false;

        this.enableEditor = function(){
            this.editorEnabled = true;
        }

        this.disableEditor = function(){
            this.editorEnabled = false;
        }

      this.save = function(){
         alert('save');
      }
    },
    controllerAs: "profileCtrl"

  }
})
