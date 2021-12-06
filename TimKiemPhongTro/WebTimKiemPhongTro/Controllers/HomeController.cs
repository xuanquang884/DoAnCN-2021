using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebTimKiemPhongTro.Models;

namespace WebTimKiemPhongTro.Controllers
{
   
    public class HomeController : Controller
    {
        WebDataContext data = new WebDataContext();
        public ActionResult Index()
        {
            
            return View();
        }

       
        public ActionResult Huongdan()
        {
           

            return View();
        }

        public ActionResult Giaodich()
        {
            var userID = User.Identity.GetUserId();
            var gd = data.GiaoDich.Where(n => n.MaUser.Equals(userID)).ToList();
            foreach (var i in gd)
            {
                //tìm Name của user từ lectureid
                ApplicationUser user =
                System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>(
                ).FindById(i.MaUser);
                i.Name = user.Name;

            }
            return View(gd);
        }
        public ActionResult home(int? page)
        {

            var list = data.TinDang.ToList();
            List<TinDang> product = new List<TinDang>();
            foreach(var item in list)
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

                //tìm Name của user từ lectureid
                ApplicationUser user =
                System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>(
                ).FindById(i.MaNguoiDang);
                i.Name = user.Name;
              
            }
            int pageNumber = (page ?? 1);
            product = product.OrderBy(n => n.Loai.DoUutien ).ThenByDescending(n=>n.NgayDang).ToList();          
            int pagesize = 12;
            return View(product.ToPagedList(pageNumber, pagesize));
           
        }

        [ChildActionOnly]
        public ActionResult PartialThongKe()
        {
            ViewBag.Songuoitruycap = HttpContext.Application["songuoitruycap"].ToString();
            ViewBag.Songuoionline = HttpContext.Application["songuoionline"].ToString();
            ViewBag.Tongtindang = tongtindang().ToString();
            ViewBag.Tongnguoidung = tongnguoidung().ToString();
            return PartialView("PartialThongKe");
        }

        public decimal tongtindang()
        {
            decimal tong = data.TinDang.Count();
            return tong;
        }
        public decimal tongnguoidung()
        {
            decimal tong = data.AspNetUsers.Count();
            return tong;
        }


        public ActionResult Policy()
        {
            return View();
        }
        public ActionResult search(string currentFilter, string currentQuan, string currentLoai, string currentGia, string SearchString, string Quan, string Loai, string Gia, int? page)
        {

            //var sanpham = data.SANPHAMs.Where(n=>n.TEN_SP.Contains(SearchString)).ToList();
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
    }
}