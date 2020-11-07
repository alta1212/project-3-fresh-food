using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Business_Logic_Layer__.ServiceInterface
{
    public interface IProduct
    {
        IList<SAN_PHAM> Getall();
        IList<SAN_PHAM> getLatestSp();

        IList<SAN_PHAM> getBestSell();
    }
}
