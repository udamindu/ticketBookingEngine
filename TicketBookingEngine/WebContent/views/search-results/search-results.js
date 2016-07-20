/**
 * Controller for search results
 * Author : ashenkleo@gmail.com
 * SLIIT
 */

var app = angular.module('TBE', []);
app.controller('search', function($scope) {
	
	$scope.isOpenLocation = true;
	$scope.isOpenLocPics = true;
	$scope.isOpenEvents = true;
	$scope.isOpenPackage = true;
	$scope.isOpenLocGroups = true;
	
	$scope.toggleLocation = function(){
		if ($scope.isOpenLocation == true){
			$scope.isOpenLocation = false;
		} else {
			$scope.isOpenLocation = true;
		}
	}
	
	$scope.toggleEvents = function(){
		if ($scope.isOpenEvents == true){
			$scope.isOpenEvents = false;
		} else {
			$scope.isOpenEvents = true;
		}
	}
	
	$scope.toggleLocPics = function(){
		if ($scope.isOpenLocPics == true){
			$scope.isOpenLocPics = false;
		} else {
			$scope.isOpenLocPics = true;
		}
	}
	
	$scope.togglePackage = function(){
		if ($scope.isOpenPackage == true){
			$scope.isOpenPackage = false;
		} else {
			$scope.isOpenPackage = true;
		}
	}
	
	/* Methods for toggle */
	$scope.expandAll = function(){
		$scope.isOpenLocation = true;
		$scope.isOpenLocPics = true;
		$scope.isOpenEvents = true;
		$scope.isOpenPackage = true;
		$scope.isOpenLocGroups = true;
	}
	
	$scope.collapseAll = function(){
		$scope.isOpenLocation = false;
		$scope.isOpenLocPics = false;
		$scope.isOpenEvents = false;
		$scope.isOpenPackage = false;
		$scope.isOpenLocGroups = false;
	}
	
	$scope.toggleLocGroups = function () {
		if ($scope.isOpenLocGroups == true){
			$scope.isOpenLocGroups = false;
		} else {
			$scope.isOpenLocGroups = true;
		}
	}
	
	/* Method to navigate to a provided url */
	$scope.navigate = function (url) {
		window.location.href = url;
	}
	
});
