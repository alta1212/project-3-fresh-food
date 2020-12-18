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
    public class SAN_PHAM_BLL : IProduct
    {
        SAN_PHAM_DAO sp = new SAN_PHAM_DAO();

        public void AddToCart(string mkh, string msp, int donGia, int soLuong)
        {
            sp.AddToCart(mkh,msp,donGia,soLuong);
        }

        public void postcomment(string masp, string mkh, string binhluan, string hinhanh, float stars)
        {
            sp.postComent( masp,  mkh,  binhluan,  hinhanh,  stars);
        }

        public IList<SAN_PHAM> Getall()
        {
            return sp.getallsp();
        }

        public IList<SAN_PHAM> getBestSell()
        {
            return sp.getBestSell();
        }

        public IList<SAN_PHAM> getbyloaisp(string loai ,string page)
        {
            return sp.getbyloai(loai,page);
        }

        public IList<SAN_PHAM> getLatestSp()
        {
            return sp.getLatestSp();
        }


        public IList<SAN_PHAM> getProductDiscount()
        {
            return sp.getProductDiscount();
        }
        public IList<SAN_PHAM> getPageProduct(int page,int pagesize)
        {
            return sp.getPageListProduct(page,pagesize);
        }
        public int getslsp(string maloai)
        {

            return sp.getslsp(maloai);
        }

        public IList<SAN_PHAM> getthongtinsanpham(string masanpham)
        {
            return sp.getttsanpham(masanpham);
        }

        public IList<SAN_PHAM> searchName(string name, int page, int pagesize)
        {
            return sp.searchName(name,page,pagesize);
        }

        public IList<FeedBack_DTO> getListFeedBack(string masanpham)
        {
            return sp.getListFeedBack(masanpham);
        }

        public IList<SAN_PHAM> getdaylyDeal()
        {
            return sp.getDaylydeal();
        }

        public void xoaSp(string ma)
        {
            sp.xoaSp(ma);
        }

        public void editProcduct(SAN_PHAM info)
        {
            sp.edit(info);
        }

        public string confirmOrder(string madonhang)
        {
          return  sp.confirmOrder(madonhang);
        }
    }
}
