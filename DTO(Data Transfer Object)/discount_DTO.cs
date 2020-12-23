using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO_Data_Transfer_Object_
{
   public class Discount_DTO
    {
        private string machietkhau;
        private DateTime ngaybatdau;
        private DateTime ngayketthuc;
        private int phantram;
        private int minmoney;
        private int maxmoney;
        private string hinhanh;
        public Discount_DTO()
        {

        }
        public Discount_DTO(string hinhAnh, string maChietkhau,DateTime batdau,DateTime ketthuc,int phantram,int min ,int max)
        {
            this.machietkhau = maChietkhau;
            this.ngaybatdau = batdau;
            this.ngayketthuc = ketthuc;
            this.phantram = phantram;
            this.minmoney = min;
            this.maxmoney = max;
            this.hinhanh = hinhAnh;
        }
        public string MaChietKhau
        {
            get { return machietkhau; }
            set { machietkhau = value; }
        }
        public string HinhAnh
        {
            get { return hinhanh; }
            set { hinhanh = value; }
        }
        public DateTime start
        {
            get { return ngaybatdau; }
            set { ngaybatdau = value; }
        }
        public DateTime end
        {
            get { return ngayketthuc; }
            set { ngayketthuc = value; }
        }
        public int PhanTram
        {
            get { return phantram; }
            set { phantram = value; }
        }
        public int TienToiThieu
        {
            get { return minmoney; }
            set { minmoney = value; }
        }
        public int TienToiDa
        {
            get { return maxmoney; }
            set { maxmoney = value; }
        }
    }
}
