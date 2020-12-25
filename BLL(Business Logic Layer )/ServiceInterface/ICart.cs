using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO_Data_Transfer_Object_;

namespace BLL_Business_Logic_Layer__.ServiceInterface
{
    public interface ICart
    {
        IList<Cart_DTO> GetAllProductInCart(string maKhachHang);
        void UpdateAmountInCartDetails(Cart_DTO cart_DTO);
        void deleteCart(string maChiTietcart);
    }
}
