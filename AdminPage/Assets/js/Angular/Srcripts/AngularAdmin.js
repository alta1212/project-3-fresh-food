var myApp = angular.module('myApp', [])


myApp.controller('managerProduct', function ($scope, $location, $window, $http) {
    $scope.pagesize = 10//khởi tạo giá trị hiển thị ban đầu

    var input = document.getElementById("searchname");
    input.addEventListener("keyup", function (event) {
        if (event.keyCode === 13) {
            $scope.searchname(input.value)
        }
    });

    $http({
        method: 'get',
        url: '/SanPhamAdmin/GetAllProduct?page=1&&size=10'

    })
        .then(function (jsonResults) {
            $scope.getJsonResults = jsonResults.data;
            $scope.changeview = function () {

                var pageselect = {
                    page: 1,
                    size: $scope.pagesize
                }

                $http({
                    method: 'GET',
                    url: '/SanPhamAdmin/GetAllProduct',
                    params: pageselect
                }).then(function successCallback(response) {
                    $scope.getJsonResults = response.data;
                    console.log(response.data)

                })
            }
        }
    )

    $scope.searchname = function (name) {
       
        var pages = {
            page: 1,
            size: $scope.pagesize,
            name:name
        }

        $http({
            method: 'GET',
            url: '/SanPhamAdmin/searchNameProduct',
            params: pages
        }).then(function successCallback(response) {
            $scope.getJsonResults = response.data;
            console.log(response.data)

        })
    }

    }
);
myApp.controller('managerProductType', function ($scope,  $http) {
    $http({
        method: 'get',
        url: '/LoaiSanPham/GetAllProductTypeJS'

    })
        .then(function (jsonResults) {
            $scope.getJsonResults = jsonResults.data;
            console.log($scope.getJsonResults)
        })

}
);




myApp.controller('loginAdmin', function ($scope) {
    $scope.login = function () {
        alert("viết code đăng nhập vào dòng 65 code angular js admin");
    }
})
//Automatic Counter in Table Product

