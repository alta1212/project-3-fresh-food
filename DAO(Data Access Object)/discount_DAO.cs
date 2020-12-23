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
                Discount_DTO sp = new Discount_DTO();
                sp.MaChietKhau = dr[0].ToString();
                sp.start = DateTime.Parse(dr[1].ToString());
                sp.end = DateTime.Parse(dr[2].ToString());
                sp.PhanTram = int.Parse(dr[3].ToString());
                sp.TienToiThieu = int.Parse(dr[4].ToString());
                sp.TienToiDa = int.Parse(dr[5].ToString());
                sp.HinhAnh = dr[6].ToString();
                li.Add(sp);
            }
            return li;
        }
    }
}
