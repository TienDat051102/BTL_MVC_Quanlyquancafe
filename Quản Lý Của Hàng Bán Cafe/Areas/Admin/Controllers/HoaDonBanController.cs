using Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Models;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
//using NuGet.Protocol;
using X.PagedList;
using Microsoft.AspNetCore.Razor.Language.Intermediate;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Controllers
{
    [Area("admin")]
    //[Route("admin/")]
    [Route("admin/HoaDonBan")]
    public class HoaDonBanController : Controller
    {
        
        Btlweb02Context db = new Btlweb02Context();
        [Route("")]
        [Route("index")]
        public IActionResult Index(int? page)
        {
            int pagesize = 6;
            int pagenumber = page == null || page < 0 ? 1 : page.Value;
            var lst = db.HoaDonBans.AsNoTracking().OrderBy(x => x.MaHoaDon);
            PagedList<HoaDonBan> list = new PagedList<HoaDonBan>(lst, pagenumber, pagesize);
            return View(list);
        }
        [Route("ChiTiet")]
        [HttpGet]
        public IActionResult ChiTiet(int id)
        {
            decimal tongtienhd = 0;
            var chitiethoadon = db.HoaDonBans.SingleOrDefault(x => x.MaHoaDon == id);
            var khahang = db.KhachHangs.SingleOrDefault(x => x.MaKh == chitiethoadon.MaKh);
            var nhanvien = db.NhanViens.SingleOrDefault(x => x.MaNv == chitiethoadon.MaNv);
            var chitiet = db.ChiTietHoaDons.Where(x => x.MaHoaDon == id);
            if (chitiet != null)
            {
                foreach(var item in chitiet)
                {
                    tongtienhd += (decimal)item.TongTienHd;
                }
            }
            var xuathoadon = new HoaDonChiTiet()
            {
                MaHoaDon = id,
                NgayLap = chitiethoadon.NgayLap,
                PhuongThucTt = chitiethoadon.PhuongThucTt,
                TenKh = khahang.TenKh,
                Sdtkh = khahang.Sdt,
                DiaChi = khahang.DiaChi,
                TenNhanVien = nhanvien.TenNhanVien,
                Sdtnv = nhanvien.Sdt,
                TongTienHD =tongtienhd,
            };
            return View(xuathoadon);

        }
        //[Route("ThemHoaDonMoi")]
        //[HttpGet]
        //public IActionResult ThemHoaDonMoi()
        //{
        //    ViewBag.MaKH = new SelectList(db.KhachHangs.ToList(), "MaKh", "TenKh");
        //    ViewBag.MaNv = new SelectList(db.NhanViens.ToList(), "MaNv", "TenNhanVien");
        //    ViewBag.MaBan = new SelectList(db.Bans.ToList(), "MaBan", "MaBan");
        //    ViewBag.MaSP = new SelectList(db.DboDanhMucSps.ToList(), "MaSp", "TenSp");
        //    ViewBag.MaLuongDa = new SelectList(db.ThemDa.ToList(), "MaLuongDa", "MucDa");
        //    ViewBag.MaTopPing = new SelectList(db.ThemDos.ToList(), "MaTopPing", "TenLoaiTopPing");
        //    ViewBag.MaSize = new SelectList(db.Sizes.ToList(), "MaSize", "LoaiSize");
        //    ViewBag.HinhAnh = new SelectList(db.DboAnhChiTietSps.ToList(), "TenFileAnh", "TenFileAnh");
        //    return View();
        //}
        //[Route("ThemHoaDonMoi")]
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public IActionResult ThemHoaDonMoi(ThemHoaDon themhoadon)
        //{
        //    try
        //    {
        //        if (ModelState.IsValid)
        //        {
        //            var _themhoadon = new HoaDonBan
        //            {
        //                NgayLap = themhoadon.NgayLap,
        //                MaKh = themhoadon.MaKh,
        //                MaNv = themhoadon.MaNv,
        //                MaBan = themhoadon.MaBan,
        //                GiamGia = themhoadon.GiamGiahd,
        //                PhuongThucTt = themhoadon.PhuongThucTt,
        //                GhiChu = themhoadon.GhiChu
        //            };
        //            db.HoaDonBans.Add(_themhoadon);
        //            db.SaveChanges();
        //            var laygiasp = db.DboDanhMucSps.Find(themhoadon.MaSp);
        //            var themchitietsp = new ChiTietSanPham
        //            {
        //                MaSp = themhoadon.MaSp,
        //                MaLuongDa = themhoadon.MaLuongDa,
        //                MaTopPing = themhoadon.MaTopPing,
        //                MaSize = themhoadon.MaSize,
        //                HinhAnh = themhoadon.HinhAnh,
        //                DonGiaBan = themhoadon.DonGiaBan,
        //                GiamGia = themhoadon.GiamGiasp,
        //            };
        //            db.ChiTietSanPhams.Add(themchitietsp);
        //            db.SaveChanges();
        //            double tongtien =((double)(themchitietsp.DonGiaBan * themhoadon.SoLuong));
        //            var themchitiethoadon = new ChiTietHoaDon
        //            {
        //                MaChiTietSp = themchitietsp.MaChiTietSp,
        //                MaHoaDon = _themhoadon.MaHoaDon,
        //                SoLuong = themhoadon.SoLuong,
        //                DonGiaBan = themhoadon.DonGiaBan,
        //                TongTienHd = (decimal)tongtien,
        //            };
        //            db.ChiTietHoaDons.Add(themchitiethoadon);
        //            db.SaveChanges();


        //            return RedirectToAction("index");
        //        }
        //        return View(themhoadon);
        //    }
        //    catch
        //    {
        //        return View(themhoadon);
        //    }
         
        //}
    }
}
