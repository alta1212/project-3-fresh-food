using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace project_3_fresh_food.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        //xử lý liên quan đến sản phẩm
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
    }
}