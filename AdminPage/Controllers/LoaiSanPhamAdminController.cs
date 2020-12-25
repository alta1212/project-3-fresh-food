using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL_Business_Logic_Layer__.ServiceInterface;
using DTO_Data_Transfer_Object_;
using BLL_Business_Logic_Layer__;


namespace AdminPage.Controllers
{
    public class LoaiSanPhamAdminController : Controller
    {
        // GET: LoaiSanPhamAdmin
        public ActionResult Index()
        {
            return View();
        }

        IProductType productTypeIterface = new LOAI_SAN_PHAM_BLL();
        IList<LOAI_SAN_PHAM> productType;
        public JsonResult GetAllProductTypeJS(string page)
        {
            productType = productTypeIterface.GetAllLSPInAdmin(page);
            return Json(productType, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetAllProductType()
        {
            return View();
        }
        public void deleteLsp(string key)
        {
            productTypeIterface.xoaLsp(key);
        }
    }
}