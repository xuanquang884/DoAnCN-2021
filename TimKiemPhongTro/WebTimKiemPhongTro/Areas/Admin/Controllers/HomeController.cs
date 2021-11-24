using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebTimKiemPhongTro.Models;

namespace WebTimKiemPhongTro.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        private WebDataContext db = new WebDataContext();
        // GET: Admin/Home
        public ActionResult Index()
        {
            if(Session["admin"]==null)
            {
                return RedirectToAction("Dangnhap", "Admin");
            }
            ViewBag.Songuoitruycap = HttpContext.Application["songuoitruycap"].ToString();
            ViewBag.Songuoionline = HttpContext.Application["songuoionline"].ToString();
            ViewBag.Tongtindang = tongtindang().ToString();
            ViewBag.Tongnguoidung = tongnguoidung().ToString();
            return View(db.AspNetUsers.ToList());
        }
        [ChildActionOnly]
        public ActionResult RenderMenu()
        {
            return PartialView("_PartialView");
        }

      

        public decimal tongtindang()
        {
            decimal tong = db.GiaoDich.Count();
            return tong;
        }
        public decimal tongnguoidung()
        {
            decimal tong = db.AspNetUsers.Count();
            return tong;
        }
    }
}