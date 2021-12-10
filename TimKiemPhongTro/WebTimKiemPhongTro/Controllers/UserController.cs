using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using PagedList;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Owin.Security;
using WebTimKiemPhongTro.Models;
//using Microsoft.AspNetCore.Identity;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Net;

namespace WebTimKiemPhongTro.Controllers
{

    public class UserController : Controller
    {
        WebDataContext data = new WebDataContext();
        // GET: User
      
        private ApplicationUserManager _userManager;
        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }
        public ActionResult DangTin()
        {
            var userID = User.Identity.GetUserId();
            if (userID == null)
            {
              
                return RedirectToAction("Login", "Account");
            }
            else {
                ApplicationUser user =
               System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>(
               ).FindById(userID);
                ViewBag.vitien = user.ViTien;
                TinDang tin = new TinDang();
                tin.ListLoaiTin = data.Loai.ToList();
                return View(tin);

            }
        
        }

        [HttpPost, ValidateInput(false)]
        public async Task<ActionResult> ImageSave(TinDang obj,string SoNgay,string LoaiTin)       {


            ModelState.Remove("NgayDang");
            ModelState.Remove("MaNguoiDang");
            ModelState.Remove("MaTin");
            ModelState.Remove("Image");

            if (ModelState.IsValid)
            {
                int tientru = Int32.Parse(SoNgay) * Int32.Parse(LoaiTin);
                var userID = User.Identity.GetUserId();
                ApplicationUser user =
                 System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>(
                 ).FindById(userID);


                if (user.ViTien < tientru)
                {
                    return RedirectToAction("Huongdan", "Home");
                }
                else
                {
                    try
                    {
                        //ImageUpload objTaskDetails = new ImageUpload();
                        HttpFileCollectionBase files = Request.Files;
                        var x = "";
                        if (!string.IsNullOrEmpty(obj.ToString()))
                        {


                            for (int i = 0; i < files.Count; i++)
                            {
                                HttpPostedFileBase file = files[i];
                                byte[] ByteImgArray;
                                ByteImgArray = ConvertToBytes(file);
                                var ImageQuality = ConfigurationManager.AppSettings["ImageQuality"];
                                var reduceIMage = ReduceImageSize(ByteImgArray, ImageQuality);
                                string fileName = file.FileName;
                                x += fileName + ",";
                                string serverMapPath = Server.MapPath("~/Content/assets/img/uploadimage");
                                string filePath = serverMapPath + "//" + fileName;
                                SaveFile(reduceIMage, filePath, file.FileName);

                            }
                        }
                        // trừ tiền vào ví

                        user.ViTien = user.ViTien - tientru;
                        var result1 = await UserManager.UpdateAsync(user);

                        // set loai
                        var loai = data.Loai.FirstOrDefault(m => m.DonGia == obj.LoaiTin);

                        // đăng tin

                        obj.MaNguoiDang = userID;
                        obj.NgayDang = DateTime.Now;
                        obj.Image = x.Remove(x.Length - 1);
                        obj.LoaiTin = loai.MaLoai;
                        data.TinDang.Add(obj);

                        // lưu giao dịch
                        GiaoDich giaodich = new GiaoDich();
                        giaodich.MaTin = obj.MaTin;
                        giaodich.MaUser = obj.MaNguoiDang;
                        giaodich.ThoiGian = DateTime.Now;
                        giaodich.SoTien = tientru;
                        data.GiaoDich.Add(giaodich);
                        data.SaveChanges();
                       

                    }
                    catch (Exception e)
                    {

                    }
                    return RedirectToAction("home", "Home");


                }
            }
            else
            {
                obj.ListLoaiTin = data.Loai.ToList();
                return View("DangTin", obj);
            }
            
           



        }
        #region ImageResize
        private byte[] ConvertToBytes(HttpPostedFileBase image)
        {
            byte[] CoverImageBytes = null;
            BinaryReader reader = new BinaryReader(image.InputStream);
            CoverImageBytes = reader.ReadBytes((int)image.ContentLength);
            return CoverImageBytes;
        }
        public static byte[] ReduceImageSize(byte[] inputBytes, string ImageQuality)
        {
            Byte[] imageBytes;
            int jpegQuality;

            //string ImageQuality = "";/*ConfigurationManager.AppSettings["ImageQuality"];*/
            if (!string.IsNullOrEmpty(ImageQuality))
            {
                jpegQuality = Convert.ToInt32(ImageQuality);
            }
            else
            {
                jpegQuality = 25;
            }

            System.Drawing.Image image;

            using (var inputStream = new MemoryStream(inputBytes))
            {
                // Create an Encoder object based on the GUID  for the Quality parameter category.  
                System.Drawing.Imaging.Encoder myEncoder = System.Drawing.Imaging.Encoder.Quality;
                image = System.Drawing.Image.FromStream(inputStream);
                var jpegEncoder = ImageCodecInfo.GetImageDecoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid);
                var encoderParameters = new EncoderParameters(1);
                EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 50L);
                encoderParameters.Param[0] = myEncoderParameter;
                using (var outputStream = new MemoryStream())
                {
                    image.Save(outputStream, jpegEncoder, encoderParameters);
                    imageBytes = outputStream.ToArray();
                }
            }
            return imageBytes;
        }
        public string SaveFile(byte[] file, string filePath, string filename)
        {
            string directoryPath = Path.GetDirectoryName(filePath);
            if (!Directory.Exists(directoryPath))
                System.IO.Directory.CreateDirectory(directoryPath);

            if (file != null)
            {
                using (System.Drawing.Image image = System.Drawing.Image.FromStream(new System.IO.MemoryStream(file)))
                {
                    //var i = Image.FromFile(filePath + file);
                    //var i2 = new Bitmap(i);
                    if (filename.ToLower().Contains(".jpg") || filename.ToLower().Contains(".jpeg"))
                    {
                        image.Save(filePath, System.Drawing.Imaging.ImageFormat.Jpeg);
                        //i2.Save(filePath, ImageFormat.Jpeg);
                    }
                    else if (filename.ToLower().Contains(".png"))
                    {
                        image.Save(filePath, System.Drawing.Imaging.ImageFormat.Png);
                        //i2.Save(filePath, ImageFormat.Png);
                    }
                    else if (filename.ToLower().Contains(".bmp"))
                    {
                        image.Save(filePath, System.Drawing.Imaging.ImageFormat.Bmp);
                        //i2.Save(filePath, ImageFormat.Bmp);
                    }
                    else if (filename.ToLower().Contains(".gif"))
                    {
                        image.Save(filePath, System.Drawing.Imaging.ImageFormat.Gif);
                        //i2.Save(filePath, ImageFormat.Gif);
                    }
                }
            }
            return string.Empty;
        }

        #endregion
        [Authorize]
        public ActionResult Taisancuatoi(int? page)
        {
            ApplicationUser currentUser = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());
            WebDataContext context = new WebDataContext();
            var tindang = context.TinDang.Where(c => c.MaNguoiDang == currentUser.Id).ToList();
            foreach (TinDang i in tindang)
            {
                i.Name = currentUser.Name;
            }
            int pageNumber = (page ?? 1);
            tindang = tindang.OrderBy(n => n.Loai.DoUutien).ThenByDescending(n => n.NgayDang).ToList();
            int pagesize = 6;
            return View(tindang.ToPagedList(pageNumber, pagesize));
        }
        public ActionResult EditTindang(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinDang tinDang = data.TinDang.Find(id);
            if (tinDang == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaNguoiDang = new SelectList(data.AspNetUsers, "Id", "Email", tinDang.MaNguoiDang);
            ViewBag.LoaiTin = new SelectList(data.Loai, "MaLoai", "TenLoai", tinDang.LoaiTin);
            return View(tinDang);
        }

        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edittindang([Bind(Include = "MaTin,TieuDe,ChuyenMuc,GiaTien,DienTich,MoTa,NgayDang,MaNguoiDang,DiaChi,Image,LoaiTin,SoNgay,Facebook,Zalo")] TinDang tinDang)
        {
            try
            {
                HttpFileCollectionBase files = Request.Files;
                var x = "";
                if (!string.IsNullOrEmpty(tinDang.ToString()))
                {

                    for (int i = 0; i < files.Count; i++)
                    {
                        HttpPostedFileBase file = files[i];
                        byte[] ByteImgArray;
                        ByteImgArray = ConvertToBytes(file);
                        var ImageQuality = ConfigurationManager.AppSettings["ImageQuality"];
                        var reduceIMage = ReduceImageSize(ByteImgArray, ImageQuality);
                        string fileName = file.FileName;
                        x += fileName + ",";
                        string serverMapPath = Server.MapPath("~/Content/assets/img/uploadimage");
                        string filePath = serverMapPath + "//" + fileName;
                        SaveFile(reduceIMage, filePath, file.FileName);

                    }
                    string mota = tinDang.MoTa.ToString();
                    tinDang.Image = x.Remove(x.Length - 1);
                    data.Entry(tinDang).State = EntityState.Modified;
                    data.SaveChanges();
                    return RedirectToAction("Taisancuatoi");
                }

            }
            catch (Exception e)
            {
                if (ModelState.IsValid)
                {
                    data.Entry(tinDang).State = EntityState.Modified;
                    data.SaveChanges();
                    return RedirectToAction("Taisancuatoi");
                }
                ViewBag.MaNguoiDang = new SelectList(data.AspNetUsers, "Id", "Email", tinDang.MaNguoiDang);
                ViewBag.LoaiTin = new SelectList(data.Loai, "MaLoai", "TenLoai", tinDang.LoaiTin);
                return RedirectToAction("Taisancuatoi", "User");
            }
            return View(tinDang);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinDang tindang = data.TinDang.Find(id);
            if (tindang == null)
            {
                return HttpNotFound();
            }
            return View(tindang);
        }

        // Delete
        [Authorize]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TinDang course = data.TinDang.Find(id);
            data.TinDang.Remove(course);
            data.SaveChanges();
            return RedirectToAction("Taisancuatoi");
        }
        public ActionResult ProfileUser()
        {
            ApplicationUser currentUser = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());
            WebDataContext context = new WebDataContext();
            var thongtin = context.AspNetUsers.Where(c => c.Id == currentUser.Id).ToList();
            return View(thongtin);
        }
        public ActionResult EditProfile(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUsers aspNetUsers = data.AspNetUsers.Find(id);
            if (aspNetUsers == null)
            {
                return HttpNotFound();
            }
            return View(aspNetUsers);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditProfile([Bind(Include = "Id,Email,EmailConfirmed,PasswordHash,SecurityStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEndDateUtc,LockoutEnabled,AccessFailedCount,UserName,Name,Image,PasswordCon,ViTien,Facebook,Zalo")] AspNetUsers aspNetUsers)
        {
            try
            {
                HttpFileCollectionBase files = Request.Files;
                var x = "";
                if (!string.IsNullOrEmpty(aspNetUsers.ToString()))
                {

                    for (int i = 0; i < files.Count; i++)
                    {
                        HttpPostedFileBase file = files[i];
                        byte[] ByteImgArray;
                        ByteImgArray = ConvertToBytes(file);
                        var ImageQuality = ConfigurationManager.AppSettings["ImageQuality"];
                        var reduceIMage = ReduceImageSize(ByteImgArray, ImageQuality);
                        string fileName = file.FileName;
                        x += fileName + ",";
                        string serverMapPath = Server.MapPath("~/Content/assets/img/uploadimage");
                        string filePath = serverMapPath + "//" + fileName;
                        SaveFile(reduceIMage, filePath, file.FileName);

                    }
                    aspNetUsers.Image = x.Remove(x.Length - 1);
                    data.Entry(aspNetUsers).State = EntityState.Modified;
                    data.SaveChanges();
                    return RedirectToAction("ProfileUser");
                }
            }
            catch (Exception e)
            {
                if (ModelState.IsValid)
                {
                    data.Entry(aspNetUsers).State = EntityState.Modified;
                    data.SaveChanges();
                    return RedirectToAction("ProfileUser");
                }
            }
            return View(aspNetUsers);

        }

      
    }

}