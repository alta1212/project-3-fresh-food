var app = angular.module('admin', []);

app.controller("listproduct", function ($scope, $http) {
    $http({
        method: 'GET',
        url: '/Admin/getpagepro?page=1&&pagesize=10',
      
    }).then(function successCallback(response) {
        $scope.lisp = response.data;
        console.log(response.data)
        $scope.changeview = function () {
         
            var pageselect = {
                page: 1,
                pagesize: $scope.pagesize
            }
          
            $http({
                method: 'GET',
                url: '/Admin/getpagepro',
                params: pageselect
            }).then(function successCallback(response) {
                $scope.lisp = response.data;
                console.log(response.data)

            })
        }

    })
})
