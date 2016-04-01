var app = angular.module("HueMeApp");
app.service('urlService', function() {
	this.recentPostsUrl = "http://localhost/hueme/index.php";
	this.loginUrl = "http://localhost/hueme/index.php/login";
	this.registerUrl = "http://localhost/hueme/index.php/register";
	this.updateProfUrl = "http://localhost/hueme/index.php/updateProfile";
	this.leavePostUrl = "http://localhost/hueme/index.php/post";
	this.postsByUserUrl = "http://localhost/hueme/index.php/postsByUser"
	this.sendComment = "http://localhost/hueme/index.php/reply";
	this.commentsByPostUrl = "http://localhost/hueme/index.php/getComments"
})