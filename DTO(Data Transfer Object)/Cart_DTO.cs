using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO_Data_Transfer_Object_
{
    public class Cart_DTO
    {
        private string maChiTietGioHang;
        private string maSanPham;
        private string tenSanPham;
        private string maGioHang;
        private string hinhAnh;
        private int soLuong;
        private int giaBan;
        private int giaGiam;
        private int tongTien;
        private string donViTinh;
        private int giaTrongCart;
        public Cart_DTO()
        {

        }
        public Cart_DTO(int giacart,string maChiTietGioHang,string tenSanPham,string hinhAnh, string maSanPham, string maGioHang, int soLuong, int giaBan, int giaGiam, string donViTinh, int tongTien)
        {
            this.giaTrongCart = giacart;
            this.maChiTietGioHang = maChiTietGioHang;
            this.maSanPham = maSanPham;
            this.maGioHang = maGioHang;
            this.soLuong = soLuong;
            this.giaBan = giaBan;
            this.tenSanPham = tenSanPham;
            this.giaGiam = giaGiam;
            this.tongTien = tongTien;
            this.donViTinh = donViTinh;
            this.hinhAnh = hinhAnh;
        }

        

        public string MaChiTietGioHang
        {
            get { return maChiTietGioHang; } 
            set {maChiTietGioHang = value; } 
        }
        public int ThanhTien
        {
            get { return giaTrongCart; }
            set { giaTrongCart = value; }
        }
        public string MaSanPham
        {
            get { return maSanPham; }
            set { maSanPham = value; }
        }
        public string TenSanPham
        {
            get { return tenSanPham; }
            set { tenSanPham = value; }
        }
        public string  MaGioHang
        {
            get { return maGioHang; }
            set { maGioHang = value; }
        }
        public int SoLuong
        {
            get { return soLuong; }
            set { soLuong = value; }
        }
        public string DonViTinh
        {
            get { return donViTinh; }
            set { donViTinh = value; }
        }
        public int GiaBan
        {
            get { return giaBan; }
            set { giaBan = value; }
        }
        public int GiaGiam
        {
            get { return giaGiam; }
            set { giaGiam = value; }
        }
        public int TongTien
        {
            get { return tongTien; }
            set { tongTien = value; }
        }
        public string HinhAnh
        {
            get { return hinhAnh; }
            set { hinhAnh = value; }
        }
    }
}
