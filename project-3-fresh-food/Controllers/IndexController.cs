using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace project_3_fresh_food.Controllers
{
    public class IndexController : Controller
    {
        // GET: Index
        //xử lý trang chủ
        public ActionResult Index()//trang chủ
        {
            return View();
        }
        public ActionResult Sorry()//trang 404
        {
            Response.StatusCode = 404;

            return View();
        }
    }
}