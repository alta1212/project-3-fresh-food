using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO_Data_Access_Object_
{
    public class LOAI_SAN_PHAM_DAO
    {
        private const string parm_MaLoaiSanPham = "@MaLoaiSanPham";
        private const string parm_TenLoaiSanPham = "@TenLoaiSanPham";
        private const string parm_Mota = "@MoTa";
        public IList<LOAI_SAN_PHAM> GetAllLSPInShop() // in admin in shoping left -->inner
            // in shoping 
        {
            DataTable dt = new DataTable();
            string cmdText = string.Format(@"
                Select LSP.*, Count(SP.MaLoaiSanPham) as 'Số lượng' From [dbo].[LOAI_SAN_PHAM] LSP
                    inner join [dbo].[SAN_PHAM] SP
                    On LSP.MaLoaiSanPham = SP.MaLoaiSanPham
                        Group By LSP.MaLoaiSanPham, LSP.TenLoaiSanPham, LSP.MoTa");
            dt = DataAccessHelper.log(cmdText);
            List<LOAI_SAN_PHAM> li = new List<LOAI_SAN_PHAM>();
            foreach (DataRow dr in dt.Rows)
            {
                LOAI_SAN_PHAM lsp = new LOAI_SAN_PHAM();
                lsp.maloaisanpham = dr[0].ToString();
                lsp.tenloaisanpham = dr[1].ToString();
                lsp.mota = dr[2].ToString();
                lsp.soLuong = int.Parse(dr[3].ToString());
                li.Add(lsp);
            }
            return li;
        }

        public void XoaLsp(string ml)
        {
            DataAccessHelper.exec(string.Format("delete LOAI_SAN_PHAM where MaLoaiSanPham='{0}'",ml));
        }

        public IList<LOAI_SAN_PHAM> GetAllLSPInAdmin(string page) // in admin in shoping left -->inner
                                                // in shoping 
        {
            DataTable dt = new DataTable();
            string cmdText = string.Format(@"Select LSP.*, Count(SP.MaLoaiSanPham) as 'Số lượng' From [dbo].[LOAI_SAN_PHAM] LSP
                    left join [dbo].[SAN_PHAM] SP
                    On LSP.MaLoaiSanPham = SP.MaLoaiSanPham
                        Group By LSP.MaLoaiSanPham, LSP.TenLoaiSanPham, LSP.MoTa
							order by LSP.MaLoaiSanPham Desc Offset 10*({0}-1) Rows Fetch Next 10 Rows Only",page);
            dt = DataAccessHelper.log(cmdText);
            List<LOAI_SAN_PHAM> li = new List<LOAI_SAN_PHAM>();
            foreach (DataRow dr in dt.Rows)
            {
                LOAI_SAN_PHAM lsp = new LOAI_SAN_PHAM();
                lsp.maloaisanpham = dr[0].ToString();
                lsp.tenloaisanpham = dr[1].ToString();
                lsp.mota = dr[2].ToString();
                lsp.soLuong = int.Parse(dr[3].ToString());
                li.Add(lsp);
            }
            return li;
        }
    }
}
