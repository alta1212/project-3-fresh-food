using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL_Business_Logic_Layer__;
using BLL_Business_Logic_Layer__.ServiceInterface;
using DTO_Data_Transfer_Object_;

namespace Adminpage.Controllers
{
    public class AdminController : Controller
    {
        // GET: Home
        IProduct sp = new SAN_PHAM_BLL();

        IList<SAN_PHAM> listsp;
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Product()
        {
           
            return View();
        }
        public JsonResult getpagepro(int page,int pagesize)
        {
            listsp = sp.getpagesp(pagesize,page);
            return Json(listsp, JsonRequestBehavior.AllowGet);
        }
        public void addproduct()
        {

        }
       
    }
}