using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebTimKiemPhongTro.Models;
using System.Net;
using System.Net.Mail;

namespace WebTimKiemPhongTro.Controllers
{
    public class DetailsController : Controller
    {
        WebDataContext data = new WebDataContext();
        // GET: Details
        public ActionResult Item(int id)
        {
            var tin = data.TinDang.FirstOrDefault(m => m.MaTin == id);
            ApplicationUser user =
              System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>(
              ).FindById(tin.MaNguoiDang);

            tin.Name = user.Name;
            tin.Sdt = user.PhoneNumber;
            tin.email = user.Email;
            tin.Zalo = user.Zalo;
            tin.Facebook = user.Facebook;

            List<TinDang> tinmoi = data.TinDang.OrderByDescending(m => m.NgayDang).ToList();
            ViewData["TinMoi"] = tinmoi;
            var tinlienquan = data.TinDang.ToList();
            tinlienquan = tinlienquan.OrderBy(n => n.Loai.DoUutien).ThenByDescending(n => n.NgayDang).ToList();
            foreach (var i in tinlienquan)
            {
                //tìm Name của user từ lectureid
                ApplicationUser usertinlienquan =
                System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>(
                ).FindById(i.MaNguoiDang);
                i.Name = usertinlienquan.Name;


            }
            ViewData["TinLienQuan"] = tinlienquan;



            return View(tin);
        }


    }
}