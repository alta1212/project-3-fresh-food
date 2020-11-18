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
    public class LOAI_SAN_PHAM_BLL : IProductType
    {
        LOAI_SAN_PHAM_DAO LSP = new  LOAI_SAN_PHAM_DAO();
        public IList<LOAI_SAN_PHAM> GetAllLSP()
        {
           return LSP.GetAllLSP();
        }
    }
}
