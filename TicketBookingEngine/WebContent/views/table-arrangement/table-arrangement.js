/*
 * Author : ashenkleo@gmail.com
 */

var app = angular.module('SVGApp', [ 'ui.bootstrap' ]);
app
		.controller(
				'SVGCtrl',
				function($scope, $modal, $log) {

					$scope.backgroundUrl = 'ABC.jpg';					
					$scope.isDpOpen = false;
					
					$scope.clearAll = function() {
						swal(
								{
									title : "Are you sure?",
									text : "You will not be able to recover this arrangement!",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "Yes, clear it!",
									closeOnConfirm : false
								},
								function() {
									swal(
											"Cleared!",
											"Your table arrangement has been cleared.",
											"success");
									$scope.tableArray = [];
									$scope.$apply();
								});
					};

					$scope.locationDimensions;
					$scope.allBackgrounds = [];
					
					$scope.popTable = function (){
						$scope.tableArray.pop();
					};
					
					$scope.setDefaultBackground = function(){
						swal(
								{
									title : "Are you sure?",
									text : "Blueprint will be removed",
									type : "warning",
									showCancelButton : true,
									confirmButtonColor : "#337ab7",
									confirmButtonText : "Yes, change it!",
									closeOnConfirm : false
								},
								function() {
									swal(
											"Restored!",
											"Background restored!",
											"success");
									$scope.backgroundUrl = 'ABC.jpg';
									$scope.$apply();
								});														
					};
					
					$scope.tableArray = [];
					$scope.tableLength = 50;
					$scope.tableWidth = 50;
					var locationWidth = 500;
					var locationLength;
					var incrementSizeX = $scope.tableWidth + 5;
					var incrementSizeY = $scope.tableLength + 5;
					var xNow = 10;
					var yNow = 10;
					var modalinstance;
					var maxY = 0;

					$scope.changeBackground = function(newBackground) {
						if (newBackground != $scope.backgroundUrl) {
							swal({
								title : "Are you sure?",
								text : "The background will be replaced",
								type : "warning",
								showCancelButton : true,
								confirmButtonColor : "#DD6B55",
								confirmButtonText : "Yes!",
								closeOnConfirm : false
							}, function() {
								swal("Done!",
										"Your background saved successfully!",
										"success");
								$scope.backgroundUrl = newBackground;
								$scope.$apply();
							});
						}
					};

					$scope.addBlueprint = function() {
						var modalInstance;

						modalInstance = $modal.open({
							animation : true,
							templateUrl : 'addImage.html',
							controller : 'NewTableCtrl',
							size : 'sm',
							resolve : {
								items : function() {
									return $scope.tableArray;
								}
							}
						});
					};

					$scope.addTable = function() {
						var modalInstance;

						modalInstance = $modal.open({
							animation : true,
							templateUrl : 'addTable.html',
							controller : 'NewTableCtrl',
							size : 'sm',
							resolve : {
								items : function() {
									return $scope.tableArray;
								}
							}
						});

						modalInstance.result
								.then(
										function(returnItem) {

											if ($scope.tableArray.length > 0) {
												if (locationWidth < $scope.tableArray[$scope.tableArray.length - 1].xPosition
														+ $scope.tableArray[$scope.tableArray.length - 1].xSize
														+ 5 + returnItem.length) {
													xNow = 10;
													yNow = 200;
												} else {
													xNow = $scope.tableArray[$scope.tableArray.length - 1].xPosition
															+ $scope.tableArray[$scope.tableArray.length - 1].xSize
															+ 5;
													yNow = 10;
												}
											} else {
												xNow = 10;
												yNow = 10;
											}

											// xNow += incrementSizeX;
											// yNow = 10;

											$scope.tableArray.push({
												type : 'square',
												xSize : returnItem.length,
												ySize : returnItem.width,
												xPosition : xNow,
												yPosition : yNow,
												covers : returnItem.covers
											});

										}, function() {
											$log.info('Modal dismissed at: '
													+ new Date());
										});
					};

					$scope.addTableRound = function() {
						var modalInstance;

						modalInstance = $modal.open({
							animation : true,
							templateUrl : 'addTable.html',
							controller : 'NewTableCtrlRound',
							size : 'sm',
							resolve : {
								items : function() {
									return $scope.tableArray;
								}
							}
						});

						modalInstance.result
								.then(
										function(returnItem) {

											if ($scope.tableArray.length > 0) {
												if (locationWidth < $scope.tableArray[$scope.tableArray.length - 1].xPosition
														+ $scope.tableArray[$scope.tableArray.length - 1].radius
														+ 5 + returnItem.radius) {
													xNow = 10;
													yNow = 200;
												} else {
													xNow = $scope.tableArray[$scope.tableArray.length - 1].radius
															+ $scope.tableArray[$scope.tableArray.length - 1].radius
															+ 5;
													yNow = 10;
												}
											} else {
												xNow = 10;
												yNow = 10;
											}

											// xNow += incrementSizeX;
											// yNow = 10;

											$scope.tableArray.push({
												type : 'round',
												radius : returnItem.radius,
												xPosition : xNow
														+ returnItem.radius,
												yPosition : yNow
														+ returnItem.radius,
												covers : returnItem.covers
											});
										}, function() {
											$log.info('Modal dismissed at: '
													+ new Date());
										});

					};

					$scope.isTableToolOpened = true;
					$scope.toggleTableTools = function() {
						if ($scope.isTableToolOpened) {
							$scope.isTableToolOpened = false;
						} else {
							$scope.isTableToolOpened = true;
						}
					}

					$scope.isBackgroundToolOpened = true;
					$scope.toggleBackgroundTools = function() {
						if ($scope.isBackgroundToolOpened) {
							$scope.isBackgroundToolOpened = false;
						} else {
							$scope.isBackgroundToolOpened = true;
						}
					}

					$scope.isInfoOpened = true;
					$scope.toggleInfo = function() {
						if ($scope.isInfoOpened) {
							$scope.isInfoOpened = false;
						} else {
							$scope.isInfoOpened = true;
						}
					}

					$scope.open = function() {

						modalInstance = $modal.open({
							animation : true,
							templateUrl : 'myModalContent.html',
							controller : 'ModalInstanceCtrl',
							size : 'sm',
							resolve : {
								items : function() {
									return $scope.tableArray;
								}
							}
						});

						modalInstance.result.then(function(returnItem) {
							$scope.tableArray = returnItem;
						}, function() {
							$log.info('Modal dismissed at: ' + new Date());
						});
					};
				});

app.controller('ModalInstanceCtrl', function($scope, $modalInstance, items) {

	var xNow = 20;
	var yNow = 20;
	var incrementSizeX = 50 + 5;

	$scope.tableList = [ {
		'name' : 'table1',
		'width' : 100,
		'length' : 200
	}, {
		'name' : 'table2',
		'width' : 200,
		'length' : 101
	}, {
		'name' : 'table3',
		'width' : 251,
		'length' : 300
	} ];

	$scope.ok = function() {

		for (i = 0; i < $scope.noOfTables; i++) {
			items.push({
				name : $scope.table.name,
				xPosition : xNow,
				yPosition : yNow,
				length : $scope.table.length,
				width : $scope.table.width,
				type : 'square'
			});
			xNow += incrementSizeX;
			// yNow += 30;
		}
		$modalInstance.close(items);
	};

	$scope.cancel = function() {
		$modalInstance.dismiss('cancel');
	};
});

app
		.controller(
				'NewTableCtrl',
				function($scope, $modalInstance, items) {

					$scope.tableType = 'square';

					$scope.ok = function() {
						var returnObject = {
							'name' : $scope.table.name,
							'length' : $scope.table.length,
							'width' : $scope.table.width,
							'covers' : $scope.coversPerTable
						};

						if (returnObject.covers % 2 != 0) {
							swal(
									{
										title : "Are you sure?",
										text : "According to the standard rectangular shaped tables contain even number of covers. But your input is odd. Would you like to proceed?",
										type : "warning",
										showCancelButton : true,
										confirmButtonClass : "btn-danger",
										confirmButtonText : "Yes, proceed!",
										closeOnConfirm : false
									}, function() {
										swal("Inserted!",
												"Your table has been deleted.",
												"success");
										$modalInstance.close(returnObject);
									});
						} else {
							$modalInstance.close(returnObject);
						}
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				});

app
		.controller(
				'NewTableCtrlRound',
				function($scope, $modalInstance, items) {

					$scope.tableType = 'round';

					// $scope.tableList = $scope.tableListRound;

					$scope.ok = function() {
						var returnObject = {
							'name' : $scope.table.name,
							'radius' : $scope.table.radius,
							'covers' : $scope.coversPerTable
						};

						if (returnObject.covers % 2 != 1) {
							swal(
									{
										title : "Are you sure?",
										text : "According to the standard circular shaped tables contain odd number of covers. But your input is even. Would you like to proceed?",
										type : "warning",
										showCancelButton : true,
										confirmButtonClass : "btn-danger",
										confirmButtonText : "Yes, proceed!",
										closeOnConfirm : false
									}, function() {
										swal("Inserted!",
												"Your table has been deleted.",
												"success");
										$modalInstance.close(returnObject);
									});
						} else {
							$modalInstance.close(returnObject);
						}
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				});

// target elements with the "draggable" class
interact('.draggable').draggable(
		{
			// enable inertial throwing
			inertia : true,
			// keep the element within the area of it's parent
			restrict : {
				restriction : "parent",
				endOnly : true,
				elementRect : {
					top : 0,
					left : 0,
					bottom : 1,
					right : 1
				}
			},

			// call this function on every dragmove event
			onmove : dragMoveListener,
			// call this function on every dragend event
			onend : function(event) {
				var textEl = event.target.querySelector('p');

				textEl
						&& (textEl.textContent = 'moved a distance of '
								+ (Math.sqrt(event.dx * event.dx + event.dy
										* event.dy) | 0) + 'px');
			}
		});

function dragMoveListener(event) {
	var target = event.target,
	// keep the dragged position in the data-x/data-y attributes
	x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx, y = (parseFloat(target
			.getAttribute('data-y')) || 0)
			+ event.dy;

	// translate the element
	target.style.webkitTransform = target.style.transform = 'translate(' + x
			+ 'px, ' + y + 'px)';

	// update the posiion attributes
	target.setAttribute('data-x', x);
	target.setAttribute('data-y', y);
}

// this is used later in the resizing demo
window.dragMoveListener = dragMoveListener;