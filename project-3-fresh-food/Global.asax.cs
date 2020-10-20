using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace project_3_fresh_food
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }
        protected void Application_Error(object sender, EventArgs e)
        {
            Exception lastErrorInfo = Server.GetLastError();
            Exception errorInfo = null;

            bool isNotFound = false;
            if (lastErrorInfo != null)
            {
                errorInfo = lastErrorInfo.GetBaseException();
                var error = errorInfo as HttpException;
                if (error != null)
                    isNotFound = error.GetHttpCode() == (int)HttpStatusCode.NotFound;
            }
            if (isNotFound)
            {
                Server.ClearError();
                Response.Redirect("~/Index/Sorry");
            }
        }
    }
}
