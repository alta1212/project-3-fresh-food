using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace project_3_fresh_food.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        //xử lý blog
        public ActionResult Blog()
        {
            return View();
        }
        public ActionResult Blog_Details()
        {
            return View();
        }
    }
}