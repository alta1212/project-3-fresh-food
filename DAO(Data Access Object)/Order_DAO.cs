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
        public void placeOrder(IList<Cart_DTO> lists,  string diaChi, string sdt,string maKhachHang,string tongtien,string dongia)
        {


            SqlParameter[] parm = new SqlParameter[]
            {
                 new SqlParameter("@MaSanPham",SqlDbType.NVarChar,50),
                 new SqlParameter("@SoLuong",SqlDbType.Int),
                 new SqlParameter("@DonGia",SqlDbType.Int),
                 new SqlParameter("@TongTien",SqlDbType.Int),
                 new SqlParameter("@MaDonHang",SqlDbType.NVarChar,100),
            };
            SqlParameter[] parmbill = new SqlParameter[]
            {
            
                 new SqlParameter("@MaKhachHang",SqlDbType.NVarChar,100),
                 new SqlParameter("@DiaChi",SqlDbType.NVarChar,50),
                 new SqlParameter("@SoDienThoai",SqlDbType.NVarChar,50),
                 new SqlParameter("@TongTien",SqlDbType.NVarChar,50),
                 //new SqlParameter("@MaDonHang",SqlDbType.NVarChar,100),
            };
            parmbill[0].Value = maKhachHang;
            parmbill[1].Value = diaChi;
            parmbill[2].Value = sdt;
            parmbill[3].Value = tongtien;
            //parmbill[4].Value = "";
            var value=  DataAccessHelper.parnWithValue("@MaDonHang",DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Add_To_Bill", parmbill);
            foreach (var item in lists)
            {
                parm[0].Value = item.MaSanPham;
                parm[1].Value = item.SoLuong;
                parm[2].Value = dongia;
                parm[3].Value = tongtien;
                parm[4].Value = value;
                DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Add_To_Bill_Detail", parm);
            }
            SqlParameter[] parmDeleteCart = new SqlParameter[]
            {
                new SqlParameter("@MaKhachHang",SqlDbType.NVarChar,100),
            };
            parmDeleteCart[0].Value = maKhachHang;
            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Delete_To_Cart", parmDeleteCart);

        }

    }
}
