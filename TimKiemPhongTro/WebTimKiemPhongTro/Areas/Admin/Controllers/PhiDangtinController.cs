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
    public class PhiDangtinController : Controller
    {
        private WebDataContext db = new WebDataContext();

        // GET: Admin/PhiDangtin
        public ActionResult Index()
        {
            return View(db.Loai.ToList());
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaLoai,TenLoai,DoUutien,DonGia")] Loai loai)
        {
            if (ModelState.IsValid)
            {
                var check = db.Loai.FirstOrDefault(s => s.DonGia == loai.DonGia || s.TenLoai == loai.TenLoai );
                if (check == null)
                {
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.Loai.Add(loai);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Thông tin phí đăng tin đã tồi tại!. Vui lòng kiểm tra lại đơn giá hoặc tên loại!";
                    return View();
                }
            }

            return View(loai);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Loai loai = db.Loai.Find(id);
            if (loai == null)
            {
                return HttpNotFound();
            }
            return View(loai);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaLoai,TenLoai,DoUutien,DonGia")] Loai loai)
        {
            if (ModelState.IsValid)
            {
                db.Entry(loai).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(loai);
        }


        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Loai loai = db.Loai.Find(id);
            if (loai == null)
            {
                return HttpNotFound();
            }
            return View(loai);
        }


        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Loai loai = db.Loai.Find(id);
            db.Loai.Remove(loai);
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
