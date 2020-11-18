namespace DTO_Data_Transfer_Object_
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class LOAI_SAN_PHAM
    {
        public string maloaisanpham;
        public string tenloaisanpham;
        public string mota;
        public int soLuong;

        public LOAI_SAN_PHAM(string maloai, string tenloai, string mota,int soLuong)
        {
            this.maloaisanpham = maloai;
            this.tenloaisanpham = tenloai;
            this.mota = mota;
            this.soLuong = soLuong;
          
        }
        public LOAI_SAN_PHAM()
        {

        }
        public string MaLoaiSanPham
        {
            get { return maloaisanpham; }
            set {  maloaisanpham =value; }
        }

        public string TenLoaiSanPham
        {
            get { return tenloaisanpham; }
            set { tenloaisanpham = value; }
        }
        public int SoLuong
        {
            get { return soLuong; }
            set { soLuong = value; }
        }
        public string MoTa
        {
            get { return mota; }
            set { mota = value; }
        }
    }
}
