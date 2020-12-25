var myApp = angular.module('myApp', ['imgurUpload', 'ngAnimate']);


// ------------ rootScope-----------
myApp.run(function ($rootScope) {

    $rootScope.link = "";
    $rootScope.manv = "";
    $rootScope.data = {}
});

myApp.controller('managerProduct', function ($scope, $location, $window, $http) {
    $scope.pagesize = 10//khởi tạo giá trị hiển thị ban đầu
    // Tạo mảng lưu các sản phẩm để phân trang
    $scope.list = [];
    $http.get('/Admin/dash').then(function (s) {
        console.log(s)
        $http({
            method: 'get',
            url: '/SanPhamAdmin/GetAllProduct?page=1&&size=10' // lấy về 10 sản phẩm đầu tiên
        })
            .then(function (jsonResults) {
                var quotient = s.data[0].product / $scope.pagesize;
                if (quotient % 10 !== 0) {
                    quotient += 1;
                }
                for (var i = 1; i <= quotient; i++) {
                    $scope.list.push(i);
                    console.log($scope.list[i - 1])
                }
                $scope.getJsonResults = jsonResults.data;
                $scope.count = 1;
                var changeStyle = 1;
                $scope.changePage = function (a) {
                    document.getElementById('work').style.display = "block"
                    $http.get('/SanPhamAdmin/GetAllProduct?page='+a+'&&size=10').then(function (get) {
                        $scope.getJsonResults = get.data;
                        document.getElementById('work').style.display = "none"
                    })
                    $scope.count = a;
                    changeStyle = a - 1;
                }
            }
            )
    })
    var input = document.getElementById("searchname");
    input.addEventListener("keyup", function (event) {
        if (event.keyCode === 13) {
            $scope.searchname(input.value)
        }
    });

    

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
    $scope.list = [];

    $http.get('/Admin/dash').then(function (s) {
        console.log(s)

        var quotient = s.data[0].loaisanpham / 10;
        if (quotient % 10 !== 0) {
            quotient += 1;
        }
        for (var i = 1; i <= quotient; i++) {
            $scope.list.push(i);
            console.log($scope.list[i - 1])
        }

        $scope.count = 1;

        $scope.changePage = function (a) {
            document.getElementById('work').style.display = "block"
            $http({
                method: 'get',
                url: '/LoaiSanPhamAdmin/GetAllProductTypeJS?page='+a+'&&size=10'

            }).then(function (jsonResults) {
                $scope.getJsonResults = jsonResults.data;
                console.log($scope.getJsonResults)
                document.getElementById('work').style.display = "none"
            })
            $scope.count = a;

        }
    })
    $scope.deleteProductType = function (e) {
        data = {
            key: e
        }
        $http.post('/LoaiSanPhamAdmin/deleteLsp', data)
    }

    $http({
        method: 'get',
        url: '/LoaiSanPhamAdmin/GetAllProductTypeJS?page=1'

    }).then(function (jsonResults) {
            $scope.getJsonResults = jsonResults.data;
            console.log($scope.getJsonResults)
    })
}
);



myApp.controller('loginAdmin', function ($location, $scope, $http, $window) {
    var next = $location.search().next;
    console.log(next)
    $scope.login = function () {

        $http({
            method: "POST", //method gửi dữ liệu
            url: '/Admin/log', //gọi hàm controller/account/Login
            data: $scope.nv
        }).then(function (bool) {
            if (bool.data.length != 0) {
                console.log(bool)

                localStorage.setItem("email", $scope.nv.email)
                localStorage.setItem("matkhau", $scope.nv.matkhau)
                toastr.success('Đăng nhập thành công', 'Thành công!', { timeOut: 5000 })
                if (next === undefined)
                    $window.location.href = '/Admin/Index';
                else
                    $window.location.href = next;
            }
            else {
                toastr.error('Thông tin đăng nhập không chính xác', 'Lỗi!!', { timeOut: 5000 })
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



myApp.controller("accAdminNav", function ($rootScope, $scope, $http, $window) {

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
                $scope.role = call.data[0].maloainhanvien;
                console.log($rootScope.manv)
            }
            else {

                localStorage.clear();
                $window.location.href = '/Admin/login#!?next=' + window.location.href;
            }
        })

    }
    else {
        localStorage.clear();
        $window.location.href = '/Admin/login#!?next=' + window.location.href;
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
        }).then(function (stringNotification) {
            if (stringNotification.data == 1)
                toastr.success('Thêm thành công', 'Thành công!', { timeOut: 5000 })
            else
                toastr.error('Thêm thất bại', 'Lỗi!!', { timeOut: 5000 })
        })
    }

})

//thêm sản phẩm
myApp.controller('addPro', function (imgurUpload, $scope, $http, $rootScope) {

    $http.get('/LoaiSanPhamAdmin/GetAllProductTypeJS?page=1').then(function getListProductCatetory(response) {
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
                var data = {
                    "sp.tensanpham": $scope.tensanpham,
                    "sp.MaLoaiSanPham": $scope.Tenloaisanpham,
                    "sp.Hinhanh": $rootScope.link,
                    "sp.DonViTinh": $scope.DonViTinh,
                    "sp.MoTa": $scope.MoTa,
                    "sp.GiaBan": $scope.GiaBan,
                    "sp.SoLuongNhap": $scope.SoLuongNhap
                }

                $http({
                    method: 'POST',
                    url: '/Admin/themsp',
                    data: data
                }).then(function () {
                    toastr.success('Thêm sản phẩm thành công', 'Thành công!', { timeOut: 5000 }), function () { toastr.error('Có lỗi xảy ra vui long thử lại', 'Lỗi!!', { timeOut: 5000 }) }
                    document.getElementById("addsp").reset()
                    document.getElementById("loadSource").src = ""
                })
            })

    }

});

//lấy về order chi tiết
myApp.controller('orderDetail', function ($scope, $http, $location) {
    var key = $location.search().madonhang
     
        $http.get('/Admin/getOrderDetails?maHoaDon='+ key).then(function (s) {
            $scope.getJsonResults = s.data;
        }).then(function () {
            tongtien = 0;
            $scope.total = function () {
                for (var i = 0; i < getJsonResults.data.length; i++) {
                    tongtien += getJsonResults.data.thanhTien[i];
                }
                return tongtien;
            }
        })
  

}).filter("filterdate", function () {
    var re = /\/Date\(([0-9]*)\)\//;
    return function (x) {
        var m = x.match(re);
        if (m) return new Date(parseInt(m[1]));
        else return null;
    };
});
//lấy về danh sách order
myApp.controller('managerOrder', function ($rootScope, $scope, $http) {
    $scope.list = [];
   
    $http.get('/Admin/dash').then(function (s) {
        console.log(s)
       
                var quotient = s.data[0].order / 10;
                if (quotient % 10 !== 0) {
                    quotient += 1;
                }
                for (var i = 1; i <= quotient; i++) {
                    $scope.list.push(i);
                    console.log($scope.list[i - 1])
                }
              
                $scope.count = 1;
               
                $scope.changePage = function (a) {
                   
                    getoder($http, a, $scope)
                    $scope.count = a;
                   
                }
    })
    getoder($http, 1, $scope)
   
    $scope.ViewOrderdetail = function (e) {
        window.open(e, '', 'width=1000,height=800');
    }
    $scope.veri = function (e) {
        var data =
        {
            maorder: e,
            manv: $rootScope.manv
        }

        $http.post('/Admin/confirmorder', data).then(function (s) { console.log(s) })
        getoder($http, 1, $scope)
        toastr.success('Xác nhận đơn hàng thành công', 'Thành công!!', { timeOut: 5000 })
    }
    $scope.delete = function () {
        toastr.success('xoá dòng 284', 'Thành công!!', { timeOut: 5000 })
        getoder($http, 1, $scope)
    }
}).filter("filterdate", function () {
    var re = /\/Date\(([0-9]*)\)\//;
    return function (x) {
        var m = x.match(re);
        if (m) return new Date(parseInt(m[1]));
        else return null;
    };
});



myApp.controller('Profile', function ($scope, $rootScope, $http) {
    var i4 = {
        email: localStorage.getItem("email"),
        matkhau: localStorage.getItem("matkhau"),
    }
    $http({
        method: "POST",
        url: '/Admin/log',
        data: i4
    }).then(function (res) {
        $rootScope.data = res.data[0];

        console.log($rootScope.data)
    })
}).filter("filterdate", function () {
    var re = /\/Date\(([0-9]*)\)\//;
    return function (x) {
        var m = x.match(re);
        if (m) return new Date(parseInt(m[1]));
        else return null;
    };
});
myApp.controller('getListUser', function ($rootScope, $scope, $http, imgurUpload) {
    $scope.pagesize = 10;
    $scope.list = [];
    $http.get('/Admin/dash').then(function (data) {
        // Lấy về danh sách số lượng về khách hàng, user, sản phẩm, đơn hàng
        console.log(data);
        $http.get('/Admin/GetListUser?page=1&&pagesize=10').then(function (listUser) {
            // Lấy về 10 user đầu tiên truyền vào biến UserInfo
            $scope.UserInfo = listUser.data;
            console.log(listUser.data);
            // Lấy số lượng trang cần chia
            var quotient = data.data[0].admin / $scope.pagesize; 
            if (quotient % 10 !== 0) {
                quotient += 1;
            }
            for (var i = 1; i <= quotient; i++) {
                $scope.list.push(i);
            }
            $scope.count = 1;
            var changeStyle = 1;
            $scope.changePage = function (a) {
                document.getElementById('work').style.display = "block"
                $http.get('/Admin/GetListUser?page=' + a + '&&pagesize=10').then(function (getlistUser) {
                    $scope.UserInfo = getlistUser.data;
                    document.getElementById('work').style.display = "none"
                })
                $scope.count = a;
                changeStyle = a - 1;
            }
        })
    })
    $scope.DeleteUser = function (e) {
        var answer = window.confirm("Xóa nhân viên ra cửa hàng");
        if (answer) {
            var data = {
                "manhanvien": e
            }
            $http.post("/Admin/DeleteUser", data).then(function () {
                toastr.success('Xoá thông tin thành công', 'Thành công!', { timeOut: 5000 })
                $http.get('/Admin/GetListUser?pagesize=10').then(function (e) {
                    $scope.UserInfo = e.data;
                    console.log(e.data);
                })
            })
        }
        else {
            //some code
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

myApp.controller('UpdateProfileUser', function ($scope, $http, $location, $filter,imgurUpload) {
    var maNhanVien = $location.search().manhanvien;
    
    $http.get('/Admin/GetInfoUserByID?maNhanVien=' + maNhanVien).then(function (e) {
        $scope.UserInfo = e.data[0];
        $scope.UserInfo.manhanvien = maNhanVien;
        console.log(e.data);
        console.log($scope.UserInfo);
        $scope.UserInfo.ngaysinh = new Date(ConvertDate($filter('filterdate')($scope.UserInfo.ngaysinh, 'dd/mm/yyyy')))
    })
    $http.get('/Admin/getAdminType').then(function (e) {
        $scope.AdminType = e.data;
    })
    $scope.update = function () {
        var image = document.getElementById('file').files;
        if (image.length !== 0) {
            var clientId = "5c31a53dda3c8e0";
            imgurUpload.setClientId(clientId);
            imgurUpload
                .upload(image[0])
                .then(function (a) {
                    $scope.UserInfo.hinhanh = a.data.link
                    $http.post('/Admin/UpdateProfileUserVoid', $scope.UserInfo).then(
                        function () {
                            toastr.success('Sửa thông tin thành công', 'Thành công!', { timeOut: 5000 })
                        },
                        function () {
                            toastr.error('Sửa thông tin thất bại vui lòng điền đẩy đủ thông tin', 'Lỗi', { timeOut: 5000 })

                        })
                }
                )
        }
        else {
            $http.post('/Admin/UpdateProfileUserVoid', $scope.UserInfo).then(
                function () {
                    toastr.success('Sửa thông tin thành công', 'Thành công!', { timeOut: 5000 })
                },
                function () {
                    toastr.error('Sửa thông tin thất bại vui lòng điền đẩy đủ thông tin', 'Lỗi', { timeOut: 5000 })

                }
            )
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

myApp.controller('addUser', function ($rootScope, $scope, $http, imgurUpload) {
    $http.get('/Admin/getAdminType').then(function (e) {
        $scope.AdminType = e.data;
        $scope.nv = {};
        console.log(e.data)
        $scope.max = new Date().toJSON().slice(0, 10)
        $scope.add = function () {
            $rootScope.link = "123456";
            console.log($rootScope.link)
            console.log($scope.nv)
            var image = document.getElementById('file').files[0];
            var clientId = "5c31a53dda3c8e0";
            imgurUpload.setClientId(clientId);
            imgurUpload
                .upload(image)
                .then(function (a) {
                    $scope.nv.hinhanh = a.data.link;
                    console.log(a)
                    console.log($scope.nv.hinhanh)
                    $http.post('/Admin/add_NhanVien', $scope.nv).then(
                        function () {
                            toastr.success('Thêm thành thành công', 'Thành công!', { timeOut: 5000 })

                            document.getElementById("info-user").reset()
                        },
                        function (e, q) {
                            toastr.error('Xem lại thông tin người dùng - Vui lòng điền tất cả thông tin', 'Lỗi!!', { timeOut: 5000 })
                        })
                    console.log($scope.nv.hinhanh)
                })


        }
    })


})


myApp.controller('editPro', function (imgurUpload, $scope, $http, $rootScope, $location) {
    $http.get('/LoaiSanPhamAdmin/GetAllProductTypeJS?page=1').then(function getListProductCatetory(response) {
        console.log(response.data)
        $scope.ProductCatetory = response.data;
    })
    var key = $location.search().masanpham
    $http.get('/SanPhamAdmin/GetProduct?masanpham=' + key).then(function (s) {
        console.log(s)
        $scope.info = s.data[0];
    })

    $scope.edit = function () {
        var image = document.getElementById('file');
        if (image.files.length !== 0) {
            var clientId = "5c31a53dda3c8e0";
            imgurUpload.setClientId(clientId);
            imgurUpload
                .upload(image.files[0])
                .then(function (a) {
                    $scope.nv.Hinhanh = a.data.link

                    $http.post('/SanPhamAdmin/EditProduct_', $scope.info).then(
                        function () {
                            Toast.success("Sửa sản phẩm thành công","Thành công")
                        },
                        function () {
                            Toast.success("Vui lòng nhập đầy đủ thông tin", "Thất bại")
                        }
                    )
                }
            )
        }
        else {
            $http.post('/SanPhamAdmin/EditProduct_', $scope.info).then(
                function () {

                    Toast.success("Sửa sản phẩm thành công", "Thành công")
                },
                function () {
                    Toast.success("Vui lòng nhập đầy đủ thông tin", "Thất bại")
                }
            )
        }
       
    }
}
)


function getoder($http, size, $scope) {
    document.getElementById('work').style.display = "block"
    $http({
        method: 'GET',
        url: '/Admin/getOrder?page=' + size
    }).then(function (res) {
        console.log(res.data);
        $scope.getJsonResults = res.data;
        document.getElementById('work').style.display = "none"
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



myApp.controller("managerPrice", function ($http, $scope) {
    $scope.pagesize = 10;
    $scope.list = [];
    $http.get('/Admin/dash').then(function (data) {
        // Lấy về danh sách số lượng về khách hàng, user, sản phẩm, đơn hàng,giá bán
        console.log(data);
        $http.get('/Admin/getPrice?page=1&&pagesize=10').then(function (res) {
            $scope.getJsonResults = res.data;
            console.log($scope.getJsonResults)
            var quotient = data.data[0].price / $scope.pagesize;
            if (quotient % 10 !== 0) {
                quotient += 1;
            }
            for (var i = 1; i <= quotient; i++) {
                $scope.list.push(i);
            }
            $scope.count = 1;
            var changeStyle = 1;
            $scope.changePage = function (a) {
                document.getElementById('work').style.display = "block"
                $http.get('/Admin/getPrice?page=' + a + '&&pagesize=10').then(function (getListPrice) {
                    $scope.getJsonResults = getListPrice.data;
                    document.getElementById('work').style.display = "none"
                })
                $scope.count = a;
                changeStyle = a - 1;
            }
        })
    })
    
    $scope.EditProductLink = function (e) {
        window.open(e, '', 'width=1000,height=800');
    }
    $scope.xoa = function (e, date) {
        if (date === '/Date(-62135596800000)/') {
            toastr.error('Không thể xoá giá mặc định', 'Lỗi!!', { timeOut: 5000 })

        }
        else {
            var data = {
                "ma": e
            }
            $http.post("/Admin/deltePrice", data).then(function () {
                toastr.success('Xoá thông tin thành công', 'Thành công!', { timeOut: 5000 })
                $http.get('/Admin/getPrice').then(function (res) {
                    $scope.getJsonResults = res.data;
                    console.log($scope.getJsonResults)
                })
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

myApp.controller("editPrice", function ($filter, $http, $scope, $location) {
    var key = $location.search().magia
    $http.get('/Admin/getInfoPrice?magia=' + key).then(function (res) {
        $scope.getJsonResults = res.data[0];
        console.log($scope.getJsonResults)
        $scope.NgayBatDau = new Date(ConvertDate($filter('filterdate')($scope.getJsonResults.ngayBatDau, 'dd/mm/yyyy')))
        $scope.NgayKetThuc = new Date(ConvertDate($filter('filterdate')($scope.getJsonResults.ngayKetThuc, 'dd/mm/yyyy')))
        $scope.MinDate = ConvertDate($filter('filterdate')($scope.getJsonResults.ngayKetThuc, 'dd/mm/yyyy'))
        $scope.MinDateNew = new Date(ConvertDate($filter('filterdate')($scope.getJsonResults.ngayKetThuc, 'dd/mm/yyyy')))
        $scope.MinDateNew2nd = $scope.MinDateNew.setDate($scope.MinDateNew.getDate() + 10)
        console.log($scope.MinDateNew2nd)
        $scope.getJsonResults.ngayBatDau = $scope.NgayBatDau
        $scope.getJsonResults.ngayKetThuc = $scope.NgayKetThuc
    })


    $scope.Edit = function () {

        if ($scope.getJsonResults.ngayBatDau === undefined && $scope.getJsonResults.ngayKetThuc) {

            toastr.error('Thời gian sử dụng giá sản phẩm đã tồn tại trong cơ sở dữ liệu \nVui lòng chọn ngày khác', 'Lỗi!', { timeOut: 5000 })
        }
        else {

            $http.post('/Admin/EditPrice', $scope.getJsonResults).then(function () {
                toastr.success('Sửa thông tín thành công', 'Thành công!', { timeOut: 5000 })
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
myApp.controller('managerDiscount', function ($http, $scope, $location) {
    $scope.pagesize = 10;
    $scope.list = [];
    $http.get('/Admin/dash').then(function (data) {
        // Lấy về danh sách số lượng về khách hàng, user, sản phẩm, đơn hàng,giá bán
        console.log(data);
        $http.get('/Admin/getDiscount?page=1').then(function (res) {
            $scope.getJsonResults = res.data;
            console.log($scope.getJsonResults)
            var quotient = data.data[0].discount / $scope.pagesize;
            if (quotient % 10 !== 0) {
                quotient += 1;
            }
            for (var i = 1; i <= quotient; i++) {
                $scope.list.push(i);
            }
            $scope.count = 1;
            var changeStyle = 1;
            $scope.changePage = function (a) {
                document.getElementById('work').style.display = "block"
                $http.get('/Admin/getDiscount?page=' + a).then(function (getListPrice) {
                    $scope.getJsonResults = getListPrice.data;
                    document.getElementById('work').style.display = "none"
                })
                $scope.count = a;
                changeStyle = a - 1;
            }
        })
    })

    $scope.EditProductLink = function (e) {
        window.open(e, '', 'width=1000,height=800');
    }
    $scope.xoa = function (e, date) {
        if (date === '/Date(-62135596800000)/') {
            toastr.error('Không thể xoá giá mặc định', 'Lỗi!!', { timeOut: 5000 })

        }
        else {
            var data = {
                "ma": e
            }
            $http.post("/Admin/deltePrice", data).then(function () {
                toastr.success('Xoá thông tin thành công', 'Thành công!', { timeOut: 5000 })
                $http.get('/Admin/getPrice').then(function (res) {
                    $scope.getJsonResults = res.data;
                    console.log($scope.getJsonResults)
                })
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
myApp.controller("addPrice", function ($filter, $http, $scope, $location) {
    $http({
        method: 'get',
        url: '/SanPhamAdmin/GetAllProduct?page=1&&size=1000'

    }).then(function (s) {
        $scope.ProductCatetory = s.data;
        console.log(s.data)

    })
    
    $scope.MinDateBatDau = new Date().toJSON().slice(0, 10)
    $scope.MinDateKetThuc = new Date().addDays(1).toJSON().slice(0, 10)
   
    $scope.add = function () {
        console.log($scope.getJsonResults);
        $http.post('/Admin/add_Price', $scope.getJsonResults).then(function () {
            toastr.success('Thêm giá thành công', 'Thành công!', { timeOut: 5000 })
        }, function () {
            toastr.error('Thêm giá thất bại vui lòng điền đẩy đủ thông tin', 'Lỗi', { timeOut: 5000 })
        })
    }
})

Date.prototype.addDays = function (days) {
    var date = new Date(this.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}

Date.prototype.minusDays = function (days) {
    var date = new Date(this.valueOf());
    date.setDate(date.getDate() - days);
    return date;
}

myApp.controller("editinfo", function ($scope, $http, imgurUpload, $filter, $rootScope) {
    var i4 = {
        email: localStorage.getItem("email"),
        matkhau: localStorage.getItem("matkhau"),
    }
    $http({
        method: "POST",
        url: '/Admin/log',
        data: i4
    }).then(function (s) {
        console.log(s);
        $scope.nv = s.data[0]
        $scope.nv.ngaysinh=  new Date(ConvertDate($filter('filterdate')($scope.nv.ngaysinh, 'dd/mm/yyyy')))
     
    })
    $scope.MinDateNgaysinh = new Date().minusDays(6570).toJSON().slice(0, 10)
    $scope.editinfo = function () {

        var image = document.getElementById('avtadmin');
        if (image.files.length !== 0) {
            var clientId = "5c31a53dda3c8e0";
            imgurUpload.setClientId(clientId);
            imgurUpload
                .upload(image.files[0])
                .then(function (a) {
                    $scope.nv.hinhanh = a.data.link
                    $http.post('/Admin/Edit_Profile', $scope.nv).then(
                        function () {

                        },
                        function () {
                        })
                }
            )
        }
        else {
            $http.post('/Admin/Edit_Profile', $scope.nv).then(
                function () {
                    toastr.success('Sửa thông tin thành công', 'Thành công!', { timeOut: 5000 })
                }, 
                function () {
                    toastr.error('Sửa thông tin thất bại vui lòng điền đẩy đủ thông tin', 'Lỗi', { timeOut: 5000 })

                }
            )
        }


        
    }
    $scope.changePass = function () {
        console.log($scope.nv);
        if ($scope.newPass !== $scope.reNewPass) {
            toastr.error('Mật khẩu xác nhận không trung khớp', 'Lỗi', { timeOut: 5000 })
        }
        else {
            var i4 = {
                "nv.matkhau": $scope.matkhau,
                newPass: $scope.newPass,
                "nv.manhanvien": $scope.nv.manhanvien
            }
            $http.post('/Admin/changPassWord', i4).then(function (f) {
                if (f.data === "0") {
                    toastr.error('Mật khẩu cũ không đúng', 'Lỗi', { timeOut: 5000 })
                }
                else if ($scope.newPass.length<4) {
                    toastr.error('Mật khẩu phải dài hơn 4 ký tự', 'Lỗi', { timeOut: 5000 })
                }
                else {
                     toastr.success('Đổi mật khẩu thành công', 'Thành công!', { timeOut: 5000 })
                     document.getElementById("pass").reset();
                     localStorage.setItem("matkhau", $scope.newPass)
                }
               
            },
                function (f) {
                    console.log(f)
                    toastr.error('Mật khẩu cũ không đúng', 'Lỗi', { timeOut: 5000 })
            })
        }
    }
    $scope.forgetpass = function ()
    {
        forgetPass($scope.nv.email, $scope, $http)
       
    }
}).filter("filterdate", function () {
    var re = /\/Date\(([0-9]*)\)\//;
    return function (x) {
        var m = x.match(re);
        if (m) return new Date(parseInt(m[1]));
        else return null;
    };
});

function forgetPass(mail, $scope, $http) {
    if (mail === undefined) {
        toastr.error('Vui lòng nhập mail của bạn ', 'Lỗi', { timeOut: 5000 })
    }
    else {
        var i4 = {
            mail: mail,
            manv: $scope.nv.manhanvien
        }
        $http.post('/Admin/forgetPass', i4).then(function ()
        {
            toastr.success('Chúng tôi đã gửi email và mật khẩu mới cho bạn,vui lòng xác nhận tại mail ' + mail, 'Thành công!', { timeOut: 10000 })
        })
        
    }
   
}

function ConvertDate(str) {
    var date = new Date(str),
        mnth = ("0" + (date.getMonth() + 1)).slice(-2),
        day = ("0" + date.getDate()).slice(-2);
    return [date.getFullYear(), mnth, day].join("-");
}

