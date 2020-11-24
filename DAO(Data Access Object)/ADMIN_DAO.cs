using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DAO_Data_Access_Object_
{

    public class ADMIN_DAO
    {
        public IList<ADMIN> login(string tk, string mk)
        {
            DataTable dt = new DataTable();
            string cmdtext = string.Format("select * from NHAN_VIEN_ where Email='{0}' and matKhau='{1}'", tk, mk);
            dt = DataAccessHelper.log(cmdtext);
            List<ADMIN> li = new List<ADMIN>();
            foreach (DataRow dr in dt.Rows)
            {
                ADMIN ad = new ADMIN();
                ad.manhanvien =dr[0].ToString();
                ad.tennhanvien = dr[1].ToString();
                ad.maloainhanvien = dr[2].ToString();
                ad.gioitinh = dr[3].ToString();
                ad.ngaysinh = DateTime.Parse(dr[4].ToString());
                ad.ngayvaolam = DateTime.Parse(dr[5].ToString());
                ad.diachi = dr[6].ToString();
                ad.quyenhan = dr[7].ToString();
                ad.sodienthoai = dr[8].ToString();
                ad.email = dr[9].ToString();
                ad.matkhau = dr[10].ToString();
                ad.hinhanh= dr[11].ToString();
                li.Add(ad);
            }
            return li;
        }

        public void themSp(SAN_PHAM sp)
        {
            SqlParameter[] parm = new SqlParameter[]
             {
                new SqlParameter("@MaSanPham",SqlDbType.NVarChar,20),
                new SqlParameter("@MaLoaiSanPham",SqlDbType.NVarChar,50),
                new SqlParameter("@TenSanPham",SqlDbType.NVarChar,50),
                new SqlParameter("@SoLuongCon",SqlDbType.Int),
                new SqlParameter("@Soluong",SqlDbType.Int),
                new SqlParameter("@HinhAnh",SqlDbType.NVarChar,50),
                new SqlParameter("@DonViTinh",SqlDbType.NVarChar,50),
                new SqlParameter("@MoTa",SqlDbType.NVarChar,500),
                new SqlParameter("@GiaBan",SqlDbType.Int),
             };
            parm[0].Value = sp.MaSanPham;
            parm[1].Value = sp.Tenloaisanpham;
            parm[2].Value = sp.tensanpham;
            parm[3].Value = sp.soluongCon;
            parm[4].Value = sp.SoLuongnhap;
            parm[5].Value = sp.Hinhanh;
            parm[6].Value = sp.DonViTinh;
            parm[7].Value = sp.MoTa;
            parm[7].Value = sp.Giaban;
            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Insert_Into_Product", parm);
        }

        public void themlsp(LOAI_SAN_PHAM lsp)
        {
            SqlParameter[] parm = new SqlParameter[]
             {
               
                new SqlParameter("@TenLoaiSanPham",SqlDbType.NVarChar,50),
                new SqlParameter("@MoTa",SqlDbType.NVarChar,50),

             };
    
            parm[0].Value = lsp.tenloaisanpham;
            parm[1].Value = lsp.MoTa;
            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Insert_Auto_Product_Type", parm);
        }

        public IList<dashBroad> dash()
        {
            DataTable dt = new DataTable();
            string cmdtext = string.Format(@"select count(distinct KHACH_HANG.MaKhachHang) ,
       count(distinct SAN_PHAM.MaSanPham),
       COUNT(distinct DON_HANG.MaDonHang)
       from SAN_PHAM, KHACH_HANG, DON_HANG");
            dt = DataAccessHelper.log(cmdtext);
            List<dashBroad> li = new List<dashBroad>();
            foreach (DataRow dr in dt.Rows)
            {
                dashBroad ad = new dashBroad();
                ad.user = dr[0].ToString();
                ad.product = dr[1].ToString();
                ad.order = dr[2].ToString();
                
                li.Add(ad);
            }
            return li;
            
        }
    }
}
