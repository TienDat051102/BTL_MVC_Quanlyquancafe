using Azure;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Models;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models;
using X.PagedList;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Controllers
{
    [Area("admin")]
    //[Route("admin/")]
    [Route("admin/DanhMucSanPham")]
    public class DanhMucSanPhamController : Controller
	{
        Btlweb02Context db = new Btlweb02Context();
        [Route("")]
        [Route("index")]
        public IActionResult Index(int? page)
		{
            int pagesize = 6;
            int pagenumber = page == null || page < 0 ? 1 : page.Value;
            var lst = db.DboDanhMucSps.AsNoTracking().OrderBy(x => x.MaSp);
            PagedList<DboDanhMucSp> list = new PagedList<DboDanhMucSp>(lst, pagenumber, pagesize);
            return View(list);
        }
        [Route("ThemSanPham")]
        [HttpGet]
        public IActionResult ThemSanPham()
        {
            ViewBag.MaLoai = new SelectList(db.LoaiSps.ToList(), "MaLoai", "TenLoai");
            return View();
        }
        [Route("ThemSanPham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemSanPham(DboDanhMucSp sanpham)
        {
            try
            {
                if(sanpham != null)
                {
                    db.DboDanhMucSps.Add(sanpham);
                    db.SaveChanges();
                    return RedirectToAction("index");
                }
                else
                {
                    return View(sanpham);
                }
            }
            catch
            {
                return View(sanpham);
            }
            
        }
        [Route("Edit")]
        [HttpGet]
        public IActionResult Edit(int masp)
        {
            var sanpham = db.DboDanhMucSps.Find(masp);
            if (sanpham != null)
            {
                ViewBag.MaLoai = new SelectList(db.LoaiSps.ToList(), "MaLoai", "TenLoai");
                return View(sanpham);
            }
            else
            {
                @TempData["thongbao"] = "Không Tìm Thấy Sản Phẩm";
                return RedirectToAction("index");
            }
        }
        [Route("Edit")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(DboDanhMucSp sanpham)
        {
            if (ModelState.IsValid)
            {

                db.Update(sanpham);
                db.SaveChanges();
                return RedirectToAction("index");
            }
            return View(sanpham);
        }
        [Route("ChiTiet")]
        [HttpGet]
        public IActionResult ChiTiet(int masp)
        {
            var sanpham = db.DboDanhMucSps.SingleOrDefault(x => x.MaSp == masp);
            if(sanpham != null)
            {
                return View(sanpham);
            }
            return View(masp);
        }
        [Route("Delete")]
        [HttpGet]
        public IActionResult Delete(int masp)
        {
            try
            {
                var sanpham = db.DboDanhMucSps.SingleOrDefault(x => x.MaSp == masp);
                var anhsp = db.DboAnhSps.SingleOrDefault(x => x.MaSp == masp);
                var congthucmon = db.CongThucMons.Where(x => x.MaSp == masp).ToList();
                var chitietsanpham = db.ChiTietSanPhams.Where(x => x.MaSp == masp).ToList();
                if(anhsp != null)
                {
                    db.DboAnhSps.Remove(anhsp);
                    db.SaveChanges();
                }
                if(congthucmon != null)
                {
                    foreach(var item in congthucmon)
                    {
                        db.CongThucMons.Remove(item);
                        db.SaveChanges();
                    }
                }
                if(chitietsanpham != null)
                {
                    foreach(var item in chitietsanpham)
                    {
                        db.ChiTietSanPhams.Remove(item);
                        db.SaveChanges();
                    }
                }
                if (sanpham != null)
                {
                    db.DboDanhMucSps.Remove(sanpham);
                    db.SaveChanges();
                    TempData["mes"] = "Xóa Thành Công";
                    return RedirectToAction("index");
                }
                TempData["mes"] = "Xóa không Thành Công";
                return RedirectToAction("index");
            }
            catch
            {
                TempData["mes"] = "Xóa không Thành Công";
                return RedirectToAction("index");
            }

            
        }

    }
}
