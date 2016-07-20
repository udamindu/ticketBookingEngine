/*
 * Angular controller for table arrangement selecter
 * Author : ashenkleo@gmail.com
 */

var app = angular.module('TBE', [ 'ui.bootstrap' ]);
app.controller('locationpics', function($scope, $modal, $log) {
	$scope.animationsEnabled = true;
	$scope.locations;
	$scope.arrangements;
	$scope.selectedArrangements = [];
	var modalinstance;
	
	$scope.open = function(size) {

		modalInstance = $modal.open({
			animation : $scope.animationsEnabled,
			templateUrl : 'myModalContent.html',
			controller : 'locationpics',
			size : size,
			resolve : {
				items : function() {
					return $scope.items;
				}
			}
		});

		modalInstance.result.then(function(selectedItem) {
			$scope.selected = selectedItem;
		}, function() {
			$log.info('Modal dismissed at: ' + new Date());
		});
	};

	$scope.toggleAnimation = function() {
		$scope.animationsEnabled = !$scope.animationsEnabled;
	};

	$scope.cancel = function() {
		swal({
			title : "Are you sure?",
			text : "Your unsaved data will be lost",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "Confirm",
			closeOnConfirm : false
		},
				function() {
					modalInstance.dismiss('cancel');
					swal("Done!", "",
							"success");
				});
		
	};

	$scope.ok = function(){
		var error = "";
		if ($scope.name == undefined || $scope.name == null){
			
			//sweetAlert("Oops...", "Something went wrong!", "error");
		}
	};

	console.log($scope.locations);
	
	$scope.selectArrangements = function(){
		$scope.selectedArrangements = [];
		for (i in $scope.arrangements){
			if ($scope.arrangements[i].id == $scope.selectedLocation){
				$scope.selectedArrangements.push($scope.arrangements[i]);
			}
		}
		console.log('Selected Arrangements', $scope.selectedArrangements);
	};
});