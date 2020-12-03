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
        public IList<Cart_DTO> GetAllProductInCart(string maKhachHang)
        {
            List<Cart_DTO> listCart_DTOs = new List<Cart_DTO>();
            DataTable dt = new DataTable();
            string strQuery = string.Format(@"
                    Select PAAPT.MaSanPham,PAAPT.TenSanPham,PAAPT.HinhAnh,PAAPT.DonViTinh,
	                    PAAPT.GiaBan,PAAPDT.GiaBan - PAAPDT.GiaBan * PAAPDT.PhanTram / 100 N'Giá Khuyến Mại', CTGH.SoLuong
                            From ProductAndAllPriceTest PAAPT
                                 Left Join ProductAndAllPriceDiscountTest PAAPDT 
	                                 On PAAPT.MaSanPham = PAAPDT.MaSanPham
										Inner Join  dbo.Chi_Tiet_Gio_Hang CTGH
											On CTGH.MaSanPHam = PAAPT.MaSanPHam
												Where CTGH.MaGioHang = '{0}' 
                            ", maKhachHang);
            dt = DataAccessHelper.log(strQuery);
            foreach (DataRow Cart in dt.Rows)
            {
                Cart_DTO cart = new Cart_DTO();
                cart.MaSanPham = Cart[0].ToString();
                cart.TenSanPham = Cart[1].ToString();
                cart.HinhAnh = Cart[2].ToString();
                cart.DonViTinh = Cart[3].ToString();
                cart.GiaBan = int.Parse(Cart[4].ToString());
                try
                { 
                    cart.GiaGiam = int.Parse(Cart[5].ToString());
                  
                }
                catch
                {
                    cart.GiaGiam = 0;
                    
                }
                cart.SoLuong = int.Parse(Cart[6].ToString());
                listCart_DTOs.Add(cart);
            }
            return listCart_DTOs;
        }

       
        public int GetDiscount(DateTime dateTime)
        {
            int perCent = 0;
            return perCent;
        }
    }
}
