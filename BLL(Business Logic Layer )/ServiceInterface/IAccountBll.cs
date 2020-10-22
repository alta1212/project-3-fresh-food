using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Business_Logic_Layer__.ServiceInterface
{
    public interface IAccountBll
    {
       void dologin(KHACH_HANG KHACH_HANG);
       void DoRegister(KHACH_HANG KHACH_HANG,string code);
       void active(string code);
    }
}
