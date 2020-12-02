using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL_Business_Logic_Layer__.ServiceInterface;
using DTO_Data_Transfer_Object_;
using DAO_Data_Access_Object_;
namespace BLL_Business_Logic_Layer__
{
    public class discount_BLL : IDiscount
    {
        Discount_DAO discount_DAO = new Discount_DAO();
        public IList<Discount_DTO> getall()
        {
           return discount_DAO.getall();
        }
    }
}
