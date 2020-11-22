using BLL_Business_Logic_Layer__.ServiceInterface;
using DAO_Data_Access_Object_;
using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Business_Logic_Layer__
{
    public class Admin : IAdmin
    {
        ADMIN_DAO ad = new ADMIN_DAO();

        public IList<dashBroad> dashboard()
        {
            return ad.dash();
        }

        public IList<ADMIN> login(string tk, string mk)
        {
            return ad.login(tk, mk);
        }

        public void themLsp(LOAI_SAN_PHAM lsp)
        {
            ad.themlsp(lsp);
        }
    }
}
