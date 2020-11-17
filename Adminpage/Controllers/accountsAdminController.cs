using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AdminPage.Controllers
{
    public class accountsAdminController : Controller
    {
        // GET: accountsAdmin
        public ActionResult login()
        {
            return View();
        }
    }
}