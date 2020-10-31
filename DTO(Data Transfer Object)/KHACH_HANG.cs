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
        public string active;
        
      
        public string  MaKhachhang {
            get { return makhachhang; }
            set { makhachhang = value; }
        }
        public string Active
        {
            get { return active; }
            set { active = value; }
        }
        public string  TaiKhoan {
            get { return taikhoan; }
            set { taikhoan = value; }
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
