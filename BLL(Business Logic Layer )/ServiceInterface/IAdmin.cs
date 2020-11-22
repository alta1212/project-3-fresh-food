using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Business_Logic_Layer__.ServiceInterface
{
    public interface IAdmin
    {
        IList<ADMIN> login(string tk, string mk);
        IList<dashBroad> dashboard();
        void themLsp(LOAI_SAN_PHAM lsp);
    }
}
