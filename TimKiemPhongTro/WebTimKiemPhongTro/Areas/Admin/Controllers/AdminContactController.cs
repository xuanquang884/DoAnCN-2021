using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebTimKiemPhongTro.Models;

namespace WebTimKiemPhongTro.Areas.Admin.Controllers
{
    public class AdminContactController : Controller
    {
        private WebDataContext db = new WebDataContext();
        
        // GET: Admin/AdminContact
        public ActionResult Index()
        {
            return View(db.Lien_He.ToList());
        }

        // GET: Admin/AdminContact/Details/5
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
        // GET: Admin/AdminContact/Delete/5
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

        // POST: Admin/AdminContact/Delete/5
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
