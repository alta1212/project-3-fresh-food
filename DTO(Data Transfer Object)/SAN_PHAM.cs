using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO_Data_Transfer_Object_
{
   public class SAN_PHAM
    {
        public string maloaisanpham;
        public string manhacc;
        public string masanpham;
        public int soluong;
        public string mota;
        public string Hinhanh;

        public string MaLoaiSanPham
        {
            get { return maloaisanpham; }
            set { maloaisanpham = value; }
        }
        public string hinhanh
        {
            get { return Hinhanh; }
            set { Hinhanh = value; }
        }    
        public string MaNhaCC
        {
            get { return manhacc; }
            set { manhacc = value; }
        }
        public string MoTa
        {
            get { return mota; }
            set { mota = value; }
        }
        public string MaSanPham
        {
            get { return masanpham; }
            set { masanpham = value; }
        }
        public int SoLuong
        {
            get { return soluong; }
            set { soluong = value; }
        }
    }
}
