using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebTimKiemPhongTro.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        // GET: Admin/Base
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (Session["admin"] == null) //chua đăng nhập
            { 
                //Trả về trang đăng nhập
                filterContext.Result = new RedirectToRouteResult(
                new System.Web.Routing.RouteValueDictionary(new { Controller = "Admin", Action = "Dangnhap" }));
            }
            base.OnActionExecuting(filterContext);
        }
    }
}