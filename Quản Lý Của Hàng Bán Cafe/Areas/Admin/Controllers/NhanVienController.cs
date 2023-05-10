using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models;
using Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Models;
using X.PagedList;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Controllers
{
    [Area("admin")]
    //[Route("admin/")]
    [Route("admin/NhanVien")]
    public class NhanVienController : Controller
    {
        Btlweb02Context db = new Btlweb02Context(); 
        [Route("index")]
        public IActionResult Index(int? page)
        {
            int pagesize = 6;
            int pagenumber = page == null || page < 0 ? 1 : page.Value;
            var lst = db.NhanViens.AsNoTracking().OrderBy(x => x.TenNhanVien);
            PagedList<NhanVien> list = new PagedList<NhanVien>(lst, pagenumber, pagesize);
            return View(list);
        }
        [Route("ThemNhanVien")]
        [HttpGet]
        public IActionResult ThemNhanVien()
        {
            return View();
        }
        [Route("ThemNhanVien")]
        [HttpPost]
        public IActionResult ThemNhanVien(ThemNhanVien themNhanVien)
        {
            try
            {
                if (themNhanVien != null)
                {
                    var UserNV = new User();
                    UserNV.UsernName = themNhanVien.UsernName;
                    UserNV.Password = themNhanVien.Password;
                    UserNV.LoaiUser = "NV";
                    db.Users.Add(UserNV);
                    db.SaveChanges();
                    var nhanVien = new NhanVien
                    {
                        TenNhanVien = themNhanVien.TenNhanVien,
                        NgaySinh = themNhanVien.NgaySinh,
                        Sdt = themNhanVien.Sdt,
                        DiaChi = themNhanVien.DiaChi,
                        AnhDaiDien = themNhanVien.AnhDaiDien,
                        GhiChu = themNhanVien.GhiChu,
                        Username = themNhanVien.UsernName,
                        ChucVu = "CV"
                    };
                    db.NhanViens.Add(nhanVien);
                    db.SaveChanges();
                    TempData["ThongBao"] = "Thêm nhân viên thành công";
                    return RedirectToAction("index");
                }
                TempData["ThongBao"] = "Thêm nhân viên Không thành công";
                return View(themNhanVien);
            }
            catch
            {
                TempData["ThongBao"] = "Thêm nhân viên Không thành công";
                return View(themNhanVien);
            }
        }
        [Route("Edit")]
        [HttpGet]
        public IActionResult Edit(int id)
        {
            var nhanvien = db.NhanViens.SingleOrDefault(x => x.MaNv == id);
            if(nhanvien != null)
            {
                return View(nhanvien);
            }
            TempData["ThongBao"] = "Không Có Nhân Viên Này";
            return RedirectToAction("index");
        }
        [Route("Edit")]
        [HttpPost]
        public IActionResult Edit(NhanVien nhanvien)
        {
           
            if (nhanvien != null)
            {
                db.NhanViens.Update(nhanvien);
                db.SaveChanges();
                TempData["ThongBao"] = "Sửa thông tin nhân viên thành công";
                return RedirectToAction("index");
            }
            TempData["ThongBao"] = "Sửa không thành công";
            return View(nhanvien);
        }
        [Route("ChiTiet")]
        [HttpGet]
        public IActionResult ChiTiet(int id)
        {
            var nhanvien = db.NhanViens.SingleOrDefault(x => x.MaNv == id);
            if(nhanvien!= null)
            {
                return View(nhanvien);
            }
            TempData["ThongBao"] = "Không Có Nhân Viên Này";
            return RedirectToAction("index");
        }
        [Route("Delete")]
        [HttpGet]
        public IActionResult Delete(int id)
        {
            try
            {
                var nhanvien = db.NhanViens.SingleOrDefault(x => x.MaNv == id);
                var users = db.Users.SingleOrDefault(x => x.UsernName == nhanvien.Username);
                if (nhanvien != null && users != null)
                {
                    db.NhanViens.Remove(nhanvien);
                    db.SaveChanges();
                    db.Users.Remove(users);
                    db.SaveChanges();
                    TempData["ThongBao"] = "Xóa Nhân Viên thành công";
                    return RedirectToAction("index");
                }
                TempData["ThongBao"] = "Xóa không thành công";
                return RedirectToAction("index");
            }
            catch
            {
                TempData["ThongBao"] = "Không thể xóa nhân viên này";
                return RedirectToAction("index");
            }

        }
    }
}
