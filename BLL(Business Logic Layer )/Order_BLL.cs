using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL_Business_Logic_Layer__.ServiceInterface;
using DAO_Data_Access_Object_;
using DTO_Data_Transfer_Object_;

namespace BLL_Business_Logic_Layer__
{
    public class Order_BLL : IOrder
    {
        Order_DAO Order_DAO = new Order_DAO();
        public string placeOrder(IList<Cart_DTO> lists, string diaChi, string sdt, string maKhachHang,string tongtien,string dongia)
        {
           return Order_DAO.placeOrder(lists,diaChi,sdt, maKhachHang, tongtien,dongia);
        }
    }
}
