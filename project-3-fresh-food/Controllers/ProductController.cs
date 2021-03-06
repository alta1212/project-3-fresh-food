﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using BLL_Business_Logic_Layer__;
using BLL_Business_Logic_Layer__.ServiceInterface;
using DTO_Data_Transfer_Object_;
using tool;

namespace project_3_fresh_food.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        //xử lý liên quan đến sản phẩm
        IList<SAN_PHAM> lis;
        IProduct sp = new SAN_PHAM_BLL();
        IList<FeedBack_DTO> listfb;
       
        ICart cart = new Cart_BLL();
        IAdmin admin = new Admin();
        IDiscount discount = new discount_BLL();
        Class1 to = new Class1();
        public ActionResult Shop()//shop toàn bộ sản phẩm
        {
            return View();
        }
        public void deleteOrder(string madonhang)
        {
            sp.deleteOrder(madonhang);
        }
        public JsonResult getOrderDetails(string maHoaDon)
        {
            return Json(admin.getListOrderDetails(maHoaDon), JsonRequestBehavior.AllowGet);
        }
        public ActionResult detail()
        {

            return View();
        }
        public ActionResult search()
        {
            return View();
        }
        public ActionResult Product_Details()//chi tiết 1 sản phẩm
        {
            return View();
        }
        public  ActionResult Cart()//giỏ hàng
        {
            return View();
        }
        public ActionResult CheckOut()//thanh toán
        {
            return View();
        }
        // pageSize là số phần sản phẩm được hiện thị
        public JsonResult getpagesp(int pagesize)
        {

            
            return Json(sp.getPageProduct(1, pagesize), JsonRequestBehavior.AllowGet);
        }
        public JsonResult getbyloai(string maloai,string page)
        { 
            lis = sp.getbyloaisp(maloai,page);
            return Json(lis,JsonRequestBehavior.AllowGet);
        }    
        public int getslsp(string maloai)
        {
            return sp.getslsp(maloai);
        }
        public JsonResult getsanpham(string masanpham)
        {
            var sanpham = sp.getthongtinsanpham(masanpham);
            return Json(sanpham, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetProductDiscount()
        {
            lis = sp.getProductDiscount();
            return Json(lis, JsonRequestBehavior.AllowGet);
        }
        //lấy về bình luận sp
        public JsonResult getFb(string masanpham)
        {   listfb = sp.getListFeedBack(masanpham);
            return Json(listfb, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAllProductInCart(string maGioHang)
        {
            return Json(cart.GetAllProductInCart(maGioHang), JsonRequestBehavior.AllowGet);
        }
        public JsonResult getchietkhau()
        {
            return Json(discount.getall(),JsonRequestBehavior.AllowGet);
        }
       
       public JsonResult searchName(string tensanpham)
        {
            return Json(sp.searchName(tensanpham, 1, 100),JsonRequestBehavior.AllowGet);
        }
        public ActionResult odertList()
        {
            return View();
        }
        public JsonResult listOrder(string makhachhang)
        {
            return Json(sp.getlistOrder(makhachhang), JsonRequestBehavior.AllowGet);
        }
    }
}