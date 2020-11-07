using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Data;

namespace DAO_Data_Access_Object_
{
    public class SAN_PHAM_DAO
    {
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
                sp.masanpham = dr[0].ToString();
                sp.tensanpham = dr[1].ToString();
                sp.hinhanh = dr[2].ToString();
                sp.mota = dr[3].ToString();
                
                sp.stars = int.Parse(dr[4].ToString());
                sp.donvitinh = dr[5].ToString();
                sp.giaban = int.Parse(dr[6].ToString());
                li.Add(sp);
            }
            return li;
        }

        public IList<SAN_PHAM> getLatestSp()
        {
            throw new NotImplementedException();
        }
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
                sp.masanpham = dr[0].ToString();
                sp.tensanpham = dr[1].ToString();
                sp.hinhanh = dr[2].ToString();
                sp.mota = dr[3].ToString();

                sp.stars = int.Parse(dr[4].ToString());
                sp.donvitinh = dr[5].ToString();
                sp.giaban = int.Parse(dr[6].ToString());
                li.Add(sp);
            }
            return li;
        }
    }
}
