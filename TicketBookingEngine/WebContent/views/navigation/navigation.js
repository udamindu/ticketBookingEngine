/**
 * The main controller for navigation
 * Author : ashenkleo@gmail.com
 */

app.controller('SearchCtrl', function($scope) {
	$scope.searchKeyword = "";
	$scope.search = function(){
		console.log('lol',$scope.searchKeyword);
	}
});