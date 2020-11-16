var myApp = angular.module('myApp', [])


myApp.controller('managerProduct', function ($scope,$location,$window,$http) {
    $http({
        method: 'get',
        url: '/SanPhamAdmin/GetAllProduct?page=1&&size=10'

    })
        .then(function (jsonResults) {
            $scope.getJsonResults = jsonResults.data;

        })
    
    }
);

//Automatic Counter in Table Product

