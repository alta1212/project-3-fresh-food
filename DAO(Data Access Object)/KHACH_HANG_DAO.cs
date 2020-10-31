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
    public class KHACH_HANG_DAO
    {
        private const string parm_MaKhachHang= "@MaKhachHang";
        private const string parm_TaiKhoan= "@TaiKhoan";
        private const string parm_MatKhau= "@MatKhau";
        private const string parm_NgayTao= "@NgayTao";
        private const string parm_Email= "@Email";
        private const string parm_Active= "@active";
        private const string parm_VerificationCode= "@VerificationCode";

        public int Active(string guild)
        {

            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(parm_VerificationCode,SqlDbType.NVarChar,40),
            };
            parm[0].Value = guild;

           return DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "activeacc", parm);
        }

        public void resend(string tk,string mail, string code)
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

        public bool Login(KHACH_HANG kHACH_HANG)
        {
            string cmdtext = string.Format("Select * from KHACH_HANG WHERE Taikhoan='{0}' and matkhau= '{1}'",kHACH_HANG.taikhoan,kHACH_HANG.matkhau);
            return DataAccessHelper.ExecuteNonQueryWithoutProcedure(DataAccessHelper.ConnectionString,cmdtext);
        }

        public int register(KHACH_HANG kHACH_HANG,string code)
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
            parm[0].Value = kHACH_HANG.taikhoan+"mkh";
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
