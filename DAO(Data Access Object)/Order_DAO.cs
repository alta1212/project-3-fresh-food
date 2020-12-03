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
   public class Order_DAO
    {
        public void placeOrder(IList<Cart_DTO> lists,  string diaChi, string sdt,string maKhachHang,string tongtien)
        {


            SqlParameter[] parm = new SqlParameter[]
            {
                 new SqlParameter("@MaSanPham",SqlDbType.NVarChar,50),
                 new SqlParameter("@SoLuong",SqlDbType.NVarChar,50),
                 new SqlParameter("@DonGia",SqlDbType.NVarChar,50),
                 new SqlParameter("@MaKhachHang",SqlDbType.NVarChar,50),
                 new SqlParameter("@DiaChi",SqlDbType.NVarChar,50),
                 new SqlParameter("@SoDienThoai",SqlDbType.NVarChar,50),
                 new SqlParameter("@TongTien",SqlDbType.NVarChar,50),
            };
            parm[3].Value = maKhachHang;
            parm[4].Value = diaChi;
            parm[5].Value = sdt;
            parm[6].Value = tongtien;
            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Add_To_Bill", parm);
            foreach (var item in lists)
            {
                parm[0].Value = item.MaSanPham;
                parm[1].Value = item.SoLuong;
                parm[2].Value = item.TongTien;
                parm[3].Value = maKhachHang;
                parm[4].Value = diaChi;
                parm[5].Value = sdt;

                DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Add_To_Bill_Detail", parm);
            }



        }

    }
}
