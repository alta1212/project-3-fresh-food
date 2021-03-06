﻿using DTO_Data_Transfer_Object_;
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
        // Lấy sản phẩm 
        IList<SAN_PHAM> getLatestSp();
        // Lấy sản phẩm bán chạy
        IList<SAN_PHAM> getBestSell();
        // Phân trang sản phẩm của trang admin
        IList<SAN_PHAM> getPageProduct(int page,int pagesize);
        // Lấy sản phẩm giảm giá
        IList<SAN_PHAM> getProductDiscount();

        IList<SAN_PHAM> getbyloaisp(string loai,string page);
        void postcomment(string masp, string mkh, string binhluan, string hinhanh, float stars);
        void AddToCart(string mkh, string msp, int donGia, int soLuong);
        void deleteOrder(string madonhang);
        string confirmOrder(string madonhang, string manv);
      
        int getslsp(string maloai);
        IList<SAN_PHAM> getthongtinsanpham(string masanpham);
        IList<SAN_PHAM> searchName(string name, int page, int pagesize);
        IList<FeedBack_DTO> getListFeedBack(string masanpham);
        //lấy sản phẩm giảm giá trong ngày
        IList<SAN_PHAM> getdaylyDeal();
        void xoaSp(string ma);
        void editProcduct(SAN_PHAM info);
        IList<Order_DTO> getlistOrder(string makhachhang);
    }
}
