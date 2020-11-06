using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO_Data_Access_Object_
{
    public class SAN_PHAM_DAO
    {
        public IList<SAN_PHAM> getallsp()
        {
            DataTable dt = new DataTable();
            string cmdtext = string.Format("SELECT TOP 6 *  FROM [dbo].[SAN_PHAM] order by NEWID()");//lấy về 6 sản phẩm ngẫu nhiên để tạo
            dt = DataAccessHelper.log(cmdtext);
            List<SAN_PHAM> li = new List<SAN_PHAM>();
            foreach (DataRow dr in dt.Rows)
            {
                SAN_PHAM sp = new SAN_PHAM();
                sp.maloaisanpham = dr[0].ToString();
                sp.masanpham = dr[1].ToString();
                sp.tensanpham = dr[2].ToString();
                sp.soluongnhap= int.Parse(dr[3].ToString());
                sp.soluongban = int.Parse(dr[4].ToString());
                sp.hinhanh = dr[6].ToString();
                sp.donvitinh = dr[7].ToString();
                sp.mota = dr[8].ToString();
                li.Add(sp);
            }
            return li;
        }

        public IList<SAN_PHAM> getLatestSp()
        {
            throw new NotImplementedException();
        }
    }
}
