using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL_Business_Logic_Layer__;
using DAO_Data_Access_Object_;
using DTO_Data_Transfer_Object_;
using BLL_Business_Logic_Layer__.ServiceInterface;

namespace BLL_Business_Logic_Layer__
{
    public class Cart_BLL : ICart

    {
        Cart_DAO cart_DAO = new Cart_DAO();
        public IList<Cart_DTO> GetAllProductInCart(string maKhachHang)
        {
            return cart_DAO.GetAllProductInCart(maKhachHang);   
        }
    }
}
