var app = angular.module("HueMeApp");
app.service('urlService', function() {
	this.recentPostsUrl = "http://127.0.0.1:8888/HueMe/front_end/";
	this.loginUrl = "http://127.0.0.1:8888/HueMefront_end//login";
	this.registerUrl = "http://127.0.0.1:8888/HueMe/front_end/register";
	this.updateProfUrl = "http://127.0.0.1:8888/HueMe/front_end/updateProfile";
	this.leavePostUrl = "http://127.0.0.1:8888/HueMe/front_end/post";
	this.postsByUserUrl = "http://127.0.0.1:8888/HueMe/front_end/postsByUser"
	this.aboutUrl = "http://127.0.0.1:8888/HueMe/front_end/about"
})