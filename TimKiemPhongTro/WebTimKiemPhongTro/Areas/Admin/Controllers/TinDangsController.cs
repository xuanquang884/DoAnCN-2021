using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using PagedList;
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
    public class TinDangsController : BaseController
    {
        private WebDataContext db = new WebDataContext();

        // GET: Admin/TinDangs
        public ActionResult Index(int? page)
        {
                var list = db.TinDang.ToList();
                List<TinDang> product = new List<TinDang>();
                foreach (var item in list)
                {
                    DateTime startTime = DateTime.Now;
                    DateTime endTime = item.NgayDang;
                    TimeSpan span = startTime.Subtract(endTime);
                    if (span.Days <= item.SoNgay)
                    {
                        product.Add(item);
                    }
                }
                foreach (var i in product)
                {
                    ApplicationUser user =
                    System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>(
                    ).FindById(i.MaNguoiDang);
                    i.Name = user.Name;

                }
                int pageNumber = (page ?? 1);
                product = product.OrderBy(n => n.Loai.DoUutien).ThenByDescending(n => n.NgayDang).ToList();
                int pagesize = 12;
                return View(product.ToPagedList(pageNumber, pagesize));
        }

        // GET: Admin/TinDangs/Create
        public ActionResult Create()
        {
            ViewBag.MaNguoiDang = new SelectList(db.AspNetUsers, "Id", "Email");
            ViewBag.LoaiTin = new SelectList(db.Loai, "MaLoai", "TenLoai");
            return View();
        }
        public ActionResult Details(int id)
        {
            var tin = db.TinDang.FirstOrDefault(m => m.MaTin == id);
            ApplicationUser user =
              System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>(
              ).FindById(tin.MaNguoiDang);
            tin.Name = user.Name;
            tin.Sdt = user.PhoneNumber;
            tin.email = user.Email;

            List<TinDang> tinmoi = db.TinDang.OrderByDescending(m => m.NgayDang).ToList();
            ViewData["TinMoi"] = tinmoi;
            return View(tin);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaTin,TieuDe,ChuyenMuc,GiaTien,DienTich,MoTa,NgayDang,MaNguoiDang,DiaChi,Image,LoaiTin,SoNgay")] TinDang tinDang)
        {
            if (ModelState.IsValid)
            {
                db.TinDang.Add(tinDang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaNguoiDang = new SelectList(db.AspNetUsers, "Id", "Email", tinDang.MaNguoiDang);
            ViewBag.LoaiTin = new SelectList(db.Loai, "MaLoai", "TenLoai", tinDang.LoaiTin);
            return View(tinDang);
        }

        // GET: Admin/TinDangs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinDang tinDang = db.TinDang.Find(id);
            if (tinDang == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaNguoiDang = new SelectList(db.AspNetUsers, "Id", "Email", tinDang.MaNguoiDang);
            ViewBag.LoaiTin = new SelectList(db.Loai, "MaLoai", "TenLoai", tinDang.LoaiTin);
            return View(tinDang);
        }

        // POST: Admin/TinDangs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaTin,TieuDe,ChuyenMuc,GiaTien,DienTich,MoTa,NgayDang,MaNguoiDang,DiaChi,Image,LoaiTin,SoNgay")] TinDang tinDang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tinDang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaNguoiDang = new SelectList(db.AspNetUsers, "Id", "Email", tinDang.MaNguoiDang);
            ViewBag.LoaiTin = new SelectList(db.Loai, "MaLoai", "TenLoai", tinDang.LoaiTin);
            return View(tinDang);
        }

        // GET: Admin/TinDangs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinDang tinDang = db.TinDang.Find(id);
            if (tinDang == null)
            {
                return HttpNotFound();
            }
            return View(tinDang);
        }

        // POST: Admin/TinDangs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {

            TinDang tinDang = db.TinDang.Find(id);
            db.TinDang.Remove(tinDang);
            var giaoDich = db.GiaoDich.Where(m => m.MaTin == tinDang.MaTin);
            foreach(var item in giaoDich)
            {
                db.GiaoDich.Remove(item);
            }
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
