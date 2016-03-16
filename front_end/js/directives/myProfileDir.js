var app = angular.module("HueMeApp");

app.filter('range', function() {
  return function(input, min, max) {
    max = parseInt(max);
    min = parseInt(min);

    for(var i=min; i <= max; i++) {
      input.push(i.toString());
    }
    return input;
  };
});

app.directive('myProfileDir', function($localStorage, $state, regLogService, updateProfileService, avatarService, countryService) {
  return {
    restrict: "E",
    templateUrl: "templates/myProfile.html",
    controller: function() {

      this.user = $localStorage.user[0];
      this.user.dob = {month: "", day: "", year: ""};

      this.logOut = function() {
        regLogService.logOut(function() {
          $state.go('landing');
        });
      };
      $localStorage.userTemp = $localStorage.user[0];

      this.save = function(){
         alert('save');
       };
       this.avatars = avatarService.avatars;

      this.countries = countryService.countries;
      this.regions = countryService.regions;
      this.temp = {};

      this.avatSel = function(index){
        this.temp.photo_url = this.avatars[index].url;
        this.selected = index + 1;
      };

      this.genders = ['Female', 'Male', 'Other'];
      this.editorEnabled = false;

      this.enableEditor = function(){
        this.editorEnabled = true;
        this.temp = jQuery.extend({}, this.user);
      };

      this.disableEditor = function(){
        this.editorEnabled = false;
        this.selected = '';
        this.temp = {};
      };

      this.months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
      this.days = {'January': 31,
                  'February': 28,
                  'March': 31,
                  'April': 30,
                  'May': 31,
                  'June': 30,
                  'July': 31,
                  'August': 31,
                  'September': 30,
                  'October': 31,
                  'November': 30,
                  'December': 31 };
      console.log(this.days['April']);
    },
    controllerAs: "profileCtrl"
  };
});
