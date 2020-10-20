using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO_Data_Transfer_Object_
{
    public class KHACH_HANG
    {
        public string  makhachhang;
        public string  taikhoan ;
        public string  matkhau ;
        public DateTime ngaytao ;
        public string  email ;
        public string  sodienthoai ;
        public DateTime dateofbirth ;
        public int sex ;
        public string  adress ;
        public string  idFacebook ;
        public string  mafeedback ;
        public string  magiohang ;
        public string  verificationcode ;
        public string  tenkhachhang ;
        public string  anhdaidien ;

        public KHACH_HANG()
        {
       
        }
        public KHACH_HANG(KHACH_HANG khach)
        {
            this.makhachhang =khach.makhachhang;
            this.taikhoan = khach.taikhoan;
            this.matkhau = khach.matkhau;
            this.ngaytao = khach.ngaytao;
            this.email = khach.email;
            this.sodienthoai = khach.sodienthoai;
            this.dateofbirth = khach.dateofbirth;
            this.sex = khach.sex;
            this.adress = khach.adress;
            this.idFacebook = khach.idFacebook;
            this.mafeedback = khach.mafeedback;
            this.magiohang = khach.magiohang;
            this.verificationcode = khach.verificationcode;
            this.tenkhachhang = khach.tenkhachhang;
            this.anhdaidien = khach.anhdaidien;

        }
        public KHACH_HANG(string makhachhang,string taikhoan,string matkhau,DateTime ngaytao,string email,string sodienthoai,DateTime dateofbirth,int sex,string adress,string idFacebook,string mafeedback,string magiohang,string verificationcode,string tenkhachhang,string anhdaidien)
        {
            this.makhachhang = makhachhang;
            this.taikhoan = taikhoan;
            this.matkhau = matkhau;
            this.ngaytao = ngaytao;
            this.email = email;
            this.sodienthoai = sodienthoai;
            this.dateofbirth = dateofbirth;
            this.sex = sex;
            this.adress = adress;
            this.idFacebook = idFacebook;
            this.mafeedback = mafeedback;
            this.magiohang = magiohang;
            this.verificationcode = verificationcode;
            this.tenkhachhang = tenkhachhang;
            this.anhdaidien = anhdaidien;
        }
        public string  MaKhachhang {
            get { return makhachhang; }
            set { makhachhang = value; }
        }

        public string  TaiKhoan {
            get { return makhachhang; }
            set { makhachhang = value; }
        }
        public string  MatKhau {
            get { return matkhau; }
            set { matkhau = value; }
        }
        public DateTime ngayTao {
            get { return ngaytao; }
            set { ngaytao = value; }
        }
        public string  Email {
            get { return email; }
            set { email = value; }
        }
        public string  SoDienThoai {
            get { return sodienthoai; }
            set { sodienthoai = value; }
        }
        public DateTime DateOfBirth {
            get { return dateofbirth; }
            set { dateofbirth = value; }
        }
        public int Sex {
            get { return sex; }
            set { sex = value; }
        }
        public string  Adress {
            get { return adress; }
            set { adress = value; }
        }
        public string  IDFacebook {
            get { return idFacebook; }
            set { idFacebook = value; }
        }
        public string  MaFeedBack {
            get { return mafeedback; }
            set { mafeedback = value; }
        }
        public string  MaGioHang {
            get { return magiohang; }
            set { magiohang = value; }
        }
        public string  VerificationCode {
            get { return verificationcode; }
            set { verificationcode = value; }
        }
        public string  TenKhachHang {
            get { return tenkhachhang; }
            set { tenkhachhang = value; }
        }
        public string  AnhDaiDien {
            get { return anhdaidien; }
            set { anhdaidien = value; }
        }
    }
}
