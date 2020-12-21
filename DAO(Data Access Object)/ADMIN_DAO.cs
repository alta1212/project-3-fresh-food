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
                ad.manhanvien = dr[0].ToString();
                ad.tennhanvien = dr[1].ToString();
                ad.maloainhanvien = dr[2].ToString();
                ad.gioitinh = dr[3].ToString();
                ad.ngaysinh = DateTime.Parse(dr[4].ToString());
                ad.ngayvaolam = DateTime.Parse(dr[5].ToString());
                ad.diachi = dr[6].ToString();
                ad.sodienthoai = dr[7].ToString();
                ad.email = dr[8].ToString();
                ad.matkhau = dr[9].ToString();
                ad.hinhanh = dr[10].ToString();
                li.Add(ad);
            }
            return li;
        }

        public void ComfimforgetPass(string confirmationCode, string pass)
        {
            DataAccessHelper.exec(string.Format("update NHAN_VIEN_ set matKhau='{0}' where confirmationCode='{1}'", confirmationCode, pass));
        }

        public void addConfirmCode(string manv, string confirmationCode)
        {
            DataAccessHelper.exec(string.Format("update NHAN_VIEN_ set confirmationCode='{0}' where MaNhanVien='{1}'",confirmationCode,manv));
        }

        public int changPassWord(ADMIN nv, string newPass)
        {
            SqlParameter[] parm = new SqlParameter[]
               {

                new SqlParameter("@maNhanVien",SqlDbType.NVarChar,20),
                new SqlParameter("@matKhauCu",SqlDbType.NVarChar,100),
                new SqlParameter("@matKhau",SqlDbType.NVarChar,100)
               };
            parm[0].Value = nv.manhanvien;
            parm[1].Value = nv.matkhau;
            parm[2].Value = newPass;
            return int.Parse(DataAccessHelper.parnWithValue("@rowEffect", DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "ChangePass", parm).ToString());
        }

        public void editProFile(ADMIN nv)
        {
            SqlParameter[] parm = new SqlParameter[]
            {

                new SqlParameter("@maNhanVien",SqlDbType.NVarChar,20),
                new SqlParameter("@tenNhanVien",SqlDbType.NVarChar,100),
                new SqlParameter("@gioiTinh",SqlDbType.NVarChar,5),
                new SqlParameter("@ngaySinh",SqlDbType.Date),
                new SqlParameter("@diaChi",SqlDbType.NVarChar,200),
                new SqlParameter("@SodienThoai",SqlDbType.NVarChar,14),
                new SqlParameter("@Email",SqlDbType.NVarChar,50),
                new SqlParameter("@HinhAnh",SqlDbType.NVarChar,50),
            };
            parm[0].Value = nv.manhanvien;
            parm[1].Value = nv.tennhanvien;
            parm[2].Value = nv.gioitinh;
            parm[3].Value = DateTime.Parse(nv.ngaysinh.ToString());
            parm[4].Value = nv.diachi;
            parm[6].Value = nv.email;
            parm[7].Value = nv.hinhanh;
            parm[5].Value = nv.sodienthoai;

            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Edit_Profile", parm);
        }

        public object adType()
        {
            DataTable dt = new DataTable();
            string cmdtext = string.Format("select * from LOAI_NHAN_VIEN_");
            dt = DataAccessHelper.log(cmdtext);
            List<AdminType> li = new List<AdminType>();
            foreach (DataRow dr in dt.Rows)
            {
                AdminType ad = new AdminType();
                ad.maLoaiNhanVien = dr[0].ToString();
                ad.tenLoaiNhanVien = dr[1].ToString();
                ad.mota = dr[2].ToString();
                li.Add(ad);
            }
            return li;
        }

        public void add_NhanVien(ADMIN nv)
        {
            SqlParameter[] parm = new SqlParameter[]
             {

                new SqlParameter("@TenNhanVien",SqlDbType.NVarChar,100),
                new SqlParameter("@GioiTinh",SqlDbType.NVarChar,5),
                new SqlParameter("@NgaySinh",SqlDbType.Date),
                new SqlParameter("@DiaChi",SqlDbType.NVarChar,200),
                new SqlParameter("@Email",SqlDbType.NVarChar,100),
                new SqlParameter("@MaLoaiNhanVien",SqlDbType.NVarChar,20),
                new SqlParameter("@HinhAnh",SqlDbType.NVarChar,50),
                new SqlParameter("@SDT",SqlDbType.NVarChar,14),
             };
            parm[0].Value = nv.tennhanvien;
            parm[1].Value = nv.gioitinh;
            parm[2].Value = DateTime.Parse(nv.ngaysinh.ToString());
            parm[3].Value = nv.diachi;
            parm[4].Value = nv.email;
            parm[5].Value = nv.maloainhanvien;
            parm[6].Value = nv.hinhanh;
            parm[7].Value = nv.sodienthoai;

            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Add_User", parm);
        }

        public void addPrice(Price_DTO pr)
        {
            SqlParameter[] parm = new SqlParameter[]
             {

                new SqlParameter("@maSanPham",SqlDbType.NVarChar,50),
                new SqlParameter("@giaBan",SqlDbType.Int),
                new SqlParameter("@ngayApDung",SqlDbType.DateTime),
                new SqlParameter("@ngayKetThuc",SqlDbType.DateTime),

             };
      
            parm[0].Value = pr.maSanPham;
            parm[1].Value = pr.gia;
            parm[2].Value = DateTime.Parse(pr.ngayBatDau.ToString());
            parm[3].Value = DateTime.Parse(pr.ngayKetThuc.ToString());

            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "addPrice", parm);
        }

        public void deltePrice(string ma)
        {
            DataAccessHelper.exec(string.Format("delete gia_ban where magiaban='{0}'", ma));
        }

        public void editPrice(Price_DTO pr)
        {
            SqlParameter[] parm = new SqlParameter[]
             {
                new SqlParameter("@maGiaBan",SqlDbType.NVarChar,50),
                new SqlParameter("@maSanPham",SqlDbType.NVarChar,50),
                new SqlParameter("@giaBan",SqlDbType.Int),
                new SqlParameter("@ngayApDung",SqlDbType.DateTime),
                new SqlParameter("@ngayKetThuc",SqlDbType.DateTime),

             };
            parm[0].Value = pr.maGiaBan;
            parm[1].Value = pr.maSanPham;
            parm[2].Value = pr.gia;
            parm[3].Value = DateTime.Parse(pr.ngayBatDau.ToString());
            parm[4].Value = DateTime.Parse(pr.ngayKetThuc.ToString());

            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "EditPrice", parm);
        }

        public object getInfoPrice(string magia)
        {
            DataTable dt = new DataTable();
            string cmdtext = string.Format(@"Select gb.*,sp.tensanpham From dbo.gia_ban  gb Left Join dbo.san_pham sp
                                                On gb.MaSanPham = sp.MaSanPham
												where magiaban='{0}'
                                                Order By magiaban",magia);
            dt = DataAccessHelper.log(cmdtext);
            return listgia(dt);
        }

        public IList<Price_DTO> getPrice()
        {
            DataTable dt = new DataTable();
            string cmdtext = string.Format(@"Select gb.*,sp.tensanpham From dbo.gia_ban  gb Left Join dbo.san_pham sp
                                                On gb.MaSanPham = sp.MaSanPham
                                                Order By magiaban");
            dt = DataAccessHelper.log(cmdtext);
            return listgia(dt);

        }

        public int add(ADMIN adm)
        {
            throw new NotImplementedException();
        }

        public void themSp(SAN_PHAM sp)
        {
            SqlParameter[] parm = new SqlParameter[]
             {
                new SqlParameter("@MaLoaiSanPham",SqlDbType.NVarChar,50),
                new SqlParameter("@TenSanPham",SqlDbType.NVarChar,50),
                new SqlParameter("@SoluongNhap",SqlDbType.Int),
                new SqlParameter("@HinhAnh",SqlDbType.NVarChar,50),
                new SqlParameter("@DonViTinh",SqlDbType.NVarChar,50),
                new SqlParameter("@MoTa",SqlDbType.NVarChar,500),
                new SqlParameter("@GiaBan",SqlDbType.Int),
             };
            parm[0].Value = sp.MaLoaiSanPham;
            parm[1].Value = sp.tensanpham;
            parm[2].Value = sp.SoLuongnhap;
            parm[3].Value = sp.Hinhanh;
            parm[4].Value = sp.DonViTinh;
            parm[5].Value = sp.MoTa;
            parm[6].Value = sp.Giaban;
            DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Insert_Into_Product", parm);
        }

        public int themlsp(LOAI_SAN_PHAM lsp)
        {
            SqlParameter[] parm = new SqlParameter[]
             {
                new SqlParameter("@MaLoaiSanPhams",SqlDbType.NVarChar,20),
                new SqlParameter("@TenLoaiSanPham",SqlDbType.NVarChar,100),
                new SqlParameter("@MoTa",SqlDbType.NVarChar,350),

             };

            parm[0].Value = lsp.MaLoaiSanPham ?? DBNull.Value.ToString();
            parm[1].Value = lsp.tenloaisanpham;
            parm[2].Value = lsp.MoTa;
            try
            {
                DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Insert_Auto_Product_Type", parm);
                return 1;
            }
            catch
            {
                return 0;
            }
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
        public IList<Order_DTO> getListOrder(string pagesize)
        {
            DataTable dt = new DataTable();
            string cmdText = string.Format(@"Select DH.*,NV.TenNhanVien From dbo.DON_HANG  DH Left Join dbo.Nhan_Vien_ NV
	On DH.MaNhanVien = NV.MaNhanVien 
		Order By MaDonHang Desc Offset 0 Rows Fetch Next {0} Rows Only", pagesize);
            dt = DataAccessHelper.log(cmdText);
            List<Order_DTO> li = new List<Order_DTO>();
            foreach (DataRow dr in dt.Rows)
            {
                Order_DTO or = new Order_DTO();
                or.MaDonHang = dr[0].ToString();
                or.MaKhachhang = dr[1].ToString();
                or.MaNhanVien = dr[2].ToString();
                or.TrangThai = int.Parse(dr[3].ToString());
                or.TongTien = int.Parse(dr[4].ToString());
                or.NgayMua = DateTime.Parse(dr[5].ToString());
                try { or.NgayXacThuc = DateTime.Parse(dr[6].ToString()); }
                catch { }

                or.SoDienThoai = dr[7].ToString();
                or.DiaChi = dr[8].ToString();
                or.TenNhanVien = dr[9].ToString();
                li.Add(or);
            }
            return li;
        }
        public IList<Price_DTO> listgia(DataTable dt)
        {
            List<Price_DTO> li = new List<Price_DTO>();
            foreach (DataRow dr in dt.Rows)
            {
                Price_DTO pr = new Price_DTO();
                pr.maGiaBan = dr[0].ToString();
                pr.maSanPham = dr[1].ToString();
                pr.gia = int.Parse(dr[2].ToString());
                pr.ngayBatDau = DateTime.Parse(dr[3].ToString());
                try { pr.ngayKetThuc = DateTime.Parse(dr[4].ToString()); }
                catch { }
                pr.tenSanPham = dr[5].ToString();
                li.Add(pr);
            }
            return li;
        }
    }
}
