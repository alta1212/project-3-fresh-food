using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO_Data_Transfer_Object_
{
   public class orderDetail
    {
        public string maChiTietDonHang { get; set; }
        public string maSanPham { get; set; }
        public string maDonHang { get; set; }
        public  int soLuong { get; set; }
        public string tenSanPham { get; set; }
        public int thanhTien { get; set; }
        public int giaBan { get; set; }
        public DateTime NgayMua { get; set; }
    }
}
