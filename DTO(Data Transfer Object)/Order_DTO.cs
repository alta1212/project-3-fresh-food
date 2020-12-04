using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO_Data_Transfer_Object_
{
    public class Order_DTO
    {
        private string madonhang;
        private string makhachhang;
        private string manhanvien;
        private int trangthai;
        private int tongtien;
        private DateTime ngaymua;
        private DateTime ngayxacthuc;
        private string tennhanvien;
        private string sdt;
        private string diachi;
        public Order_DTO(string sdt,string diachi,string madh,string makh,string manv,int status,int tien,DateTime mua,DateTime xacthuc,string tennnv)
        {
            this.sdt = sdt;
            this.diachi = diachi;
            this.madonhang = madh;
            this.makhachhang = makh;
            this.manhanvien = manv;
            this.trangthai = status;
            this.tongtien = tien;
            this.ngaymua = mua;
            this.ngayxacthuc = xacthuc;
            this.tennhanvien = tennnv;
        }
        public Order_DTO() { }
        public string MaDonHang
        {
            get { return madonhang; }
            set { madonhang = value; }
        }
        public string SoDienThoai
        {
            get { return sdt; }
            set { sdt = value; }
        }
        public string DiaChi
        {
            get { return diachi; }
            set { diachi = value; }
        }
        public string MaKhachhang
        {
            get { return makhachhang; }
            set { makhachhang = value; }

        }
        public string MaNhanVien
        {
            get { return manhanvien; }
            set { manhanvien = value; }
        }
        public int TrangThai
        {
            get { return trangthai; }
            set { trangthai = value; }
        }
        public int TongTien
        {
            get { return tongtien; }
            set { tongtien = value; }
        }
        public DateTime NgayMua
        {
            get { return ngaymua; }
            set { ngaymua = value; }
        }
        public DateTime NgayXacThuc
        {
            get { return ngayxacthuc; }
            set { ngayxacthuc = value; }
        }
        public string TenNhanVien
        {
            get { return tennhanvien; }
            set { tennhanvien = value; }
        }
    }
}
