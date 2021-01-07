using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace project_3_fresh_food
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
            name: "Partials",
            url: "partials/{controller}",
            defaults: new { controller = "Index", action = "Home" }
        );

            // Will handle all other requests by sending it to the main controller
            routes.MapRoute(
                name: "Application",
                url: "{*url}",
                defaults: new { controller = "Index", action = "Home" }
            );
        }
    }
}
