using BLL_Business_Logic_Layer__;
using BLL_Business_Logic_Layer__.ServiceInterface;
using DTO_Data_Transfer_Object_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using project_3_fresh_food;

namespace AdminPage.Controllers
{
    public class AdminController : Controller
    {
        IAdmin ad = new Admin();
       
        // GET: accountsAdmin
        public ActionResult login()
        {

            return View();
        }
        public JsonResult log(string email,string matkhau)
        {
           
            return Json(ad.login(email,matkhau),JsonRequestBehavior.AllowGet);
        }
        public JsonResult dash()
        {
            return Json(ad.dashboard(), JsonRequestBehavior.AllowGet);
        }
        public ActionResult Index()
        {
            return View();
        }
        public void themlsp(LOAI_SAN_PHAM lsp)
        {
            ad.themLsp(lsp);
        }
        public ActionResult addProduct()
        {
            return View();
        }
        public void themsp(SAN_PHAM sp)
        {
            ad.themsp(sp);
        }
    }
}