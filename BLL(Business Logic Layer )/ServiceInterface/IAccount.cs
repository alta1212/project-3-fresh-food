using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Business_Logic_Layer__.ServiceInterface
{
    public interface IAccount
    {
       void DoRegister(KHACH_HANG KHACH_HANG,string code);
       int active(string code);
       void fillinfo(string tk,string mk,KHACH_HANG KHACH_HANG);
        IList<KHACH_HANG> log(string tk, string mk);

        IList<KHACH_HANG> LoginFaceBook(KHACH_HANG kHACH_HANG);

    }
}
