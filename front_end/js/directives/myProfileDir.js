var app = angular.module("HueMeApp");

app.directive('myProfileDir', function($localStorage, $state, regLogService, updateProfileService, avatarService, countryService) {
  return {
    restrict: "E",
    templateUrl: "templates/myProfile.html",
    controller: function() {
      this.user = $localStorage.user[0];
      this.logOut = function() {
        regLogService.logOut(function() {
          $state.go('landing');
        })
      }
      $localStorage.userTemp = $localStorage.user[0];

      this.save = function(){
         alert('save');
       }
       this.avatars = avatarService.avatars;

      this.countries = countryService.countries;

      this.temp = {};

      this.avatSel = function(index){
        this.temp.photo_url = this.avatars[index].url;
        this.selected = index + 1;
      }

      this.genders = ['Female', 'Male', 'Other'];
      this.editorEnabled = false;

      this.enableEditor = function(){
        this.editorEnabled = true;
        this.temp = jQuery.extend({}, this.user);
      }

      this.disableEditor = function(){
        this.editorEnabled = false;
        this.selected = '';
        this.temp = {};
      }
    },

    controllerAs: "profileCtrl"

  }
})
