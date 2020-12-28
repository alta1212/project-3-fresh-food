using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO_Data_Transfer_Object_;
using System.Data;
using System.Data.SqlClient;

namespace DAO_Data_Access_Object_
{
    public class Cart_DAO
    {
        Cart_DTO cart_DTO = new Cart_DTO();
        public IList<Cart_DTO> GetAllProductInCart(string magiohang)
        {
            List<Cart_DTO> listCart_DTOs = new List<Cart_DTO>();
            DataTable dt = new DataTable();
            string strQuery = string.Format(@"
                    Select PAAPT.MaSanPham,PAAPT.TenSanPham,PAAPT.HinhAnh,PAAPT.DonViTinh,
	                    PAAPT.GiaBan,PAAPDT.GiaBan - PAAPDT.GiaBan * PAAPDT.PhanTram / 100 N'Giá Khuyến Mại', CTGH.SoLuong,CTGH.MaChITietGioHang
                            From ProductAndAllPriceTest PAAPT
                                 Left Join ProductAndAllPriceDiscountTest PAAPDT 
	                                 On PAAPT.MaSanPham = PAAPDT.MaSanPham
										Inner Join  dbo.Chi_Tiet_Gio_Hang CTGH
											On CTGH.MaSanPHam = PAAPT.MaSanPHam
												Where CTGH.MaGioHang = '{0}' 
                            ", magiohang);
            dt = DataAccessHelper.log(strQuery);
            foreach (DataRow Cart in dt.Rows)
            {
                Cart_DTO cart = new Cart_DTO();
                cart.MaSanPham = Cart[0].ToString();
                cart.TenSanPham = Cart[1].ToString();
                cart.HinhAnh = Cart[2].ToString();
                cart.DonViTinh = Cart[3].ToString();
                cart.GiaBan = int.Parse(Cart[4].ToString());
                cart.SoLuong = int.Parse(Cart[6].ToString());
                try
                { 
                    cart.GiaGiam = int.Parse(Cart[5].ToString());
                    cart.ThanhTien = cart.GiaGiam;
                }
                catch
                {
                    cart.GiaGiam = 0;
                    cart.ThanhTien = cart.GiaBan;
                }
                cart.MaChiTietGioHang= Cart[7].ToString();

                listCart_DTOs.Add(cart);
            }
            return listCart_DTOs;
        }

        public void deleteCart(string maChiTietcart)
        {
            DataAccessHelper.exec(string.Format("delete CHI_TIET_GIO_HANG where MaChITietGioHang='{0}'", maChiTietcart));
        }

        public void UpdateAmountInCartDetails(List<Cart_DTO> listInCarts)
        {
            SqlParameter [] parm = new SqlParameter[] 
            {
                 new SqlParameter("@MaChiTietGioHang",SqlDbType.NVarChar,100),
                 new SqlParameter("@SoLuong",SqlDbType.NVarChar,200),
            };
            foreach (var item in listInCarts)
            {
                parm[0].Value = item.MaChiTietGioHang;
                parm[1].Value = item.SoLuong;
                DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Update_Amount_In_Cart_Details", parm);
            }
            //string[] a = listInCarts as string[];
            //if (a != null)
            //{
            //    string[] sRes = a.OfType<string>().ToArray();
            //}
            //foreach (var item in listInCarts)
            //{
            //    parm[0].Value = cart_DTO.MaGioHang;
            //    parm[1].Value = cart_DTO.MaSanPham;
            //    parm[2].Value = cart_DTO.SoLuong;
            //    DataAccessHelper.ExecuteNonQuery(DataAccessHelper.ConnectionString, CommandType.StoredProcedure, "Update_Amount_In_Cart_Details", parm);
            //}
        }

        public int GetDiscount(DateTime dateTime)
        {
            int perCent = 0;
            return perCent;
        }
    }
}
