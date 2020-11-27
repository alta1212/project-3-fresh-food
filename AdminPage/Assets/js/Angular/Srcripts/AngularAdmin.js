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
            name: name
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
myApp.controller('managerProductType', function ($scope, $http) {
    $http({
        method: 'get',
        url: '/LoaiSanPhamAdmin/GetAllProductTypeJS'

    })
        .then(function (jsonResults) {
            $scope.getJsonResults = jsonResults.data;
            console.log($scope.getJsonResults)
        })
}
);



myApp.controller('loginAdmin', function ($rootScope,$scope, $http, $window) {
    $scope.fail = { "display": "none" }
    $scope.login = function () {

        $http({
            method: "POST", //method gửi dữ liệu
            url: '/Admin/log', //gọi hàm controller/account/Login
            data: $scope.admin
        }).then(function (bool) {
            if (bool.data.length != 0) {
                console.log(bool)
                
                localStorage.setItem("email", $scope.admin.email)
                localStorage.setItem("matkhau", $scope.admin.matkhau)
                $window.location.href = '/Admin/Index';
            }
            else {
                $scope.fail = { "display": "block" }
            }
        });
    }
});

myApp.controller('adminIndex', function ($scope, $http) {//thống kê trên trang chủ admin

    $http({
        method: 'get',
        url: '/Admin/dash'
    }).then(function (callback) {
        console.log(callback.data[0])
        $scope.user = callback.data[0].user;
        $scope.product = callback.data[0].product;
        $scope.order = callback.data[0].order;
        console.log(callback.data[0].user)

    })
})



myApp.controller("accAdminNav", function ($rootScope,$scope, $http, $window) {

    if (localStorage.getItem("email") != null && localStorage.getItem("matkhau") != null) {
        var i4 = {
            email: localStorage.getItem("email"),
            matkhau: localStorage.getItem("matkhau"),
        }
        $http({
            method: "POST",
            url: '/Admin/log',
            data: i4
        }).then(function (call) {
           
            if (call.data.length != 0) {
                localStorage.setItem("hinhanh", call.data[0].hinhanh)
                localStorage.setItem("ten", call.data[0].tennhanvien)
                $scope.anh = localStorage.getItem("hinhanh");
                $scope.ten = localStorage.getItem("ten");
                $scope.role = call.data[0].quyenhan;

                console.log($scope.role)
               
            }
            else {
                localStorage.clear();
                $window.location.href = '/Admin/login';
            }
        })

    }
    else {
        localStorage.clear();
        $window.location.href = '/Admin/login';
    }
    $scope.signout = function () {
        localStorage.clear();
        $window.location.href = '/Admin/login';
    }
})
 myApp.controller('addLsp', function ($scope, $http) {
   
    $scope.addlsp = function () {
        var data = {
            "lsp.MaLoaiSanPham": $scope.mlsp,
            "lsp.TenLoaiSanPham": $scope.tenlsp,
            "lsp.MoTa": $scope.mota
        }
        
        $http({
            method: 'post',
            url: '/Admin/themlsp',
            data: data
        }).then(function (stringNotification)
        {
            if (stringNotification.data == 1)
                toastr.success('Thêm thành công', 'Success Alert', { timeOut: 5000 })
            else
                toastr.error('Thêm thất bại', 'Inconceivable!', { timeOut: 5000 })
        })
    }

})

//thêm sản phẩm
myApp.controller('addPro', function ($scope, $http) {
    $scope.addProduct = function () {
        var data = {
            "sp.MaSanPham": $scope.MaSanPham,
            "sp.tensanpham": $scope.tensanpham,
            "sp.MaLoaiSanPham": $scope.Tenloaisanpham,
            "sp.Hinhanh": $scope.DonViTinh,
            "sp.DonViTinh": $scope.GiaBan,
            "sp.MoTa": $scope.MoTa,
        }
        $http({
            method: 'POST',
            url: '/Admin/themsp',
            data: data
        })

    }
});

//lấy về danh sách order
myApp.controller('managerOrder', function ($scope, $http) {
    $scope.size = 10;
    $http({
        method: 'GET',
        url: '/Admin/getOrder?pagesize='+$scope.size
    }).then(function (res) {
        console.log(res.data)
        $scope.getJsonResults = res.data;
    })
    $scope.changeview = function () {

        $http({
            method: 'GET',
            url: '/Admin/getOrder?pagesize=' + $scope.pagesize
        }).then(function (res) {
            console.log(res.data);
            $scope.getJsonResults = res.data;
        })
    }
    $scope.veri = function () {
        toastr.success('xác nhận dòng 218', 'Success Alert!', { timeOut: 5000 })
    }
    $scope.delete = function () {
        toastr.success('xoá dòng 221', 'Success Alert!', { timeOut: 5000 })
       
    }
}).filter("filterdate", function () {
    var re = /\/Date\(([0-9]*)\)\//;
    return function (x) {
        var m = x.match(re);
        if (m) return new Date(parseInt(m[1]));
        else return null;
    };
});

