using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO_Data_Transfer_Object_;

namespace DAO_Data_Access_Object_
{
    public class discount_DAO
    {
        public IList<discount_DTO> getall()
        {
            DataTable dt = new DataTable();
            string cmdText = string.Format(@"select * from chiet_khau where getdate() between ngaybatdau and ngayketthuc");
            dt = DataAccessHelper.log(cmdText);
            List<discount_DTO> li = new List<discount_DTO>();
            foreach (DataRow dr in dt.Rows)
            {
                discount_DTO lsp = new discount_DTO();
                lsp.MaChietKhau = dr[0].ToString();
                lsp.start = DateTime.Parse(dr[1].ToString());
                lsp.end = DateTime.Parse( dr[2].ToString());
                lsp.PhanTram = int.Parse(dr[3].ToString());
                lsp.TienToiThieu = int.Parse(dr[4].ToString());
                lsp.TienToiDa = int.Parse(dr[5].ToString());
                li.Add(lsp);
            }
            return li;
        }
    }
}
