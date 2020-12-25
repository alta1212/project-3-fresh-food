using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO_Data_Transfer_Object_
{
   public class promotion_dto
    {
        public string maGiaGiam { get; set; }
        public string maSanPham  { get; set; }
        public int percent { get; set; }
        public DateTime batDau { get; set; }
        public DateTime ketThuc { get; set; }
        public string tenSanPham { get; set; }
    }
}
