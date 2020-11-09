using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Adminpage.Controllers
{
    public class AdminController : Controller
    {
        // GET: Home
      
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Product()
        {
           
            return View();
        }
       
    }
}