using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO_Data_Transfer_Object_
{
     public class FeedBack_DTO
     {
        private string maFeedBack;
        private string maSanPham;
        private string maKhachHang;
        private string binhLuan;
        private string hinhAnh;
        private DateTime ngayBinhLuan;
        private float stars;
        private string tenKhachHang;
        private string hinhAnhKH;
        public FeedBack_DTO()
        {

        }
        public FeedBack_DTO(string mAFeedBack, string mASanPham, string mAKhachHang, string bInhLuan, string hInhAnh, DateTime nGayBinhLuan,float Stars,string tENkhachhang,string HinhAnHkh)
        {
            this.maFeedBack = mAFeedBack;
            this.maSanPham = mASanPham;
            this.maKhachHang = mAFeedBack;
            this.binhLuan = bInhLuan;
            this.hinhAnh = hInhAnh;
            this.ngayBinhLuan = nGayBinhLuan;
            this.stars = Stars;
            this.tenKhachHang = tENkhachhang;
            this.hinhAnhKH = HinhAnHkh;
        }

        public string TenKhachHang
        {
            get { return tenKhachHang; }
            set { tenKhachHang = value; }
        }
        public string HinhAnhKh
        {
            get { return hinhAnhKH; }
            set { hinhAnhKH = value; }
        }
        public float Stars
        {
            get { return stars; }
            set { stars = value; }
        }
        public string MaFeedBack
        {
            get { return maFeedBack; }
            set { maFeedBack = value; }
        }
        public string MaSanPham
        {
            get { return maSanPham; }
            set { maSanPham = value; }
        }
        public string MaKhachHang
        {
            get { return maKhachHang; }
            set { maKhachHang = value; }
        }
        public string BinhLuan
        {
            get { return binhLuan; }
            set { binhLuan = value; }
        }
        public string HinhAnh
        {
            get { return hinhAnh; }
            set { hinhAnh = value; }
        }
        public DateTime NgayBinhLuan
        {
            get { return ngayBinhLuan; }
            set { ngayBinhLuan = value; }
        }
    }
}
