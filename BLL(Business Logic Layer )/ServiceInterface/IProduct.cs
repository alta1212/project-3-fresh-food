using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Business_Logic_Layer__.ServiceInterface
{
    public interface IProduct
    {
        IList<SAN_PHAM> Getall();
        IList<SAN_PHAM> getLatestSp();

        IList<SAN_PHAM> getBestSell();
        IList<SAN_PHAM> getPageProduct(int page,int pagesize);

        IList<SAN_PHAM> getbyloaisp(string loai,string page);
        void addtocart(string mkh, string msp);
        int getslsp(string maloai);
        object getthongtinsanpham(string masanpham);
        IList<SAN_PHAM> searchName(string name, int page, int pagesize);
    }
}
