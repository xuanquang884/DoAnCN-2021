using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebTimKiemPhongTro.Models;

namespace WebTimKiemPhongTro.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        WebDataContext data = new WebDataContext();
        // GET: Admin/Admin
        public ActionResult Dangnhap()
        {
            if (Session["admin"] != null)
            {
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(string Email, string password, string username)
        {
           
            var user = username;
            var pass = password;
            var email = Email;
            var acc = data.AccountAdmin.SingleOrDefault(x => x.UserName == username && x.Password == pass || x.Email == email && x.Password == pass);
            if (acc != null)
            {
                Session["admin"] = acc;
                Session["Ten"] = acc.Name;
                return RedirectToAction("Index", "Home");

            }
            else
            {
                AccountAdmin ac = new AccountAdmin();
                ac.DangNhapThatBai = "Nhập sai tài khoản hoặc mật khẩu";
                return View("DangNhap",ac);
            }
        }
        public ActionResult ListAdmin()
        {
            return View(data.AccountAdmin.ToList());
        }
        // GET: Admin/AccountAdmins/Create
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Email,UserName,Name,SDT,Password,Xacnhanpassword")] AccountAdmin accountAdmin)
        {
            if (ModelState.IsValid)
            {
                var check = data.AccountAdmin.FirstOrDefault(s => s.Email == accountAdmin.Email);
                if(check == null)
                {
                    data.Configuration.ValidateOnSaveEnabled = false;
                    data.AccountAdmin.Add(accountAdmin);
                    data.SaveChanges();
                    return RedirectToAction("ListAdmin");
                } 
                else
                {
                    ViewBag.error = "Thông tin tài khoản đã tồn tại!. Vui lòng kiểm tra email!";
                    return View();
                }    
                
            }
            return View(accountAdmin);
        }

        // GET: Admin/AccountAdmins/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AccountAdmin accountAdmin = data.AccountAdmin.Find(id);
            if (accountAdmin == null)
            {
                return HttpNotFound();
            }
            return View(accountAdmin);
        }

        // POST: Admin/AccountAdmins/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Email,UserName,Name,SDT,Password,Xacnhanpassword")] AccountAdmin accountAdmin)
        {
            if (ModelState.IsValid)
            {
                data.Entry(accountAdmin).State = EntityState.Modified;
                data.SaveChanges();
                return RedirectToAction("ListAdmin");
            }
            return View(accountAdmin);
        }

        // GET: Admin/AccountAdmins/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AccountAdmin accountAdmin = data.AccountAdmin.Find(id);
            if (accountAdmin == null)
            {
                return HttpNotFound();
            }
            return View(accountAdmin);
        }

        // POST: Admin/AccountAdmins/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AccountAdmin accountAdmin = data.AccountAdmin.Find(id);
            data.AccountAdmin.Remove(accountAdmin);
            data.SaveChanges();
            return RedirectToAction("ListAdmin");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                data.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}