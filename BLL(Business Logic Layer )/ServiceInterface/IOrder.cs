using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO_Data_Access_Object_;
using DTO_Data_Transfer_Object_;
namespace BLL_Business_Logic_Layer__.ServiceInterface
{
   public interface IOrder
    {
        string placeOrder(IList<Cart_DTO> lists, string diaChi, string sdt, string maKhachHang,string tongtien,string dongia);
    }
}
