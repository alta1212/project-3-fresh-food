using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Dynamic;
using System.Globalization;

namespace DAO_Data_Access_Object_
{
    public class SAN_PHAM_DAO
    {   //get về 6 sản phẩm ngẫu nhiên đẻ đưa ra trang chủ
        public IList<SAN_PHAM> getallsp()
        {

            DataTable dt = new DataTable();
            string cmdtext = string.Format(@"
            Select TOP(6) SP.MaSanPham,SP.TenSanPham,SP.HinhAnh,SP.MoTa,SP.Stars,SP.DonViTinh,GB.GiaBan
                    From dbo.SAN_PHAM SP Inner join dbo.GIA_BAN GB
	                        On SP.MaSanPham = GB.MaSanPham
                                 Order By NEWID()");//lấy về 6 sản phẩm ngẫu nhiên để tạo
            dt = DataAccessHelper.log(cmdtext);
            List<SAN_PHAM> li = new List<SAN_PHAM>();
            foreach (DataRow dr in dt.Rows)
            {
                SAN_PHAM sp = new SAN_PHAM();
                sp.MaSanPham = dr[0].ToString();
                sp.tensanpham = dr[1].ToString();
                sp.Hinhanh = dr[2].ToString();
                sp.MoTa = dr[3].ToString();
                sp.Stars = int.Parse(dr[4].ToString());
                sp.DonViTinh = dr[5].ToString();
                sp.Giaban = int.Parse(dr[6].ToString());
                li.Add(sp);
            }
            return li;
        }

        //lấy về sản phẩm sale trong ngày
        public IList<SAN_PHAM> getDaylydeal()
        {
            DataTable dt = new DataTable();

            string cmdtext = string.Format(@"
 Select PAAPT.*,PAAPDT.GiaBan - PAAPDT.GiaBan * PAAPDT.PhanTram / 100 N'Giá Khuyến Mại',PAAPDT.PhanTram From ProductAndAllPriceTest PAAPT Left Join ProductAndAllPriceDiscountTest PAAPDT 
	                        On PAAPT.MaSanPham = PAAPDT.MaSanPham where GETDATE() BETWEEN NgayBatDau and NgayKetThuc");
            dt = DataAccessHelper.log(cmdtext);
            List<SAN_PHAM> li = new List<SAN_PHAM>();
            foreach (DataRow dr in dt.Rows)
            {
                SAN_PHAM sp = new SAN_PHAM();
                sp.MaSanPham = dr[1].ToString();
                sp.tensanpham = dr[2].ToString();
                sp.Hinhanh = dr[6].ToString();
                sp.MoTa = dr[8].ToString();
                sp.Stars = int.Parse(dr[9].ToString());
                sp.Giaban = int.Parse(dr[10].ToString());
                sp.Giamoi = int.Parse(dr[12].ToString());
                sp.PhanTram = int.Parse(dr[13].ToString());
                li.Add(sp);
            }
            return li;
        }

       

        public string confirmOrder(string madonhang, string manv)
        {
            if (manv == null)
                manv = "";
            SqlParameter[] parm = new SqlParameter[]
               {

                new SqlParameter("@MaDonHang",SqlDbType.NVarChar,50),
                new SqlParameter("@MaNhanVien",SqlDbType.NVarChar,50),
               };
            parm[0].Value = madonhang;
            parm[1].Value = manv;
            return DataAccessHelper.parnWithValue("@affected", DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "confirmOrder", parm).ToString();
        }

        public void edit(SAN_PHAM info)
        {
            throw new NotImplementedException();
        }

        public void xoaSp(string ma)
        {
            SqlParameter[] parm = new SqlParameter[]
              {

                new SqlParameter("@MaSanPham",SqlDbType.NVarChar,50),

              };
            parm[0].Value = ma;

            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "", parm);
        }

        public void AddToCart(string maKhacHang, string maSanPham,int donGia,int soLuong)
        {
            SqlParameter[] parm = new SqlParameter[]
             {
                new SqlParameter("@MaKhachHang",SqlDbType.NVarChar,50),
                new SqlParameter("@MaSanPham",SqlDbType.NVarChar,50),
                new SqlParameter("@DonGia",SqlDbType.Int),
                new SqlParameter("@SoLuong",SqlDbType.Int)
             };
            parm[0].Value = maKhacHang;
            parm[1].Value = maSanPham;
            parm[2].Value = donGia;
            parm[3].Value = soLuong;
            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Add_To_Cart", parm);
        }

        public IList<FeedBack_DTO> getListFeedBack(string masanpham)
        {
            DataTable dt = new DataTable();
            //lấy về các sản phẩm theo pagesize
            string cmdtext = string.Format(@"
                Select  KH.TenKhachHang,KH.HinhAnh, FB.*,COUNT(fb.MaFeedBack) OVER(PARTITION BY LEFT(fb.MaFeedBack,2) ORDER BY fb.MaFeedBack RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
                    From dbo.KHACH_HANG KH Right Join dbo.FEED_BACK FB 
	                    On KH.MaKhachHang = FB.MaKhachHang  or kh.IDFaceBook=fb.MaKhachHang
		                    Where FB.MaSanPham = '{0}' order by ngaybinhluan desc", masanpham);
            dt = DataAccessHelper.log(cmdtext);

            List<FeedBack_DTO> li = new List<FeedBack_DTO>();

            foreach (DataRow dr in dt.Rows)
            {
                FeedBack_DTO fb = new FeedBack_DTO();
                fb.TenKhachHang = dr[0].ToString();
                fb.HinhAnhKh =dr[1].ToString();
                fb.MaFeedBack = dr[2].ToString();
                fb.MaSanPham = dr[3].ToString();
                fb.MaKhachHang = dr[4].ToString();
                fb.BinhLuan = dr[5].ToString();
                fb.HinhAnh = dr[6].ToString();
                fb.NgayBinhLuan = Convert.ToDateTime(dr[7].ToString());
                fb.Stars = float.Parse( dr[8].ToString());
                fb.SoLuong= int.Parse(dr[9].ToString());
                li.Add(fb);
            }
            return li;
        }

        public IList<SAN_PHAM> searchName(string name,int page,int pagesize)
        {
            DataTable dt = new DataTable();
            //lấy về các sản phẩm theo pagesize
            string cmdtext = string.Format(@"Select  SP.*,GB.GiaBan,LSP.TenLoaiSanPham
                    From dbo.SAN_PHAM SP  Inner Join dbo.GIA_BAN GB 
	                    On SP.MaSanPham = GB.MaSanPham Inner join dbo.LOAI_SAN_PHAM LSP
                           On SP.MaLoaiSanPham = LSP.MaLoaiSanPham and sp.tensanpham like'%{2}%'
                                order by masanpham desc Offset {0}*({1}-1) Rows Fetch next {0} rows only", pagesize, page,name);
            dt = DataAccessHelper.log(cmdtext);
           
            List<SAN_PHAM> li = new List<SAN_PHAM>();
            
            foreach (DataRow dr in dt.Rows)
            {
                SAN_PHAM sp = new SAN_PHAM();
                sp.MaLoaiSanPham = dr[0].ToString();
                sp.MaSanPham = dr[1].ToString();
                sp.tensanpham = dr[2].ToString();
                sp.SoLuongnhap = int.Parse(dr[3].ToString());
                sp.SoLuongban = int.Parse(dr[4].ToString());
                sp.soluongCon = int.Parse(dr[5].ToString());
                sp.Hinhanh = dr[6].ToString();
                sp.DonViTinh = dr[7].ToString();
                sp.MoTa = dr[8].ToString();
                sp.Stars = int.Parse(dr[9].ToString());
                sp.Giaban = int.Parse(dr[10].ToString());
                sp.Tenloaisanpham = dr[11].ToString();
                li.Add(sp);
            }
            return li;
        }

        public IList<SAN_PHAM> getttsanpham(string masanpham)
        {
             DataTable dt = new DataTable();
            
            string cmdtext = string.Format(@"Select  SP.*,GB.GiaBan,lsp.tenloaisanpham
                    From dbo.SAN_PHAM SP Inner join dbo.GIA_BAN GB
	                        On SP.MaSanPham = GB.MaSanPham inner join [dbo].[LOAI_SAN_PHAM] lsp on lsp.maLoaiSanPham=sp.maLoaiSanPham  and sp.masanpham='{0}'  order by masanpham ", masanpham);
            dt = DataAccessHelper.log(cmdtext);
            List<SAN_PHAM> li = new List<SAN_PHAM>();
            foreach (DataRow dr in dt.Rows)
            {
                SAN_PHAM sp = new SAN_PHAM();
                sp.MaLoaiSanPham = dr[0].ToString();
                sp.MaSanPham = dr[1].ToString();
                sp.SoLuongnhap = int.Parse(dr[3].ToString());
                sp.soluongCon = int.Parse(dr[5].ToString());
                sp.SoLuongban = int.Parse(dr[4].ToString());
                sp.tensanpham = dr[2].ToString();
                sp.Hinhanh = dr[6].ToString();
                sp.DonViTinh = dr[7].ToString();
                sp.Stars = int.Parse(dr[9].ToString());
                sp.MoTa = dr[8].ToString();
                sp.Giaban=int.Parse(dr[10].ToString());
                sp.Tenloaisanpham= dr[11].ToString();
                li.Add(sp);
            }
            return li;
        }

        public void postComent(string masp,string mkh,string binhluan,string hinhanh,float stars
            )
        {
            SqlParameter[] parm = new SqlParameter[]
           {
                new SqlParameter("@MaFeedBack",SqlDbType.NVarChar,50),
                new SqlParameter("@MaSanPham",SqlDbType.NVarChar,50),
                new SqlParameter("@MaKhachHang",SqlDbType.NVarChar,50),
                new SqlParameter("@BinhLuan",SqlDbType.NVarChar,200),
                new SqlParameter("@HinhAnh",SqlDbType.NVarChar,100),
                new SqlParameter("@Stars",SqlDbType.Int),

           };
            parm[0].Value = ""??DBNull.Value.ToString();
            parm[1].Value = masp;
            parm[2].Value = mkh;
            parm[3].Value = binhluan;
            parm[4].Value = hinhanh??DBNull.Value.ToString();
            parm[5].Value = stars;

             DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "PostComment", parm);
        }

        //get sản phẩm by loai
        public IList<SAN_PHAM> getbyloai(string loai, string page)
        {
            DataTable dt = new DataTable();
            
            string cmdtext = string.Format(@"Select  SP.*,GB.GiaBan
                    From dbo.SAN_PHAM SP Inner join dbo.GIA_BAN GB
	                        On SP.MaSanPham = GB.MaSanPham  and sp.maLoaiSanPham='{1}'  order by masanpham desc Offset 1 Rows Fetch next {0} rows only", page,loai);
            dt = DataAccessHelper.log(cmdtext);
            List<SAN_PHAM> li = new List<SAN_PHAM>();
            foreach (DataRow dr in dt.Rows)
            {
                SAN_PHAM sp = new SAN_PHAM();
                sp.MaLoaiSanPham = dr[0].ToString();
                sp.MaSanPham = dr[1].ToString();
                sp.tensanpham = dr[2].ToString();
                sp.SoLuongnhap = int.Parse(dr[3].ToString());
                sp.SoLuongban = int.Parse(dr[4].ToString());
                sp.soluongCon = int.Parse(dr[5].ToString());
                sp.Hinhanh = dr[6].ToString();
                sp.DonViTinh = dr[7].ToString();
                sp.Stars = int.Parse(dr[9].ToString());
                sp.MoTa = dr[8].ToString();
                sp.Giaban=int.Parse(dr[10].ToString());
                li.Add(sp);
            }
            return li;
        }
        //lây về sp mới nhất
        public IList<SAN_PHAM> getLatestSp()
        {
            throw new NotImplementedException();
        }
        //lấy về bán chạy nhất
        public IList<SAN_PHAM> getBestSell()
        {
            DataTable dt = new DataTable();
            //lấy về 6 sản phẩm bán chạy nhất
            string cmdtext = string.Format(@"
            Select SP.MaSanPham,SP.TenSanPham,SP.HinhAnh,SP.MoTa,SP.Stars,SP.DonViTinh,GB.GiaBan
                From dbo.SAN_PHAM SP Inner join dbo.GIA_BAN GB On SP.MaSanPham = GB.MaSanPham 
	                Where SP.MaSanPham
		            in (Select Top(6) CTDH.MaSanPham From dbo.CHI_TIET_DON_HANG CTDH
				            Group By CTDH.MaSanPham
						    Order by sum(CTDH.SoLuong) Desc)");
            dt = DataAccessHelper.log(cmdtext);
            List<SAN_PHAM> li = new List<SAN_PHAM>();
            foreach (DataRow dr in dt.Rows)
            {
                SAN_PHAM sp = new SAN_PHAM();
                sp.MaSanPham = dr[0].ToString();
                sp.tensanpham = dr[1].ToString();
                sp.Hinhanh = dr[2].ToString();
                sp.MoTa = dr[3].ToString();

                sp.Stars = int.Parse(dr[4].ToString());
                sp.DonViTinh = dr[5].ToString();
                sp.Giaban = int.Parse(dr[6].ToString());
                li.Add(sp);
            }
            return li;
        }
        //Get các sản phẩm bán chạy
        public IList<SAN_PHAM> getProductDiscount()
        {
            DataTable dt = new DataTable();
            //lấy về 6 sản phẩm bán chạy nhất
            string cmdtext = string.Format(@"
            Select Top(6) PP.MaSanPham, PP.TenSanPham, PP.HinhAnh, PP.MoTa, PP.Stars, PP.DonViTinh, PP.GiaBan,PP.GiaBan- PP.GiaBan / 100 * GG.PhanTram as N'Tiền giảm',GG.PhanTram,GG.NgayBatDau,GG.NgayKetThuc
		        From ProductAndPrice PP Inner Join dbo.Gia_Giam GG
			        On PP.MaSanPham = GG.MaSanPham 
						Where GG.NgayBatDau < GETDATE() And GG.NgayKetThuc >GETDATE()");
            dt = DataAccessHelper.log(cmdtext);
            List<SAN_PHAM> li = new List<SAN_PHAM>();
            foreach (DataRow dr in dt.Rows)
            {
                int giaBan = int.Parse(dr[6].ToString());
                int phanTram = int.Parse(dr[8].ToString());
                SAN_PHAM sp = new SAN_PHAM();
                sp.MaSanPham = dr[0].ToString();
                sp.tensanpham = dr[1].ToString();
                sp.Hinhanh = dr[2].ToString();
                sp.MoTa = dr[3].ToString();

                sp.Stars = int.Parse(dr[4].ToString());
                sp.DonViTinh = dr[5].ToString();
                sp.Giaban = int.Parse(dr[6].ToString());
                sp.Giamoi = giaBan - giaBan * phanTram / 100;
                li.Add(sp);
            }
            return li;
        }
        // Lấy 
        // phân trang sản phẩm theo hoàng
        //phân trang sản phẩm
        public IList<SAN_PHAM> getPageListProduct(int page,int pagesize)
        {
            DataTable dt = new DataTable();
            //lấy về các sản phẩm theo pagesize
            string cmdtext = string.Format(@"
                        Select PAAPT.*,PAAPDT.GiaBan - PAAPDT.GiaBan * PAAPDT.PhanTram / 100 N'Giá Khuyến Mại'
                            From ProductAndAllPriceTest PAAPT
                                 Left Join ProductAndAllPriceDiscountTest PAAPDT 
	                                 On PAAPT.MaSanPham = PAAPDT.MaSanPham
                                         Order By PAAPT.MaSanPham Asc Offset {1}*({0}-1) Rows Fetch next {1} rows only", page,pagesize);
            dt = DataAccessHelper.log(cmdtext);
            List<SAN_PHAM> li = new List<SAN_PHAM>();
            foreach (DataRow dr in dt.Rows)
            {
                SAN_PHAM sp = new SAN_PHAM();
                sp.MaLoaiSanPham = dr[0].ToString();
                sp.MaSanPham = dr[1].ToString();
                sp.tensanpham = dr[2].ToString();
                sp.SoLuongnhap = int.Parse(dr[3].ToString());
                sp.SoLuongban = int.Parse(dr[4].ToString());
                sp.soluongCon = int.Parse(dr[5].ToString());
                sp.Hinhanh = dr[6].ToString();
                sp.DonViTinh = dr[7].ToString();
                sp.MoTa = dr[8].ToString();
                sp.Stars = int.Parse(dr[9].ToString());
                sp.Giaban = int.Parse(dr[10].ToString());
                sp.Tenloaisanpham = dr[11].ToString();
                try
                {
                    sp.Giamoi= int.Parse(dr[12].ToString());
                }
                catch { }
                
                li.Add(sp);
            }
            return li;



        }    
        //lấy về sl sản phẩm
        public int getslsp(string maloai)
        {
       
            DataTable dt = new DataTable();

            string cmdtext = string.Format(@"select count(masanpham) from [dbo].[SAN_PHAM] where maloaisanpham like '%{0}%'",maloai);
            dt = DataAccessHelper.log(cmdtext);
            return  int.Parse( dt.Rows[0][0].ToString());
        }

    }
}
