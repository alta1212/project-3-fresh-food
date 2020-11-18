
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using BLL_Business_Logic_Layer__.ServiceInterface;
using BLL_Business_Logic_Layer__;
using DTO_Data_Transfer_Object_;

namespace project_3_fresh_food.Controllers
{
    public class IndexController : Controller
    {
        // GET: Index
        //xử lý trang chủ
        IProductType lsp = new LOAI_SAN_PHAM_BLL();
        IProduct sp = new SAN_PHAM_BLL();
        IList<LOAI_SAN_PHAM> listlsp;
        IList<SAN_PHAM> listsp;
        public ActionResult Index()//trang chủ
        {
            return View();
        }
        public ActionResult Sorry()//trang 404
        {
            Response.StatusCode = 404;

            return View();
        }
        // Sản phẩm theo loại
        public JsonResult getLsP()
        {
            listlsp = lsp.GetAllLSP();
            return Json(listlsp, JsonRequestBehavior.AllowGet);
        }
        // Sản phẩm nổi bật
        public JsonResult spHighlights() 
        {
            listsp = sp.Getall();
            return Json(listsp, JsonRequestBehavior.AllowGet);
        }
        // Sản phẩm bán chạy
        public JsonResult getBestSell()
        {
            listsp = sp.getBestSell();
            return Json(listsp, JsonRequestBehavior.AllowGet);
        }
        // Sản phẩm mới nhất
        public JsonResult getLatestSp()
        {
            listsp = sp.getLatestSp();
            return Json(listsp, JsonRequestBehavior.AllowGet);
        }
    }
}