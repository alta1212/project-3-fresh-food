var myApp = angular.module('myApp', ['imgurUpload']);


// ------------ rootScope-----------
myApp.run(function ($rootScope) {

    $rootScope.link = "";
    $rootScope.manv = "";
});

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
    $scope.deleteProduct = function (e) {
        data = {
            ma: e
        }
        $http.post('/SanPhamAdmin/deleteSp', data)
    }
}
);
myApp.controller('managerProductType', function ($scope, $http) {

    $scope.deleteProductType = function (e) {
            data = {
                key:e
            }
            $http.post('/LoaiSanPhamAdmin/deleteLsp',data)
        }

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
                $rootScope.manv = call.data[0].manhanvien;
                $scope.anh = localStorage.getItem("hinhanh");
                $scope.ten = localStorage.getItem("ten");
                $scope.role = call.data[0].maloainhanvien ;

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
myApp.controller('addPro', function (imgurUpload, $scope, $http, $rootScope) {
    
    $http.get('/LoaiSanPhamAdmin/GetAllProductTypeJS').then(function getListProductCatetory(response) {
        console.log(response.data)
        $scope.ProductCatetory = response.data;
    })
    $scope.addProduct = function () {
        var image = document.getElementById('file').files[0];

        var clientId = "5c31a53dda3c8e0";
        imgurUpload.setClientId(clientId);
        imgurUpload
            .upload(image)
            .then(function (a) {
                $rootScope.link = a.data.link;
            })
        var data = {
            "sp.tensanpham": $scope.tensanpham,
            "sp.MaLoaiSanPham": $scope.Tenloaisanpham,
            "sp.Hinhanh": $rootScope.link,
            "sp.DonViTinh": $scope.DonViTinh,
            "sp.MoTa": $scope.MoTa,
            "sp.GiaBan": $scope.GiaBan,
            "sp.SoLuongNhap": $scope.SoLuongNhap
        }
        debugger
        $http({
            method: 'POST',
            url: '/Admin/themsp',
            data: data
        })
        
    }
  
});

//lấy về danh sách order
myApp.controller('managerOrder', function ($rootScope,$scope, $http) {
    $scope.size = 10;

    getoder($http, $scope.size, $scope)
    $scope.changeview = function () {
        getoder($http, $scope.pagesize, $scope)
    }
    $scope.veri = function (e) {
        var data =
        {
            maorder: e,
            manv: $rootScope.manv
        }
      
        $http.post('/Admin/confirmorder', data).then(function (s) { console.log(s) })
        getoder($http, $scope.size, $scope)
        toastr.success('Xác nhận đơn hàng thành công', 'Success Alert!', { timeOut: 5000 })
    }
    $scope.delete = function () {
        toastr.success('xoá dòng 221', 'Success Alert!', { timeOut: 5000 })
        getoder($http, $scope.pagesize, $scope)
    }
}).filter("filterdate", function () {
    var re = /\/Date\(([0-9]*)\)\//;
    return function (x) {
        var m = x.match(re);
        if (m) return new Date(parseInt(m[1]));
        else return null;
    };
});



myApp.controller('Profile', function ($scope,$http) {
    var i4 = {
        email: localStorage.getItem("email"),
        matkhau: localStorage.getItem("matkhau"),
    }
    $http({
        method: "POST",
        url: '/Admin/log',
        data: i4
    }).then(function (res) {
        $scope.data = res.data[0];

        console.log($scope.data)
    })
}).filter("filterdate", function () {
    var re = /\/Date\(([0-9]*)\)\//;
    return function (x) {
        var m = x.match(re);
        if (m) return new Date(parseInt(m[1]));
        else return null;
    };
});

myApp.controller('addUser', function ($scope, $http) {
    $scope.add = function () {
        var i4 = {
           
        }
    }
})


myApp.controller('editPro', function (imgurUpload, $scope, $http, $rootScope, $location) {
    $http.get('/LoaiSanPhamAdmin/GetAllProductTypeJS').then(function getListProductCatetory(response) {
        console.log(response.data)
        $scope.ProductCatetory = response.data;
    })
    var key = $location.search().masanpham
    $http.get('/SanPhamAdmin/GetProduct?masanpham=' + key).then(function (s) {
        console.log(s)
        $scope.info = s.data[0];
    })
    
    $scope.edit = function () {
        $scope.info;
        $http.post('/SanPhamAdmin/EditProduct_', $scope.info).then(function (s) { console.log(s) })
    }
    }
)


function getoder($http, size, $scope) {
    $http({
        method: 'GET',
        url: '/Admin/getOrder?pagesize=' + size
    }).then(function (res) {
        console.log(res.data);
        $scope.getJsonResults = res.data;
    })
}

// Hiện thị ảnh bằng input file
function ChangeFileImageForProduct(elements) {
    readImgUrlAndPreview(elements);
    function readImgUrlAndPreview(input) {
        if (input.files) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById("loadSource").src = e.target.result;
            }
        };
        reader.readAsDataURL(input.files[0]);
    }
}