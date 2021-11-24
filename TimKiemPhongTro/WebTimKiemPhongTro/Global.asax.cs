using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using WebTimKiemPhongTro.Models;

namespace WebTimKiemPhongTro
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            Database.SetInitializer<ApplicationDbContext>(null);

            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            Application["songuoitruycap"] = 0;
            Application["songuoionline"] = 0;
        }

        protected void Session_Start()
        {
            Application.Lock();
            Application["songuoitruycap"] = (int)Application["songuoitruycap"] + 1;
            Application["songuoionline"] = (int)Application["songuoionline"] + 1;
            Application.UnLock();
        }
        protected void Session_End()
        {
            Application.Lock();            
            Application["songuoionline"] = (int)Application["songuoionline"] - 1;
            Application.UnLock();
        }
    }
}
