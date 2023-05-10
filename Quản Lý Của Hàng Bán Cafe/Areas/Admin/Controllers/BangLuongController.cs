
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Models;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models;
using X.PagedList;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Controllers
{
    [Area("admin")]
    //[Route("admin/")]
    [Route("admin/BangLuong")]
    public class BangLuongController : Controller
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
        [Route("ChamCong")]
        [HttpGet]
        public IActionResult ChamCong(int id)
        {
            try
            {
                DateTime time = DateTime.Now;
                var chamcong = new BangLuongNv();
                if (time.Hour > 6 && time.Hour <= 9)
                {
                    chamcong.NgayLam = DateTime.Now;
                    chamcong.Maclv = 1;
                    chamcong.MaNv = id;
                    db.BangLuongNvs.Add(chamcong);
                    db.SaveChanges();
                    TempData["ThongBao"] = "Chấm Công thành công";
                    return RedirectToAction("index");
                }
                else if (time.Hour >= 10 && time.Hour <= 13)
                {
                    chamcong.NgayLam = DateTime.Now;
                    chamcong.Maclv = 2;
                    chamcong.MaNv = id;
                    db.BangLuongNvs.Add(chamcong);
                    db.SaveChanges();
                    TempData["ThongBao"] = "Chấm Công thành công";
                    return RedirectToAction("index");
                }
                else if (time.Hour >= 14 && time.Hour <= 17)
                {
                    chamcong.NgayLam = DateTime.Now;
                    chamcong.Maclv = 3;
                    chamcong.MaNv = id;
                    db.BangLuongNvs.Add(chamcong);
                    db.SaveChanges();
                    TempData["ThongBao"] = "Chấm Công thành công";
                    return RedirectToAction("index");
                }
                else if (time.Hour >= 18 && time.Hour <= 22)
                {
                    chamcong.NgayLam = DateTime.Now;
                    chamcong.Maclv = 4;
                    chamcong.MaNv = id;
                    db.BangLuongNvs.Add(chamcong);
                    db.SaveChanges();
                    TempData["ThongBao"] = "Chấm Công thành công";
                    return RedirectToAction("index");
                }
                else
                {
                    TempData["ThongBao"] = "Chấm Công Không thành công";
                    return RedirectToAction("index");
                }
            }
            catch
            {
                TempData["ThongBao"] = "Chấm Công Không thành công";
                return RedirectToAction("index");
            }
           

        }
        [Route("BangLuong")]
        [HttpGet]
        public IActionResult BangLuong(int id)
        {
            double Tinhluong=0;
            var nhanvien = db.NhanViens.SingleOrDefault(x => x.MaNv == id);
            var luong = db.BangLuongNvs.Where(x => x.MaNv == id).ToList();
            
            if(luong != null && nhanvien !=null)
            {

                foreach (var item in luong)
                {
                    var calam = db.CaLamViecs.SingleOrDefault(x=>x.MaClv == item.Maclv);
                    Tinhluong += (double)calam.TienLuongTheoCa * (int)calam.SoGioLv;
                }
                var dulieunv = new luongnhanvien();
                dulieunv.MaNv = nhanvien.MaNv;
                dulieunv.TenNhanVien = nhanvien.TenNhanVien;
                dulieunv.NgaySinh = nhanvien.NgaySinh;
                dulieunv.Sdt = nhanvien.Sdt;
                dulieunv.DiaChi = nhanvien.DiaChi;
                dulieunv.AnhDaiDien = nhanvien.AnhDaiDien;
                dulieunv.GhiChu = nhanvien.GhiChu;
                dulieunv.TongLuong = (double)Tinhluong;
                return View(dulieunv);
            }
            TempData["ThongBao"] = "Nhân viên này chưa có buổi làm việc nào";
            return RedirectToAction("index");
         }
        [Route("ThanhToanLuong")]
        [HttpGet]
        public IActionResult ThanhToanLuong(int id)
        {
            var bangluong = db.BangLuongNvs.Where(x=>x.MaNv == id).OrderBy(x=>x.NgayLam).ToList();
            if(bangluong != null)
            {
                foreach (var item in bangluong)
                {
                    db.BangLuongNvs.Remove(item);
                }
                db.SaveChanges();
                TempData["ThongBao"] = "Thanh toán lương cho nhân viên thành công";
                return RedirectToAction("index");
            }
            TempData["ThongBao"] = "Thanh toán lương cho nhân viên không thành công";
            return RedirectToAction("index");
        }
    }
}
