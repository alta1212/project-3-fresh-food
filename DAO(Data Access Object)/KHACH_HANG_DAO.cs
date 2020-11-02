using DTO_Data_Transfer_Object_;
using System;
using System.Data;
using System.Data.SqlClient;

namespace DAO_Data_Access_Object_
{
    public class KHACH_HANG_DAO
    {
        private const string parm_MaKhachHang = "@MaKhachHang";
        private const string parm_TaiKhoan = "@TaiKhoan";
        private const string parm_MatKhau = "@MatKhau";
        private const string parm_NgayTao = "@NgayTao";
        private const string parm_Email = "@Email";
        private const string parm_Active = "@active";
        private const string parm_VerificationCode = "@VerificationCode";
        private const string parm_HoVaten = "@TenKhachHang";
        private const string parm_DiaChi = "@Address";
        private const string parm_SoDienThoai = "@SoDienThoai";
        private const string parm_GioiTinh = "@Sex";
        private const string parm_NgaySinh = "@DateOfBirth";
        private const string parm_AnhDaiDien = "@AnhDaiDien";
        public int Active(string guild)
        {

            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(parm_VerificationCode,SqlDbType.NVarChar,40),
            };
            parm[0].Value = guild;

            return DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "activeacc", parm);
        }

        public void fillinfo(string tk, string mk, KHACH_HANG kHACH_HANG)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(parm_TaiKhoan,SqlDbType.NVarChar,50),
                 new SqlParameter(parm_MatKhau,SqlDbType.NVarChar,50),
                  new SqlParameter(parm_HoVaten,SqlDbType.NVarChar,50),
                   new SqlParameter(parm_DiaChi,SqlDbType.NVarChar,50),
                    new SqlParameter(parm_SoDienThoai,SqlDbType.NVarChar,50),
                     new SqlParameter(parm_GioiTinh,SqlDbType.Bit),
                      new SqlParameter(parm_NgaySinh,SqlDbType.DateTime,50),
                      new SqlParameter(parm_AnhDaiDien,SqlDbType.NVarChar,50),
            };
            parm[0].Value = tk;
            parm[1].Value = mk;
            parm[2].Value = kHACH_HANG.tenkhachhang;
            parm[3].Value = kHACH_HANG.adress;
            parm[4].Value = kHACH_HANG.sodienthoai;
            parm[5].Value = kHACH_HANG.Sex;
            parm[6].Value = kHACH_HANG.dateofbirth;
            parm[7].Value = kHACH_HANG.anhdaidien;
            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "fillinfo", parm);
        }

        public void resend(string tk, string mail, string code)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(parm_TaiKhoan,SqlDbType.NVarChar,50),
                new SqlParameter(parm_Email,SqlDbType.NVarChar,50),
                new SqlParameter(parm_VerificationCode,SqlDbType.NVarChar,50),
            };
            parm[0].Value = tk;
            parm[1].Value = mail;
            parm[2].Value = code;
            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "resendmail", parm);

        }

        public (int, string) Login(KHACH_HANG kHACH_HANG)
        {
            string cmdtext = string.Format("Select tenkhachhang,active from KHACH_HANG WHERE Taikhoan='{0}' and matkhau= '{1}'", kHACH_HANG.taikhoan, kHACH_HANG.matkhau);
            return DataAccessHelper.dangnhap(DataAccessHelper.ConnectionString, cmdtext);
        }

        public int register(KHACH_HANG kHACH_HANG, string code)
        {
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(parm_MaKhachHang,SqlDbType.NVarChar,50),
                new SqlParameter(parm_TaiKhoan,SqlDbType.NVarChar,50),
                new SqlParameter(parm_MatKhau,SqlDbType.NVarChar,50),
                new SqlParameter(parm_NgayTao,SqlDbType.DateTime),
                new SqlParameter(parm_Email,SqlDbType.NVarChar,100),
                new SqlParameter(parm_Active,SqlDbType.Bit),
                new SqlParameter(parm_VerificationCode,SqlDbType.NVarChar,40),
            };
            parm[0].Value = kHACH_HANG.taikhoan + "mkh";
            parm[1].Value = kHACH_HANG.taikhoan;
            parm[2].Value = kHACH_HANG.matkhau;
            parm[3].Value = DateTime.Now.ToLongDateString();
            parm[4].Value = kHACH_HANG.email;
            parm[5].Value = false;
            parm[6].Value = code;
            return DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "register", parm);
        }
    }
}
