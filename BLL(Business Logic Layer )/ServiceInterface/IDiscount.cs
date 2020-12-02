using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO_Data_Transfer_Object_;
namespace BLL_Business_Logic_Layer__.ServiceInterface
{
   public interface IDiscount
    {
        IList<discount_DTO> getall();
    }
}
