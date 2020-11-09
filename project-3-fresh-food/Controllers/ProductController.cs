﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Adminpage;
using BLL_Business_Logic_Layer__;
using BLL_Business_Logic_Layer__.ServiceInterface;
using DTO_Data_Transfer_Object_;

namespace project_3_fresh_food.Controllers
{
    public class ProductController : Controller
    {
        Adminpage.Controllers.AdminController admin = new Adminpage.Controllers.AdminController();
        // GET: Product
        //xử lý liên quan đến sản phẩm
        IList<SAN_PHAM> lis;

        IProduct sp = new SAN_PHAM_BLL();
        public ActionResult Shop()//shop toàn bộ sản phẩm
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
        public JsonResult getpagesp(int page,int pagesize)
        {
            return admin.getpagepro(page,pagesize);
        }
        public JsonResult getbyloai(string maloai,string page)
        { lis = sp.getbyloaisp(maloai,page);

            return Json(lis,JsonRequestBehavior.AllowGet);
        }    
        public int getslsp()
        {
            return sp.getslsp();
        }
    }
}