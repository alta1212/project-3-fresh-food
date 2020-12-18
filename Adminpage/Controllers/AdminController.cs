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
        IProduct sp = new SAN_PHAM_BLL();
        // GET: accountsAdmin
        public ActionResult login()
        {

            return View();
        }
        public ActionResult profile()
        {
            return View();
        }

        public ActionResult addNv()
        {
            return View();
        }
        public int addNhanVien(ADMIN adm)
        {
            return ad.addnv(adm);
        }
        public JsonResult log(string email, string matkhau)
        {
            return Json(ad.login(email, matkhau), JsonRequestBehavior.AllowGet); ;
        }
        public JsonResult dash()
        {
            return Json(ad.dashboard(), JsonRequestBehavior.AllowGet);
        }
        public ActionResult Index()
        {

            return View();
        }
        public int themlsp(LOAI_SAN_PHAM lsp)
        {
            if (ad.themLsp(lsp) == 0)
                return 0;
            else
                return 1;

        }
        public void confirmorder(string maorder)
        {
            sp.confirmOrder(maorder);
        }

        public JsonResult getOrder(string pagesize)
        {
            return Json(ad.getListOrder(pagesize),JsonRequestBehavior.AllowGet);
        }
        public ActionResult addProduct()
        {
            return View();
        }
        public ActionResult Order()
        {
            return View();
        }
        public void themsp(SAN_PHAM sp)
        {
            ad.themsp(sp);
        }
    }
}