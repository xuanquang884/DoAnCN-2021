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
      

        public ActionResult search(string currentFilter, string currentQuan, string currentLoai, string currentGia, string SearchString, string Quan, string Loai, string Gia, int? page)
        {

            //var sanpham = db.SANPHAMs.Where(n=>n.TEN_SP.Contains(SearchString)).ToList();
            var sanpham = data.TinDang.ToList();
            if (SearchString != null || Quan != null || Loai != null)
            {
                page = 1;
            }
            else
            {
                SearchString = currentFilter;
                Quan = currentQuan;
                Loai = currentLoai;
                Gia = currentGia;
            }
            if (!string.IsNullOrEmpty(SearchString) || !string.IsNullOrEmpty(Quan) || !string.IsNullOrEmpty(Loai) || !string.IsNullOrEmpty(Gia))
            {

                if (!string.IsNullOrEmpty(SearchString))
                {
                    sanpham = data.TinDang.Where(n => n.MoTa.ToLower().Contains(SearchString.ToLower()) || n.TieuDe.ToLower().Contains(SearchString.ToLower())).ToList();
                    if (!string.IsNullOrEmpty(Quan))
                    {
                        sanpham = sanpham.Where(n => n.DiaChi.ToLower().Contains(Quan.ToLower())).ToList();
                        if (!string.IsNullOrEmpty(Loai))
                        {
                            sanpham = sanpham.Where(n => n.ChuyenMuc.ToLower().Contains(Loai.ToLower())).ToList();
                        }

                    }
                    else
                    {
                        if (!string.IsNullOrEmpty(Loai))
                        {
                            sanpham = sanpham.Where(n => n.ChuyenMuc.ToLower().Contains(Loai.ToLower())).ToList();
                        }


                    }
                }
                else
                {
                    if (!string.IsNullOrEmpty(Quan))
                    {
                        sanpham = data.TinDang.Where(n => n.DiaChi.ToLower().Contains(Quan.ToLower())).ToList();
                        if (!string.IsNullOrEmpty(Loai))
                        {
                            sanpham = sanpham.Where(n => n.ChuyenMuc.ToLower().Contains(Loai.ToLower())).ToList();
                        }
                    }
                    else
                    {
                        if (!string.IsNullOrEmpty(Loai))
                        {
                            sanpham = data.TinDang.Where(n => n.ChuyenMuc.ToLower().Contains(Loai.ToLower())).ToList();
                        }

                    }
                }

                if (!string.IsNullOrEmpty(Gia))
                {
                    int gia = Int32.Parse(Gia);
                    sanpham = sanpham.Where(n => n.GiaTien < gia).ToList();
                }



            }
            else
            {
                sanpham = data.TinDang.ToList();
            }
            ViewBag.CurrentFilter = SearchString;
            ViewBag.CurrentQuan = Quan;
            ViewBag.CurrentLoai = Loai;
            ViewBag.CurrentGia = Gia;
            int pagesize = 10;
            int pageNumber = (page ?? 1);
            sanpham = sanpham.OrderByDescending(n => n.GiaTien).ToList();
            foreach (var i in sanpham)
            {
                //tìm Name của user từ lectureid
                ApplicationUser user =
                System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>(
                ).FindById(i.MaNguoiDang);
                i.Name = user.Name;


            }
            List<TinDang> tinmoi = data.TinDang.OrderByDescending(m => m.NgayDang).ToList();
            ViewData["TinMoi"] = tinmoi;
            List<TinDang> tinhot = data.TinDang.OrderBy(m => m.Loai.DoUutien).ThenByDescending(m => m.NgayDang).ToList();
            ViewData["TinHot"] = tinhot;

            return View(sanpham.ToPagedList(pageNumber, pagesize));
        }

        public ActionResult sendmail()
        {

            return View();
        }


        [HttpPost]
        public ActionResult sendmail(Email email)
        {
            MailMessage mm = new MailMessage(email.Emails, email.To);
            mm.Subject = email.Subject;
            mm.Body = email.Body;


            mm.IsBodyHtml = false;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            NetworkCredential nc = new NetworkCredential(email.Emails, email.Password);
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = nc;
            ViewBag.Message = "Gửi thành công";
            return View();
        }
    }
}