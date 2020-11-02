using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DTO_Data_Transfer_Object_
{
   public class getimage
    {
        public IEnumerable<HttpPostedFileBase> anh { get; set; }//để tên input là anh để get về
      // public string anh { get; set; }
    }
}
    