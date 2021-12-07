using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebTimKiemPhongTro.Models;

namespace WebTimKiemPhongTro.Controllers
{
    public class ContactController : Controller
    {
        private WebDataContext db = new WebDataContext();

       
        // GET: Contact/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Contact/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,Hoten,Gmail,Phone,NoiDung,Ngaytao")] Lien_He lien_He)
        {
            if (ModelState.IsValid)
            {
                lien_He.Ngaytao = DateTime.Now;
                db.Lien_He.Add(lien_He);
                db.SaveChanges();
                return RedirectToAction("home", "Home");
            }

            return View(lien_He);
        }

       
    }
}
