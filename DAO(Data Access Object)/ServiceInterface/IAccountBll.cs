using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO_Data_Access_Object_.ServiceInterface
{
    interface IAccountBll
    {
        int dologin(KHACH_HANG KHACH_HANG);
        int DoRegister(KHACH_HANG KHACH_HANG);
    }
}
