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

        // GET: Contact
        public ActionResult Index()
        {
            return View(db.Lien_He.ToList());
        }

        // GET: Contact/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lien_He lien_He = db.Lien_He.Find(id);
            if (lien_He == null)
            {
                return HttpNotFound();
            }
            return View(lien_He);
        }

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
                return RedirectToAction("Index");
            }

            return View(lien_He);
        }

        // GET: Contact/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lien_He lien_He = db.Lien_He.Find(id);
            if (lien_He == null)
            {
                return HttpNotFound();
            }
            return View(lien_He);
        }

        // POST: Contact/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,Hoten,Gmail,Phone,NoiDung,Ngaytao")] Lien_He lien_He)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lien_He).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(lien_He);
        }

        // GET: Contact/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lien_He lien_He = db.Lien_He.Find(id);
            if (lien_He == null)
            {
                return HttpNotFound();
            }
            return View(lien_He);
        }

        // POST: Contact/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Lien_He lien_He = db.Lien_He.Find(id);
            db.Lien_He.Remove(lien_He);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
