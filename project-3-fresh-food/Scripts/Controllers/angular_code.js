var app = angular.module('project', ['imgurUpload']);

// ------------ rootScope-----------
app.run(function ($rootScope) {
    $rootScope.dataKhachHang = "";
    $rootScope.percent = 0;
    $rootScope.khachHang = "";
});
//tài khoản
//đăng  ký
app.controller('dangKy', function ($http, $scope) {
    $scope.tk = $scope.mail = true; //ẩn thông tin trung mail,tk sau này làm hamgf check
    $scope.bnttext = "Đăng ký";
    $scope.sign = function () { //được gọi khi bấm nút đăng ký


        var mail = $scope.KHACH_HANG.Email;
        var tk = $scope.KHACH_HANG.TaiKhoan;
        var mk = $scope.KHACH_HANG.MatKhau;

        if (mail.trim() != "" && tk.trim() != "" && mk.trim() != "") {
            $scope.bnttext = "Vui lòng chờ";
            $scope.btn = {
                "background-color": "#999",
                "cursor": "wait"
            }
            $scope.reg = true;
            $http({
                method: "POST", //method gửi dữ liệu
                url: '/Account/DangKy', //gọi hàm 
                data: $scope.KHACH_HANG //dữ liệu truyền vào user là tên biến đặt bên input
            })

           
            localStorage.setItem('taikhoan', $scope.KHACH_HANG.TaiKhoan); //lưu tên tài khoản
            localStorage.setItem('matkhau', $scope.KHACH_HANG.MatKhau); //lưu mật khẩu
            localStorage.setItem('mail', $scope.KHACH_HANG.Email);


            window.location.href = '/Account/sent';

        }

    }
})

// đăng nhập
app.controller("login", function ($scope, $http, $window) {

    $scope.btntext = "Đăng Nhập"; //giá trị nút đăng nhập
    $scope.DangNhap = function () { //được gọi khi bấm nút đăng nhập
        $scope.btntext = "Đang Đang Nhập....";
        $http({
            method: "POST", //method gửi dữ liệu
            url: '/Account/DoLogin', //gọi hàm controller/account/Login
            data: $scope.KHACH_HANG //dữ liệu truyền vào user là tên biến đặt bên input
        }).then(function (bool) { //gọi  khi thành công và lấy giá trị hàm trên trả vê
            console.log(bool)
            try {
                if (bool.data[0].Active == "2") { //kiểm tra dữ liệu đăng nhập trả về nếu là 2 thì đã hoàn tát đăng ký
                    $scope.btntext = "Thành công!";
                    //$cookies.put('taikhoan', $scope.KHACH_HANG.taikhoan); //lưu tên tài khoản và mật khẩu vào cookie để tự động đăng nhập lần sau
                    //$cookies.put('matkhau', $scope.KHACH_HANG.matkhau);
                    localStorage.setItem('taikhoan', $scope.KHACH_HANG.taikhoan);
                    localStorage.setItem('matkhau', $scope.KHACH_HANG.matkhau);
                    $window.location.href = '/Index/Index';
                } else if (bool.data[0].Active == "1") { //nếu là 1 thì chưa điền thông tin cá nhận
                    $scope.btntext = "Thành công!";
                    //$cookies.put('taikhoan', $scope.KHACH_HANG.taikhoan); //lưu tên tài khoản và mật khẩu vào cookie để tự động đăng nhập lần sau
                    //$cookies.put('matkhau', $scope.KHACH_HANG.matkhau);
                    localStorage.setItem('taikhoan', $scope.KHACH_HANG.taikhoan);
                    localStorage.setItem('matkhau', $scope.KHACH_HANG.matkhau);

                    $window.location.href = '/Account/FillInfo';
                } else if (bool.data[0].Active == "0") { //nếu là 0 thì chưa xác nhận
                    $scope.btntext = "Thành công!";
                    //$cookies.put('taikhoan', $scope.KHACH_HANG.taikhoan); //lưu tên tài khoản và mật khẩu vào cookie để tự động đăng nhập lần sau
                    //$cookies.put('matkhau', $scope.KHACH_HANG.matkhau);
                    localStorage.setItem('taikhoan', $scope.KHACH_HANG.taikhoan);
                    localStorage.setItem('matkhau', $scope.KHACH_HANG.matkhau);

                    $window.location.href = '/Account/sent';
                }
            }
            catch {
                $scope.btntext = "Thông tin đăng nhập không chính xác";
            }

        });
    }

})


// chập nhận mail để tạo tài khoản
app.controller("sender", function ($scope, $http, $window) {

        var data = {
            tk: localStorage.getItem('taikhoan'),
            mail: localStorage.getItem('mail'),
        };
    $scope.resend = function () {
        window.location.reload();
        }

    
})

// Tài khoản cần active để đăng nhập
app.controller("active", function ($scope, $window) {

    $scope.success = true;
    $scope.go = function () {
        $window.location.href = '/Account/FillInfo'
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

// Hiện thị thông tin của tài khoản
app.controller("fillinfo", function ($window, $scope, $http, imgurUpload) {

    var data = {

        taikhoan: localStorage.getItem('taikhoan'),

        matkhau: localStorage.getItem('matkhau'),


    };
    $http({
        mmethod: "POST", //method gửi dữ liệu
        url: '/Account/DoLogin', //gọi hàm controller/account/Login
        params: data
    }).then(function (bool) { //gọi  khi thành công và lấy giá trị hàm trên trả vê
        console.log(bool.data)
        console.log(bool.data[0])
        if (bool.data[0].Active == "2") { //nếu là 2 thì tk đã hoàn tất chuyển về trang chủ
            $window.location.href = '/Index/Index';
        } else if (bool.data[0].Active == "1") { //nếu là 1 thì chưa điền thông tin cá nhận
            $scope.username = localStorage.getItem('taikhoan');
            console.log("đúng tài khoản này rồi chưa điền thông tin");

            $scope.link = "placeholder";

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


                        $window.location.href = '/Index/Index';
                    })
            }

        } else {

            localStorage.clear();
            $window.location.href = '/Index/Index';



        }
    })
})

// Tài khoản
app.controller("acccontroller", function ($window, $scope,$rootScope, $http) {
    $scope.lin = true;

    $scope.logout = function () {

        localStorage.clear();
        $window.location.href = '/Account/Login';
    }

    if (localStorage.getItem('taikhoan') != null && localStorage.getItem('matkhau') != null) { //kiểm tra người dùng đã từng đăng nhập chưa nếu rồi thì chuyển sang trang chủ

        var data = {

            taikhoan: localStorage.getItem('taikhoan'),

            matkhau: localStorage.getItem('matkhau'),


        };
        console.log(JSON.stringify(data));

        $http({
            method: "POST", //method gửi dữ liệu
            url: '/Account/DoLogin', //gọi hàm controller/account/Login
            params: data
        }).then(function (bool) { //gọi  khi thành công và lấy giá trị hàm trên trả vê
            console.log($window.location)
            console.log(bool.data[0])
            $rootScope.khachHang = bool.data[0];
            if (bool.data[0].Active == "1" && $window.location.pathname != "/account/fillinfo") {
                $scope.lin = false;
                $scope.out = true;
                $window.location.href = '/account/fillinfo';
                
            }
            else if (bool.data[0].Active == "2" || bool.data[0].Active == "0") { //kiểm tra dữ liệu đăng nhập trả về
                $scope.lin = false;
                $scope.out = true;
                $scope.ten = bool.data[0].TenKhachHang
                $scope.anhdaidien = bool.data[0].AnhDaiDien;
                if ($window.location.pathname == "/Account/Login")
                    $window.location.href = '/Index/Index';

            }
            else {
                $scope.lin = true;
                $scope.out = false;
            }
            $rootScope.$broadcast('dataKhachHang', bool.data[0]);

        });

    }


})


//seach bar
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

//Hiện thị sản phẩm ngẫu nhiễn của cửa hàng
app.controller("featuredproducts", function ($scope, $http, $location) {
    $http({
        method: 'GET',
        url: '/Index/spHighlights',
    }).then(function successCallback(response) {
        $scope.featuredpro = response.data;
        console.log($scope.featuredpro);
        console.log(response.data[0]);
    })
    $scope.AddToCart = function (msp, giaban) {
        var chiTietGioHang = {
            maKhachHang: localStorage.getItem("taikhoan"),
            maSanPham: msp,
            soLuong: 1,
            donGia:giaban }
        $http({
            method: 'POST',
            url: '/guestEvent/AddToCart',
            data: chiTietGioHang
        }).then(function successCallback(response) {
            console.log(response);
        })
    }
})

// Hiển thị sản phẩm bấn chạy
app.controller("getBestSellProduct", function ($scope, $http) {
    $http({
        method: 'GET',
        url: '/Index/getBestSell',
    }).then(function successCallback(response) {
        $scope.bestSellProduct = response.data;
        console.log($scope.bestSellProduct);
        console.log(response.data[0]);

    })
    $scope.AddToCart = function (msp, giaban) {
        var chiTietGioHang = {
            maKhachHang: localStorage.getItem("taikhoan"),
            maSanPham: msp,
            soLuong: 1,
            donGia: giaban
        }
        $http({
            method: 'POST',
            url: '/guestEvent/AddToCart',
            data: chiTietGioHang
        }).then(function successCallback(response) {
            console.log(response);
        })
    }
})
// Hiện thị sản phẩm được giảm giá
app.controller("getProductDiscount", function ($scope, $http) {
    $http({
        method: 'GET',
        url: '/Product/GetProductDiscount'
    }).then(function successCallback(response) {
        $scope.GetProductDiscount = response.data;
        console.log($scope.bestSellProduct);
        console.log(response.data[0]);
    })
    $scope.AddToCart = function (msp, giaban) {
        var chiTietGioHang = {
            maKhachHang: localStorage.getItem("taikhoan"),
            maSanPham: msp,
            soLuong: 1,
            donGia: giaban
        }
        $http({
            method: 'POST',
            url: '/guestEvent/AddToCart',
            data: chiTietGioHang
        }).then(function successCallback(response) {
            console.log(response);
        })
    }
})
// Hiện thị menu trái của cửa hàng
app.controller("navmenu", function ($scope, $http, $window) {
    $http({
        method: 'GET',
        url: '/Index/getLsP',
    }).then(function successCallback(response) {
        $scope.lsp = response.data;
        console.log(response.data)

    })
    $scope.getheoloai = function (maloai) {


        $window.location.href = '/Product/Shop#!?maloai=' + maloai;
    }
})
//hiển thị sản phẩm ra trang sản phẩm
app.controller("shop", function ($scope, $location, $http) {



    $scope.show = 20;


    if ($location.search().maloai == null) {

        $http({
            method: 'GET',
            url: '/Product/getslsp?maloai= ',

        }).then(function successCallback(response) {
            $scope.sl = response.data;
        })//lấy về sl sản phẩm

        $http({
            method: 'GET',
            url: '/Product/getpagesp?pagesize=' + $scope.show + '&&page=1',

        }).then(function successCallback(response) {
            $scope.lisp = response.data;
            console.log(response.data)

        })
        $scope.showmore = function () {

            $scope.show += 20
            if ($scope.show >= $scope.sl) {
                $scope.show = $scope.sl;
                $scope.loadpage = {
                    "display": "none"
                }
            }

            $http({
                method: 'GET',
                url: '/Product/getpagesp?pagesize=' + $scope.show,

            }).then(function successCallback(response) {
                $scope.lisp = response.data;
                console.log(response.data)
            })
        }


    }
    else {
        $http({
            method: 'GET',
            url: '/Product/getslsp?maloai=' + $location.search().maloai,

        }).then(function successCallback(response) {
            $scope.sl = response.data;
            if ($scope.show >= $scope.sl) {
                $scope.show = $scope.sl;
                $scope.loadpage = {
                    "display": "none"
                }
            }
        })//lấy về sl sản phẩm


        $http({
            method: 'GET',
            url: '/Product/getbyloai?maloai=' + $location.search().maloai + '&&page=' + $scope.show,
            //   params=$location.search().maloai

        }).then(function successCallback(response) {
            $scope.lisp = response.data;
            console.log($scope.lisp)
        })
        $scope.showmore = function () {

            $scope.show += 20
            if ($scope.show >= $scope.sl) {
                $scope.show = $scope.sl;
                $scope.loadpage = {
                    "display": "none"
                }
            }

            $http({
                method: 'GET',
                url: '/Product/getbyloai?maloai=' + $location.search().maloai + '&&page=' + $scope.show,

            }).then(function successCallback(response) {
                $scope.lisp = response.data;
                console.log(response.data)
            })
        }

    }
    $scope.AddToCart = function (msp, giaban) {
        var chiTietGioHang = {
            maKhachHang: localStorage.getItem("taikhoan"),
            maSanPham: msp,
            soLuong: 1,
            donGia: giaban
        }
        $http({
            method: 'POST',
            url: '/guestEvent/AddToCart',
            data: chiTietGioHang
        }).then(function successCallback(response) {
            console.log(response);
        })
    }

})



//sự kiện thực hiển ở quickview 
app.controller("quickviewbuy", function ($scope, $location, $http) {
    $scope.details = function (elm) {
        alert("viết code truyền vào giỏ hàng ở dòng 430")
    }
})

app.controller("productdetails", function ($rootScope,$scope, $location, $http, $window) {
    var masanpham = $location.search().masanpham;
    if (masanpham != null) {

        $http({
            method: 'GET',
            url: '/Product/getsanpham?masanpham=' + masanpham,

        }).then(function successCallback(response) {
            $scope.i4 = response.data[0];
            console.log($scope.i4)
        })//lấy về i4 sản phẩm
        $scope.AddToCart = function (msp, giaban, soluong) {
            if (soluong == null)
                soluong = 1;
            var chiTietGioHang = {
                maKhachHang: localStorage.getItem("taikhoan"),
                maSanPham: msp,
                soLuong: soluong,
                donGia: giaban
            }
            $http({
                method: 'POST',
                url: '/guestEvent/AddToCart',
                data: chiTietGioHang
            }).then(function successCallback(response) {
                console.log(response);
            })
        }
        $http({
            method: 'GET',
            url: '/Product/getFb?masanpham=' + masanpham,
        }).then(function successCallback(response) {
            $scope.fb = response.data;
            console.log($scope.fb)
            try {
                $rootScope.SoLuong = $scope.fb[0].SoLuong;
            }
            catch { $rootScope.SoLuong = 0}
        })
    }
    else {
        $window.location.href = '/Index/Index';
    }
    $scope.postcoment = function () {
        
        if (document.getElementById('customFile').files.length != 0) {
            var image = document.getElementById('file').files[0];

            var clientId = "5c31a53dda3c8e0";
            imgurUpload.setClientId(clientId);
            imgurUpload
                .upload(image)
                .then(function (a) {
                    $rootScope.link = a.data.link;
            })

        }
        else
            $rootScope.link = '';
        if (localStorage.getItem("taikhoan") == null)
            toastr.info('Vui lòng đăng nhập để bình luận', 'Information', { timeOut: 5000 })
        else {
            var data = {
                masp: masanpham,
                mkh: localStorage.getItem("taikhoan"),
                binhluan: $scope.binhluan,
                stars: 5
            }

            $http({
                method: 'POST',
                url: '/guestEvent/postComment',
                data: data
            }).then(function () {
       
                document.getElementById("formcmt").reset();
                toastr.success('thêm bình luận thành công', 'Success Alert', { timeOut: 5000 });
               
            })
        }
       
    }
}).filter("filterdate", function () {
    var re = /\/Date\(([0-9]*)\)\//;
    return function (x) {
        var m = x.match(re);
        if (m) return new Date(parseInt(m[1]));
        else return null;
    };
});




app.controller('CartInHeader', function ($rootScope, $scope, $http) {
    var scopeAcount = angular.element(document.getElementById("accountcontroller")).scope().$root;
    $rootScope.$on('dataKhachHang', function (event, data) {
        console.log(data.MaGioHang)
        $http({
            method: 'get',
            url: '/Product/GetAllProductInCart?maKhachHang=' + data.MaGioHang,
        }).then(function successGetAll(response) {
            $scope.listInCart = response.data;
            console.log(response.data)
            $scope.getTotal = function () {
                var total = 0;
                for (var i = 0; i < response.data.length; i++) {
                    var giaBan = response.data[i].GiaBan;
                    var giaGiam = response.data[i].GiaGiam;
                    var soLuong = response.data[i].SoLuong;
                    if (giaGiam > 0) {
                        total += giaGiam * soLuong;
                    }
                    else {
                        total += giaBan * soLuong;
                    }
                }
                return total;
            }});
        
    });
})
app.controller('CartInDetail', function ($scope,$rootScope, $http) {
    
    var scopeAcount = angular.element(document.getElementById("accountcontroller")).scope().$root;
    $rootScope.$on('dataKhachHang', function (event, data) {
        console.log(data.MaGioHang)
        $http({
            method: 'get',
            url: '/Product/GetAllProductInCart?maKhachHang=' + data.MaGioHang,
        }).then(function successGetAll(response) {
            $scope.listInCart = response.data;
            console.log(response.data)
           
            $scope.getTotal = function () {
                var total = 0;
                for (var i = 0; i < response.data.length; i++) {
                    var giaBan = response.data[i].GiaBan;
                    var giaGiam = response.data[i].GiaGiam;
                    var soLuong = response.data[i].SoLuong;
                    if (giaGiam > 0) {
                        total += giaGiam * soLuong;
                    }
                    else {
                        total += giaBan * soLuong;
                    }
                }
                return total;
            }
            $http.get('/Product/getchietkhau').then(function (listDiscount) {
               
                for (var i = 0; i < listDiscount.data.length; i++) {
                    if ($scope.getTotal() < listDiscount.data[i].TienToiDa && $scope.getTotal() > listDiscount.data[i].TienToiTieu) {
                        $rootScope.percent = listDiscount.data[i].PhanTram;
                    }
                }
                if ($scope.getTotal() >= listDiscount.data[listDiscount.data.length - 1].TienToiDa) {
                    $rootScope.percent = listDiscount.data[listDiscount.data.length - 1].PhanTram;
                }
                    
           
            })
           
        });

    });
    $rootScope.$on('percent', function (event, data) {
        $scope.percent = 0;
       })
        
})
app.controller('CartInTotal', function ($scope, $rootScope, $http) {
    var scopeAcount = angular.element(document.getElementById("accountcontroller")).scope().$root;
    $rootScope.$on('dataKhachHang', function (event, data) {
        console.log(data.MaGioHang)
        $http({
            method: 'get',
            url: '/Product/GetAllProductInCart?maKhachHang=' + data.MaGioHang,
        }).then(function successGetAll(response) {
            $scope.listInCart = response.data;
            console.log(response.data)
            $scope.getTotal = function () {
                var total = 0;
                for (var i = 0; i < response.data.length; i++) {
                    var giaBan = response.data[i].GiaBan;
                    var giaGiam = response.data[i].GiaGiam;
                    var soLuong = response.data[i].SoLuong;
                    if (giaGiam > 0) {
                        total += giaGiam * soLuong;
                    }
                    else {
                        total += giaBan * soLuong;
                    }
                }
                return total;
            }
        });

    });
})

app.controller('CheckOut', function ($scope, $rootScope, $http) {
    var scopeAcount = angular.element(document.getElementById("accountcontroller")).scope().$root;
    $rootScope.$on('dataKhachHang', function (event, data) {
        console.log(data.MaGioHang)
        $scope.infoCustormer = data;
        console.log($scope.infoCustormer)
        $http({
            method: 'get',
            url: '/Product/GetAllProductInCart?maKhachHang=' + data.MaGioHang,
        }).then(function successGetAll(response) {
            $scope.listInCart = response.data;
            console.log(response.data)

            $scope.getTotal = function () {
                var total = 0;
                for (var i = 0; i < response.data.length; i++) {
                    var giaBan = response.data[i].GiaBan;
                    var giaGiam = response.data[i].GiaGiam;
                    var soLuong = response.data[i].SoLuong;
                    if (giaGiam > 0) {
                        total += giaGiam * soLuong;
                    }
                    else {
                        total += giaBan * soLuong;
                    }
                }
                return total;
            }
            $http.get('/Product/getchietkhau').then(function (listDiscount) {

                for (var i = 0; i < listDiscount.data.length; i++) {
                    if ($scope.getTotal() < listDiscount.data[i].TienToiDa && $scope.getTotal() > listDiscount.data[i].TienToiTieu) {
                        $rootScope.percent = listDiscount.data[i].PhanTram;
                    }
                }
                if ($scope.getTotal() >= listDiscount.data[listDiscount.data.length - 1].TienToiDa) {
                    $rootScope.percent = listDiscount.data[listDiscount.data.length - 1].PhanTram;
                }


            })
            

        });

    });
    $rootScope.$on('percent', function (event, data) {
        $scope.percent = 0;
    })
})


app.controller('daylyDeal', function ($scope, $http) {
    $http({
        method: 'get',
        url: '/Index/dayly'

    }).then(function (jsonResults) {
        $scope.getJsonResults = jsonResults.data;
        console.log($scope.getJsonResults)
    })
}).filter("filterdate", function () {
    var re = /\/Date\(([0-9]*)\)\//;
    return function (x) {
        var m = x.match(re);
        if (m) return new Date(parseInt(m[1]));
        else return null;
    };
});