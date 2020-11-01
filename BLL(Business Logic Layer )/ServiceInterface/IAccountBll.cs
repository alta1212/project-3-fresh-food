using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Business_Logic_Layer__.ServiceInterface
{
    public interface IAccountBll
    {
       void DoRegister(KHACH_HANG KHACH_HANG,string code);
       int active(string code);
       (int, string) DoLogin(KHACH_HANG kHACH_HANG);
       void resend(string tk,string mail,string code);
       void fillinfo(string tk,string mk,string img,KHACH_HANG KHACH_HANG);
    }
}
