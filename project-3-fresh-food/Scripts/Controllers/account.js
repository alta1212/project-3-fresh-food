var app = angular.module('project', ['imgurUpload']);

app.controller("login", function ($scope, $http) {

    $scope.btntext = "Đăng Nhập"; //giá trị nút đăng nhập
    $scope.DangNhap = function () { //được gọi khi bấm nút đăng nhập
        $scope.btntext = "Đang Đang Nhập....";
        $http({
            method: "POST", //method gửi dữ liệu
            url: '/Account/DoLogin', //gọi hàm controller/account/Login
            params: $scope.KHACH_HANG //dữ liệu truyền vào user là tên biến đặt bên input
        }).then(function (bool) { //gọi  khi thành công và lấy giá trị hàm trên trả vê
            console.log(bool)
            if (bool.data[0].Active == "2") { //kiểm tra dữ liệu đăng nhập trả về nếu là 2 thì đã hoàn tát đăng ký
                $scope.btntext = "Thành công!";
                //$cookies.put('taikhoan', $scope.KHACH_HANG.taikhoan); //lưu tên tài khoản và mật khẩu vào cookie để tự động đăng nhập lần sau
                //$cookies.put('matkhau', $scope.KHACH_HANG.matkhau);
                localStorage.setItem('taikhoan', $scope.KHACH_HANG.taikhoan);
                localStorage.setItem('matkhau', $scope.KHACH_HANG.matkhau);
                window.location = "https://localhost:44389/Index/Index";
            } else if (bool.data[0].Active == "1") { //nếu là 1 thì chưa điền thông tin cá nhận
                $scope.btntext = "Thành công!";
                //$cookies.put('taikhoan', $scope.KHACH_HANG.taikhoan); //lưu tên tài khoản và mật khẩu vào cookie để tự động đăng nhập lần sau
                //$cookies.put('matkhau', $scope.KHACH_HANG.matkhau);
                localStorage.setItem('taikhoan', $scope.KHACH_HANG.taikhoan);
                localStorage.setItem('matkhau', $scope.KHACH_HANG.matkhau);

                window.location = "https://localhost:44389/Account/FillInfo";
            } else if (bool.data[0].Active == "0") { //nếu là 1 thì chưa điền thông tin cá nhận
                $scope.btntext = "Thành công!";
                //$cookies.put('taikhoan', $scope.KHACH_HANG.taikhoan); //lưu tên tài khoản và mật khẩu vào cookie để tự động đăng nhập lần sau
                //$cookies.put('matkhau', $scope.KHACH_HANG.matkhau);
                localStorage.setItem('taikhoan', $scope.KHACH_HANG.taikhoan);
                localStorage.setItem('matkhau', $scope.KHACH_HANG.matkhau);

                window.location = "https://localhost:44389/Account/sent";
            }
            else //thông tin đăng nhập k đúng
                $scope.btntext = "Thông tin đăng nhập không chính xác";
        });
    }

})

app.controller("SignUp", function ($scope, $http) {

    $scope.tk = $scope.mail = true; //ẩn thông tin trung mail,tk sau này làm hamgf check
    $scope.btntext = "Đăng ký";
    $scope.register = function () { //được gọi khi bấm nút đăng ký


        var mail = document.getElementById('khmail').value;
        var tk = document.getElementById('khtk').value;
        var mk = document.getElementById('khmk').value;

        if (mail.trim() != "" && tk.trim() != "" && mk.trim() != "") {
            $scope.btntext = "Vui lòng chờ";
            $scope.btn = {
                "background-color": "#999",
                "cursor": "wait"
            }
            $scope.reg = true;
            $http({
                method: "POST", //method gửi dữ liệu
                url: '/Account/DoRegister', //gọi hàm 
                data: $scope.KHACH_HANG //dữ liệu truyền vào user là tên biến đặt bên input
            }).then(function () {
                alert("ed");
            });

            localStorage.setItem('taikhoan', $scope.KHACH_HANG.TaiKhoan); //lưu tên tài khoản
            localStorage.setItem('matkhau', $scope.KHACH_HANG.MatKhau); //lưu mật khẩu
            localStorage.setItem('mail', $scope.KHACH_HANG.Email);
            localStorage.setItem('reg', "1"); //kiểm tra trạng thái reg
            window.location = "https://localhost:44389/Account/sent"; //điều hướng về trang send


        }

    }

})

app.controller("sender", function ($scope, $http) {
    if (localStorage.getItem('reg') == null) { //xoá tất cả cookie
        localStorage.clear();
        window.location = "https://localhost:44389/Index/Index";
    } else {
        var data = {
            tk: localStorage.getItem('taikhoan'),
            mail: localStorage.getItem('mail'),
        };
        $scope.resend = function () {
            $http({
                method: "POST", //method gửi dữ liệu
                url: '/Account/resendmail', //gọi hàm controller/account/Login
                data: data //dữ liệu truyền vào user là tên biến đặt bên input
            })
            console.log("đã gửi")
        }

    }
})

app.controller("active", function ($scope) {
    localStorage.removeItem("reg");
    $scope.success = true;
    $scope.go = function () {
        window.location = "https://localhost:44389/Account/FillInfo"
    }
    $scope.init = function (status) {
        if (status == "1") {
            $scope.success = false;
            $scope.fail = true;
        }
        if (status == "0") {
            $scope.success = true;
            $scope.fail = false;
        }
    }
})

app.controller("fillinfo", function ($scope, $http, imgurUpload) {




    var data = {

        "KHACH_HANG.taikhoan": localStorage.getItem('taikhoan'),

        "KHACH_HANG.matkhau": localStorage.getItem('matkhau'),


    };
    $http({
        method: "POST", //method gửi dữ liệu
        url: '/Account/DoLogin', //gọi hàm controller/account/Login
        data: JSON.stringify(data)
    }).then(function (bool) { //gọi  khi thành công và lấy giá trị hàm trên trả vê
        console.log(bool.data.split(",")[0])
        if (bool.data.split(",")[0] == "(2") { //nếu là 2 thì tk đã hoàn tất chuyển về trang chủ
            window.location = "https://localhost:44389/Index/Index";
        } else if (bool.data.split(",")[0] == "(1") { //nếu là 1 thì chưa điền thông tin cá nhận
            $scope.username = localStorage.getItem('taikhoan');
            console.log("đúng tài khoản này rồi chưa điền thông tin");

            $scope.link = "ahi";

            $scope.fill = function () {
                if (document.getElementById('file').files.length == 0) {
                    $scope.noimage = {
                        "color": "red",
                        "display": "block"
                    }
                }

                var image = document.getElementById('file').files[0];

                var clientId = "5c31a53dda3c8e0";
                imgurUpload.setClientId(clientId);
                imgurUpload
                    .upload(image)
                    .then(function (a) {
                        $scope.link = a.data.link
   


                var info = //lưu thông tin khách vào object
                {

                    tentk: localStorage.getItem('taikhoan'),
                    mk: localStorage.getItem('matkhau'),
                    "KHACH_HANG.SoDienThoai": document.getElementById('sdt').value,
                    "KHACH_HANG.DateOfBirth": document.getElementById('date').value,
                    "KHACH_HANG.Sex": document.getElementById('sex').value,
                    "KHACH_HANG.TenKhachHang": document.getElementById('ten').value,
                    "KHACH_HANG.AnhDaiDien": $scope.link,
                    "KHACH_HANG.Adress": document.getElementById('address').value,
                }
                        console.log(info)
                     
                $http({
                    method: 'post',
                    url: '/account/addinfo', //cập nhật i4 khách
                    data: info
                })

                window.location = "https://localhost:44389/Index/Index";
})
            }

        } else {

            localStorage.clear();
            window.location = "https://localhost:44389/Index/Index";



        }
    })
})

app.controller("acccontroller", function ($scope, $http) {
    $scope.lin = true;

    $scope.logout = function () {

        localStorage.clear();
        window.location = "https://localhost:44389/Account/Login";
    }
    if (localStorage.getItem('taikhoan') != "" && localStorage.getItem('matkhau') != "") { //kiểm tra người dùng đã từng đăng nhập chưa nếu rồi thì chuyển sang trang chủ

        var data = {

            taikhoan: localStorage.getItem('taikhoan'),

            matkhau: localStorage.getItem('matkhau'),


        };
        console.log(JSON.stringify(data));
        $http({
            method: "POST", //method gửi dữ liệu
            url: '/Account/DoLogin', //gọi hàm controller/account/Login
            params: data
        }).then(function (bool)
        { //gọi  khi thành công và lấy giá trị hàm trên trả vê
            console.log(bool.data[0])
            if (bool.data[0].Active == "1" && window.location.href != "https://localhost:44389/account/fillinfo")
            {
                $scope.lin = false;
                $scope.out = true;
                window.location = "https://localhost:44389/account/fillinfo";
            }
            else if (bool.data[0].Active == "2" || bool.data[0].Active == "0") { //kiểm tra dữ liệu đăng nhập trả về
                $scope.lin = false;
                $scope.out = true;
                $scope.ten = bool.data[0].TenKhachHang
                if (window.location.href == "https://localhost:44389/Account/Login")
                window.location = "https://localhost:44389/Index/Index";

            }
            else
            {
                $scope.lin = true;
                $scope.out = false;
            }


        });

    }


})
