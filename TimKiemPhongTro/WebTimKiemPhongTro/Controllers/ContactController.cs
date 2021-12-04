using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebTimKiemPhongTro.Models;

namespace WebTimKiemPhongTro.Controllers
{
    public class ContactController : Controller
    {
        WebDataContext db = new WebDataContext();
        // GET: Contact
        public ActionResult Index(Lien_He lien_He)
        {
            if (ModelState.IsValid)
            {
                if (lien_He.Hoten==null||lien_He.Gmail==null || lien_He.Phone == null || lien_He.NoiDung == null)
                {
                    ViewBag.error = "Bạn nhập thiếu thông tin mời nhập lại.";
                }
            }
            db.Lien_He.Add(lien_He);
            db.SaveChanges();
            return View("Index" );
        }

    }
}
