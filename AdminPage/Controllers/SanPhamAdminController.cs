using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL_Business_Logic_Layer__;
using DTO_Data_Transfer_Object_;
using BLL_Business_Logic_Layer__.ServiceInterface;

namespace AdminPage.Controllers
{
    public class SanPhamAdminController : Controller
    {
        // GET: SanPhamAdmin
     
        public ActionResult ManagerProduct()
        {
            return View();
        }

        IProduct product = new SAN_PHAM_BLL();
        IList<SAN_PHAM> sanPham;
        public JsonResult GetAllProduct(int page, int size)
        {
            sanPham = product.getPageProduct(page, size);
            return Json(sanPham, JsonRequestBehavior.AllowGet);
        }
        public JsonResult searchNameProduct(string name, int page, int size)
        {
            sanPham = product.searchName(name,  page, size);
            return Json(sanPham, JsonRequestBehavior.AllowGet);
        }
        public ActionResult AddProductType()
        {
            return View();
        }
    }
}