var login = angular.module('accountLogin', []);
var signup = angular.module('accountSignup', []);


login.controller("login", function ($scope, $http) {
    $scope.btntext = "Đăng Nhập";//giá trị nút đăng nhập
    $scope.DangNhap = function () {//được gọi khi bấm nút đăng nhập
        $scope.btntext = "Đang Đang Nhập....";
        $http({
            method: "POST",//method gửi dữ liệu
            url: '/Account/DoLogin',//gọi hàm controller/account/Login
            data: $scope.KHACH_HANG//dữ liệu truyền vào user là tên biến đặt bên input
        }).then(function (bool) {//gọi  khi thành công và lấy giá trị hàm trên trả vê
            console.log(bool.data)
            if (bool.data == "True") {//kiểm tra dữ liệu đăng nhập trả về
                $scope.btntext = "Thành công!";
            }
            else
                $scope.btntext = "Thông tin đăng nhập không chính xác";
        }, );
    }

})

signup.controller("SignUp", function ($scope, $http, $window) {
   
    $scope.register = function () {//được gọi khi bấm nút đăng ký
       
        $http({
            method: "POST",//method gửi dữ liệu
            url: '/Account/DoRegister',//gọi hàm 
            data: $scope.KHACH_HANG//dữ liệu truyền vào user là tên biến đặt bên input
        }).then(function (bool) {//gọi  khi thành công và lấy giá trị hàm trên trả vê
            console.log(bool.data)
           
            alert("chúng tôi đã gửi mail cho b vui lòng xác nhận");

               
        });
    }

})
