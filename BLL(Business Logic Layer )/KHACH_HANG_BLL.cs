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
    public class KHACH_HANG_BLL : IAccountBll
    {

        private readonly KHACH_HANG_DAO dao = new KHACH_HANG_DAO();


        public void DoRegister(KHACH_HANG KHACH_HANG,string code)
        {
           dao.register(KHACH_HANG,code);
        }


        public void active(string code)
        {
            dao.Active(code);
            
        }

        public bool DoLogin(KHACH_HANG kHACH_HANG)
        {
           return dao.Login(kHACH_HANG);
        }
    }
}
