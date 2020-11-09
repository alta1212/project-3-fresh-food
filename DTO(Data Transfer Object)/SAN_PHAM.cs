namespace DTO_Data_Transfer_Object_
{
    public class SAN_PHAM
    {
        public string maloaisanpham;
        public string Tensanpham;
        public string masanpham;
        public int soluongnhap;
        public int soluongban;
        public string mota;
        public string hinhanh;
        public string donvitinh;
        public int stars;
        public int giamoi;
        public int giaban;
        public int soluongcon;

        public int soluongCon
        {
            get { return soluongcon; }
            set { soluongcon = value; }
        }
        public string MaLoaiSanPham
        {
            get { return maloaisanpham; }
            set { maloaisanpham = value; }
        }
        public string Hinhanh
        {
            get { return hinhanh; }
            set { hinhanh = value; }
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
            get { return Tensanpham; }
            set { Tensanpham = value; }
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
        public int SoLuongnhap
        {
            get { return soluongnhap; }
            set { soluongnhap = value; }
        }
        public int SoLuongban
        {
            get { return soluongban; }
            set { soluongban = value; }
        }
        public int Giamoi
        {
            get { return giamoi; }
            set { giamoi = value; }
        }
        public int Giaban
        {
            get { return giaban; }
            set { giaban = value; }
        }
    }
}
