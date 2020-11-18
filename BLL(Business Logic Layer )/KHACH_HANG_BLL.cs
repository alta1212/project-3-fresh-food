using BLL_Business_Logic_Layer__.ServiceInterface;
using DAO_Data_Access_Object_;
using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BLL_Business_Logic_Layer__
{
    public class KHACH_HANG_BLL : IAccount
    {

        private readonly KHACH_HANG_DAO dao = new KHACH_HANG_DAO();


        public void DoRegister(KHACH_HANG KHACH_HANG,string code)
        {
           dao.register(KHACH_HANG,code);
        }


        public int active(string code)
        {
           
          return  dao.Active(code);
            
        }

      

        public void resend(string tk,string mail, string code)
        {
             dao.resend(tk,mail,code);
        }

        public void fillinfo(string tk, string mk,KHACH_HANG KHACH_HANG)
        {
           dao.fillinfo(tk,mk,KHACH_HANG);
        }

        public IList<KHACH_HANG> log(string tk, string mk)
        {
            return dao.Log(tk, mk);
        }
      
    }
}
