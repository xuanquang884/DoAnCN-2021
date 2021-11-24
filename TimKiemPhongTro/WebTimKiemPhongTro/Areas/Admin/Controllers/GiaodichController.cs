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
    public class GiaodichController : BaseController
    {
        private WebDataContext db = new WebDataContext();

        public ActionResult Index()
        {
            var giaoDich = db.GiaoDich.Include(g => g.AspNetUsers).Include(g => g.TinDang);
            return View(giaoDich.OrderByDescending(m=>m.ThoiGian).ToList());
        }
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GiaoDich giaoDich = db.GiaoDich.Find(id);
            if (giaoDich == null)
            {
                return HttpNotFound();
            }
            return View(giaoDich);
        }
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            GiaoDich giaoDich = db.GiaoDich.Find(id);
            db.GiaoDich.Remove(giaoDich);
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
