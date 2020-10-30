var app = angular.module('project', ['ngCookies']);



app.controller("login", function ($scope, $http,$cookies) {
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
                $cookies.put('taikhoan', $scope.KHACH_HANG.taikhoan);//lưu tên tài khoản và mật khẩu vào cookie để tự động đăng nhập lần sau
                $cookies.put('matkhau', $scope.KHACH_HANG.matkhau);
                window.location = "https://localhost:44389/Index/Index";
            }
            else
                $scope.btntext = "Thông tin đăng nhập không chính xác";
        }, );
    }

})

app.controller("SignUp", function ($scope, $http, $cookies) {
    $scope.btntext = "Đăng ký";
    $scope.register = function () {//được gọi khi bấm nút đăng ký
        document.getElementById("btnsubmit").setAttribute("disable", true);

        var mail = document.getElementById('khmail').value;
        var tk = document.getElementById('khtk').value;
        var mk = document.getElementById('khmk').value;
        console.log(mail);
        if (mail.trim() != "" && tk.trim() != ""&&mk.trim() != "") {
            $scope.btntext = "Vui lòng chờ";
            $scope.btn  =
            {
                "background-color" : "#999"
            }
            $http({
                method: "POST",//method gửi dữ liệu
                url: '/Account/DoRegister',//gọi hàm 
                data: $scope.KHACH_HANG//dữ liệu truyền vào user là tên biến đặt bên input
            }).then(function (bool) {//gọi  khi thành công và lấy giá trị hàm trên trả vê
               
                $cookies.put('taikhoan', $scope.KHACH_HANG.taikhoan);//lưu tên tài khoản và mật khẩu vào cookie để tự động đăng nhập lần sau
                $cookies.put('matkhau', $scope.KHACH_HANG.matkhau);
                $cookies.put('mail', $scope.KHACH_HANG.Email);
                alert("chúng tôi đã gửi mail cho b vui lòng xác nhận");
                window.location = "https://localhost:44389/Account/sent";
               
            });
        }
       
    }

})
app.controller("sender", function ($scope, $http, $cookies) {
    if ($cookies.getObject('taikhoan') == null) {
        //  window.location = "https://localhost:44389/Index/Index";
    }
    else {
        $scope.resend = function () {

        }
    }
})