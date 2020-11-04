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
        public IList<LOAI_SAN_PHAM> getAllLsp()
        { 
            string cmdtext = "select * from [dbo].[LOAI_SAN_PHAM]";
            SqlDataReader read = DataAccessHelper.getallLsp(DataAccessHelper.ConnectionString,cmdtext);
            IList<LOAI_SAN_PHAM> list = new List<LOAI_SAN_PHAM>();
            while (read.Read())
            {
                list.Add(new LOAI_SAN_PHAM(read["MaLoaiSanPham"].ToString(), read["TenLoaiSanPham"].ToString(), read["MoTa"].ToString()));
            }
            read.Dispose();
            return list;
        }
    }
}
