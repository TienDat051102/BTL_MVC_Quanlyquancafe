using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Nest;
using Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Models;
using Quản_Lý_Của_Hàng_Bán_Cafe.Helpers;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using X.PagedList;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Controllers
{
    [Area("admin")]
    //[Route("admin/")]
    [Route("admin/KhoHang")]
    public class KhoHangController : Controller
    {
        Btlweb02Context db = new Btlweb02Context();
        [Route("index")]
        public IActionResult Index(int? page)
        {
            int pagesize = 6;
            int pagenumber = page == null || page < 0 ? 1 : page.Value;
            var lst = db.HangHoas.AsNoTracking().OrderBy(x => x.MaHh);
            PagedList<HangHoa> list = new PagedList<HangHoa>(lst, pagenumber, pagesize);
            var khohang = db.HangHoas.ToList();
            foreach(var item in khohang)
            {
                if(item.SoLuongCon < 1)
                {
                    TempData["ThongBao"] = "Số lượng hàng hóa " + item.TenHh + " sắp hết vui lòng nhập thêm";
                    return View(list);
                }
            }
            return View(list);
        }
        public List<NhapHang> nhapHangs
        {
            get
            {
                var data = HttpContext.Session.Get<List<NhapHang>>("KhoHang");
                if (data == null)
                {
                    data = new List<NhapHang>();
                }
                return data;
            }
        }
        [Route("KhoNhap")]
        [HttpGet]
        public IActionResult KhoNhap()
        {
            return View(nhapHangs);
        }
        [Route("ThemVaoGio")]
        public IActionResult ThemVaoGio(string id, double DonGia, int SoLuong)
        {
            if (ModelState.IsValid && DonGia != null && SoLuong !=null)
            {
                var GioHang = nhapHangs;
                var kiemtra = GioHang.SingleOrDefault(x => x.MaHh == id);
                if (kiemtra == null || kiemtra.DonGiaNhap != (decimal)DonGia)
                {
                    var hanghoa = db.HangHoas.SingleOrDefault(x => x.MaHh == id);
                    double thanhtien = DonGia * SoLuong;
                    kiemtra = new NhapHang
                    {
                        MaHh = id,
                        TenHh = hanghoa.TenHh,
                        DonGiaNhap = (decimal)DonGia,
                        SoLuongNhap = SoLuong,
                        TongTien = (decimal)DonGia * SoLuong,
                    };
                    GioHang.Add(kiemtra);
                }
                else
                {
                    kiemtra.SoLuongNhap += SoLuong;
                    kiemtra.TongTien += (decimal)DonGia * SoLuong;
                }
                HttpContext.Session.Set("KhoHang", GioHang);
                TempData["ThongBao"] = "Thêm hàng hóa vào giỏ thành công";
                return RedirectToAction("index");
            }
            else
            {
                TempData["ThongBao"] = "Thêm hàng hóa vào giỏ không thành công";
                return RedirectToAction("index");
            }
            
        }
        [Route("NhapHang")]
        [HttpGet]
        public IActionResult NhapHang(string id)
        {
            var hang = db.HangHoas.SingleOrDefault(x => x.MaHh == id);
            return View(hang);
        }
        [Route("DatHang")]
        [HttpGet]
        public IActionResult DatHang()
        {
            var data = HttpContext.Session.Get<List<NhapHang>>("KhoHang");
            if(data != null)
            {
                ViewBag.MaNcc = new SelectList(db.NhaCungCaps.ToList(), "MaNcc", "TenNcc");
                ViewBag.MaNv = new SelectList(db.NhanViens.ToList(), "MaNv", "TenNhanVien");
                return View();
            }
            TempData["ThongBao"] = "Không thể đặt hàng khi đơn hàng trống";
            return RedirectToAction("index");
        }
        [Route("DatHang")]
        [HttpPost]
        public IActionResult DatHang(ThongTinHoaDonNhap hoadon)
        {
            var data = HttpContext.Session.Get<List<NhapHang>>("KhoHang");
            
            if (ModelState.IsValid)
            {
                var _hoadonnhap = new HoaDonNhap()
                {
                    NgayNhapHang = DateTime.Now,
                    MaNcc = hoadon.MaNcc,
                    MaNv = hoadon.MaNv,
                    GhiChu = hoadon.GhiChu,

                };
                db.HoaDonNhaps.Add(_hoadonnhap);
                db.SaveChanges();
                foreach(var item in data)
                {
                    var chitiethoadonnhap = new ChiTietHoaDonNhap()
                    {
                        MaHoaDonNhap = _hoadonnhap.MaHoaDonNhap,
                        MaHh = item.MaHh,
                        DonGiaNhap = item.DonGiaNhap,
                        TongTien = item.TongTien,
                        SoLuongNhap = item.SoLuongNhap,
                    };
                    db.ChiTietHoaDonNhaps.Add(chitiethoadonnhap);
                    db.SaveChanges();
                    var hanghoa = db.HangHoas.SingleOrDefault(x=>x.MaHh == item.MaHh);
                    hanghoa.SoLuongCon += item.SoLuongNhap;
                    db.HangHoas.Update(hanghoa);
                    db.SaveChanges();
                }
                TempData["ThongBao"] = "Nhập Thêm Hàng Hóa Thành công";
                return RedirectToAction("index");
            }
            return View(hoadon);
        }
    }
}
