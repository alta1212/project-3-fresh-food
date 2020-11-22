using System;

namespace DTO_Data_Transfer_Object_
{
    public class SAN_PHAM
    {
        private string maLoaiSanPham;
        private string tenSanPham;
        private string maSanPham;
        private int soLuongNhap;
        private int soLuongBan;
        private string moTa;
        private string hinhAnh;
        private string donViTinh;
        private int stars;
        private int giaMoi;
        private int giaBan;
        private int soLuongCon;
        private string tenLoaiSanPham;
        private DateTime ngayBatDauKM;
        private DateTime ngayKetThucKM;
        private int phantram;

        public SAN_PHAM()
        {

        }
        public SAN_PHAM(int phaNtram,string maLoaiSanPham, string tenLoaiSanPham, string maSanPham, int soLuongNhap, int soLuongBan, string moTa, string hinhAnh, string donViTinh, int stars, int giaMoi, int giaBan, int soLuongCon, string tenloaiSanPham, DateTime ngayBatDauKM, DateTime ngayKetThucKM)
        {
            this.phantram = phaNtram;
            this.maLoaiSanPham = maLoaiSanPham;
            this.tenLoaiSanPham = tenLoaiSanPham;
            this.maSanPham = maSanPham;
            this.soLuongNhap = soLuongNhap;
            this.soLuongBan = soLuongBan;
            this.moTa = moTa;
            this.hinhAnh = hinhAnh;
            this.donViTinh = donViTinh;
            this.stars = stars;
            this.giaMoi = giaMoi;
            this.giaBan = giaBan;
            this.soLuongCon = soluongCon;
            this.tenLoaiSanPham = tenLoaiSanPham;
            this.ngayBatDauKM = ngayBatDauKM;
            this.ngayKetThucKM = ngayKetThucKM;

        }
        public string DonViTinh
        {
            get { return donViTinh; }
            set { donViTinh = value; }
        }
        public int PhanTram
        {
            get { return phantram; }
            set { phantram = value; }
        }
        public string Tenloaisanpham
        {
            get { return tenLoaiSanPham; }
            set { tenLoaiSanPham = value; }
        }
        public int soluongCon
        {
            get { return soLuongCon; }
            set { soLuongCon = value; }
        }
        public string MaLoaiSanPham
        {
            get { return maLoaiSanPham; }
            set { maLoaiSanPham = value; }
        }
        public string Hinhanh
        {
            get { return hinhAnh; }
            set { hinhAnh = value; }
        }
        public int Stars
        {
            get
            {
                return stars
;
            }
            set { stars = value; }
        }
        public string tensanpham
        {
            get { return tenSanPham; }
            set { tenSanPham = value; }
        }
        public string MoTa
        {
            get { return moTa; }
            set { moTa = value; }
        }
        public string MaSanPham
        {
            get { return maSanPham; }
            set { maSanPham = value; }
        }
        public int SoLuongnhap
        {
            get { return soLuongNhap; }
            set { soLuongNhap = value; }
        }
        public int SoLuongban
        {
            get { return soLuongBan; }
            set { soLuongBan = value; }
        }
        public int Giamoi
        {
            get { return giaMoi; }
            set { giaMoi = value; }
        }
        public int Giaban
        {
            get { return giaBan; }
            set { giaBan = value; }
        }
        public DateTime NgayBatDauKM { get { return ngayBatDauKM; } set { ngayBatDauKM = value; } }
        public DateTime NgayKetThucKM { get { return ngayKetThucKM; } set { ngayKetThucKM = value; } }
    }
}
