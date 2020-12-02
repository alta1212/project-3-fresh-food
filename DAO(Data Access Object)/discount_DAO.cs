using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO_Data_Transfer_Object_;

namespace DAO_Data_Access_Object_
{
    public class Discount_DAO
    {
        public IList<Discount_DTO> getall()
        {
            DataTable dt = new DataTable();
            string cmdText = string.Format(@"
                    select * from chiet_khau 
                        where getdate() between ngaybatdau and ngayketthuc
                            order by SoTienToiDa ASC");
            dt = DataAccessHelper.log(cmdText);
            List<Discount_DTO> li = new List<Discount_DTO>();
            foreach (DataRow dr in dt.Rows)
            {
                Discount_DTO lsp = new Discount_DTO();
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
