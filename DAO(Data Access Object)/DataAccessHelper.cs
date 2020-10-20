using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO_Data_Access_Object_
{
    public class DataAccessHelper
    {//chuỗi kết nối
        public static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString;

    }
}
