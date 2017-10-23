<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html ng-app="app">
<head>
<title>Home</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.20/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body align="center" ng-controller="HttpGetController">
	<h1>Hello world!</h1>
	<script type="text/javascript">
		var app = angular.module("app", []);
		app
				.controller(
						"HttpGetController",
						function($scope, $http) {

							$scope.send = function() {
								// use $.param jQuery function to serialize data from JSON 
								alert("Hola");
								var data = $.param({
									name : $scope.name,

								});

								var config = {
									headers : {
										'Content-Type' : 'application/x-www-form-urlencoded;charset=utf-8;'
									}
								}

								$http
										.post('/mvc/display', data, config)
										.success(
												function(data, status, headers,
														config) {
													$scope.PostDataResponse = data.name;
													alert("Hola "+data.name);
												})
										.error(
												function(data, status, header,
														config) {
													$scope.ResponseDetails = "Data: "
															+ data
															+ "<hr />status: "
															+ status
															+ "<hr />headers: "
															+ header
															+ "<hr />config: "
															+ config;
												});
							};

						});
	</script>


	<label id="name" placeholder="name"> Name : <input
		placeholder="enter your name" type="text" ng-model="name" id="name">
	</label>
	</br>
	</br>
	<input type="button" ng-click="send()" value="Send" />

	<label>{{ PostDataResponse }}</label>

</body>
</html>
