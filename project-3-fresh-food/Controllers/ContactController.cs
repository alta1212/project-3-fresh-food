using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace project_3_fresh_food.Controllers
{
    public class ContactController : Controller
    {
        // GET: Contact
        public ActionResult SendContact()
        {
            return View();
        }
        public ActionResult AboutUs()
        {
            return View();
        }
    }
}