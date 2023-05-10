using Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Models;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using X.PagedList;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Controllers
{
    [Area("admin")]
    //[Route("admin/")]
    [Route("admin/user")]
    public class UserController : Controller
    {
        Btlweb02Context db = new Btlweb02Context();
       
        [Route("")]
        [Route("index")]
        public IActionResult Index(int? page)
        {
            int pagesize = 6;
            int pagenumber = page == null ||page < 0?1 : page.Value;
            var lst = db.Users.AsNoTracking().OrderBy(x => x.UsernName);
            PagedList<User> list = new PagedList<User>(lst, pagenumber, pagesize);
            return View(list);
        }
        [Route("ThemTaiKhoan")]
        [HttpGet]
        public IActionResult ThemTaiKhoan()
        {
            return View();
        }
        [Route("ThemTaiKhoan")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemTaiKhoan(User taikhoan)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Users.Add(taikhoan);
                    db.SaveChanges();
                    return RedirectToAction("index");
                }
                return View(taikhoan);
            }
            catch
            {
                return View(taikhoan);
            }
       
        }
        [Route("Edit")]
        [HttpGet]
        public IActionResult Edit(string UserName)
        {
            var user = db.Users.Find(UserName);
            return View(user);
        }
        [Route("Edit")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(User taikhoan)
        {
            if (ModelState.IsValid)
            {

                db.Update(taikhoan);
                db.SaveChanges();
                return RedirectToAction("index");
            }
            return View(taikhoan);
        }
        [Route("Delete")]
        [HttpGet]
        public IActionResult Delete(string UserName)
        {
            var khachhang = db.KhachHangs.Where(x => x.UserName == UserName).ToList();
            var nhanvien = db.NhanViens.Where(x => x.Username == UserName).ToList();
            if(khachhang.Count()>0 || nhanvien.Count() > 0)
            {
                TempData["mes"] = "Không được xóa tài khoản này";
                return RedirectToAction("index");
            }
            db.Remove(db.Users.Find(UserName));
            db.SaveChanges();
            TempData["mes"] = "Xóa Thành Công";
            return RedirectToAction("index");
           
        }
        [Route("chitiet")]
        [HttpGet]
        public IActionResult ChiTiet(string UserName)
        {
            var taikhoan = db.Users.SingleOrDefault(x => x.UsernName == UserName);
            var NhanVien = db.NhanViens.SingleOrDefault(x => x.Username == UserName);
            if(taikhoan != null && NhanVien != null)
            {
                var chitietNV = new LayChiTiet
                {
                    UsernName = UserName,
                    Password = taikhoan.Password,
                    MaNv = NhanVien.MaNv,
                    TenNhanVien = NhanVien.TenNhanVien,
                    NgaySinh = NhanVien.NgaySinh,
                    Sdt = NhanVien.Sdt,
                    DiaChi = NhanVien.Sdt,
                    ChucVu = NhanVien.ChucVu,
                    AnhDaiDien = NhanVien.AnhDaiDien,
                    GhiChu = NhanVien.GhiChu
                };
                return View(chitietNV);
            }
            TempData["thongbao"] = "Tài Khoản Này không có thông tin chi tiết";
            return RedirectToAction("index");
        }

    }
}
