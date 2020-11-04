var app = angular.module('project', []);

app.controller("seach", function ($scope, $http) {
    $http({
        method: 'GET',
        url: '/Index/getLsP',
    }).then(function successCallback(response) {
        $scope.lsp = response.data;
        console.log($scope.lsp);
        console.log(response.data[0].TenLoaiSanPham);
    })
})