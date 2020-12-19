using System;


namespace DTO_Data_Transfer_Object_
{
    public class Price_DTO
    {
        public string maGiaBan { get; set; }
        public string tenSanPham { get; set; }
        public string maSanPham { get; set; }
        public int gia { get; set; }
        public DateTime ngayBatDau { get; set; }
        public DateTime ngayKetThuc { get; set; }
    }
}
