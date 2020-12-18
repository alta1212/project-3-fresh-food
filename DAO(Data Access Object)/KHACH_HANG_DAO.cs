using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using tool;

namespace DAO_Data_Access_Object_
{
    public class KHACH_HANG_DAO
    {
        Class1 to = new Class1();
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
        private const string parm_IdFaceBook = "@IdFaceBook";
        public int Active(string guild)
        {

            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter(parm_VerificationCode,SqlDbType.NVarChar,40),
            };
            parm[0].Value = guild;

            return DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "activeacc", parm);
        }

        public object LoginGoogle(KHACH_HANG kh)
        {
            SqlParameter[] parm = new SqlParameter[]
                {
                 new SqlParameter("@IDGoogle",SqlDbType.NVarChar,100),
                 new SqlParameter("@TenKhachHang",SqlDbType.NVarChar,100),
                 new SqlParameter("@HinhAnh",SqlDbType.NVarChar,200),
                 new SqlParameter("@mail",SqlDbType.NVarChar,200),
                };
            parm[0].Value = kh.makhachhang;
            parm[1].Value = kh.TenKhachHang;
            parm[2].Value = kh.AnhDaiDien; ;
            parm[3].Value = kh.email;
            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "login_google", parm);
            string cmdtext = string.Format(@"select * from KHACH_HANG where MaKhachHang='{0}' or Email='{1}'",kh.makhachhang,kh.email);

            return list(cmdtext);
        }

        public IList<KHACH_HANG> list(string cmdtext)
        {
            DataTable dt = new DataTable();
            dt = DataAccessHelper.log(cmdtext);
            List<KHACH_HANG> li = new List<KHACH_HANG>();
            foreach (DataRow dr in dt.Rows)
            {
                KHACH_HANG sp = new KHACH_HANG();
                sp.MaKhachhang = dr[0].ToString();
                sp.TaiKhoan = dr[1].ToString();
                sp.MatKhau = dr[2].ToString();
                sp.ngayTao = DateTime.Parse(dr[3].ToString());
                sp.TenKhachHang = dr[4].ToString();
                sp.Email = dr[5].ToString();
                sp.SoDienThoai = dr[6].ToString();
                try
                {
                    sp.DateOfBirth = DateTime.Parse(dr[7].ToString());
                    sp.Sex = int.Parse(dr[8].ToString());
                }
                catch { }

                sp.Adress = dr[9].ToString();
                sp.IDFacebook = dr[10].ToString();
                sp.MaGioHang = dr[11].ToString();
                sp.MaFeedBack = dr[12].ToString();
                sp.AnhDaiDien = dr[13].ToString();
                sp.verificationcode = dr[14].ToString();
                sp.active = dr[15].ToString();

                li.Add(sp);
            }
            return li;
        }

        // Lấy thông tin của khách hàng
        public IList<KHACH_HANG> Log(string tk, string mk)
        {

          
            string cmdtext = string.Format("Select * from KHACH_HANG WHERE Taikhoan='{0}' and matkhau= '{1}'", tk, mk);
           
            return list(cmdtext);

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
                new SqlParameter(parm_AnhDaiDien,SqlDbType.NVarChar,200),
                new SqlParameter(parm_IdFaceBook,SqlDbType.NVarChar,50)
            };
            if(tk==null&& mk == null)
            {
                parm[0].Value = "đay là giữ chỗ cho khỏi null :) b làm cho nó có thể truyền vào null đi";
                parm[1].Value = "hold";
            }    
            else
            {
                parm[0].Value = tk;
                parm[1].Value = mk;
            }    
           
            parm[2].Value = kHACH_HANG.tenkhachhang;
            parm[3].Value = kHACH_HANG.adress;
            parm[4].Value = kHACH_HANG.sodienthoai;
            parm[5].Value = kHACH_HANG.Sex;
            parm[6].Value = kHACH_HANG.dateofbirth;
            parm[7].Value = kHACH_HANG.anhdaidien;
            if(kHACH_HANG.idFacebook==null)
            parm[8].Value = "hold";
            else
                parm[8].Value = kHACH_HANG.idFacebook;

            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "fillinfo", parm);
        }

        public IList<KHACH_HANG> LoginFaceBook(KHACH_HANG kHACH_HANG)
        {
            if(kHACH_HANG.TenKhachHang!=null)
            {
                SqlParameter[] parm = new SqlParameter[]
                {
                 new SqlParameter("@IDFaceBook",SqlDbType.NVarChar,100),
                 new SqlParameter("@TenKhachHang",SqlDbType.NVarChar,100),
                 new SqlParameter("@HinhAnh",SqlDbType.NVarChar,200),
                };
                parm[0].Value = kHACH_HANG.idFacebook;
                parm[1].Value = kHACH_HANG.TenKhachHang;
                parm[2].Value = kHACH_HANG.AnhDaiDien; ;
                DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Login_FaceBook", parm);

            }

            string cmdtext = string.Format(@"Select  * From dbo.KHACH_HANG
                                                        Where IDFaceBook ='{0}'
                                                        ", kHACH_HANG.idFacebook);
            
            return list(cmdtext);

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
