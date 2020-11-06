using BLL_Business_Logic_Layer__.ServiceInterface;
using DAO_Data_Access_Object_;
using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Business_Logic_Layer__
{
    public class SAN_PHAM_BLL : IProduct
    {
        SAN_PHAM_DAO sp = new SAN_PHAM_DAO();
        public IList<SAN_PHAM> Getall()
        {
            return sp.getallsp();
        }

        public IList<SAN_PHAM> getLatestSp()
        {
            return sp.getLatestSp();
        }
    }
}
