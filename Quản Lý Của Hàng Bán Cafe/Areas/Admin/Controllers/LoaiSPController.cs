using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Models;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models;
using X.PagedList;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Controllers
{

    [Area("admin")]
    //[Route("admin/")]
    [Route("admin/LoaiSP")]
    public class LoaiSPController : Controller
    {
        Btlweb02Context db = new Btlweb02Context();
        [Route("index")]
        public IActionResult Index(int? page)
        {
            int pagesize = 6;
            int pagenumber = page == null || page < 0 ? 1 : page.Value;
            var lst = db.LoaiSps.AsNoTracking().OrderBy(x => x.MaLoai);
            PagedList<LoaiSp> list = new PagedList<LoaiSp>(lst, pagenumber, pagesize);
            return View(list);
        }
        [Route("AddLoai")]
        [HttpGet]
        public IActionResult AddLoai()
        {
            return View();
        }
        [Route("AddLoai")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddLoai(LoaiSp loai)
        {
            if (ModelState.IsValid)
            {
                LoaiSp _loai = new LoaiSp(); 
                _loai.TenLoai = loai.TenLoai;
                db.LoaiSps.Add(loai);
                db.SaveChanges();
                return RedirectToAction("index");
            }
            return View(loai);
        }
        [Route("chitiet")]
        [HttpGet]
        public IActionResult ChiTiet(int maloai)
        {

            var loaisp = db.LoaiSps.SingleOrDefault(x=>x.MaLoai == maloai);
            if (loaisp != null)
            {
               return View(loaisp);
            }
            TempData["thongbao"] = "Loại này hiện tại chưa có sản phẩm nào";
            return RedirectToAction("index");
        }
        [Route("Edit")]
        [HttpGet]
        public IActionResult Edit(int maloai)
        {
            var loaisp = db.LoaiSps.SingleOrDefault(x => x.MaLoai == maloai);
            return View(loaisp);
        }
        [Route("Edit")]
        [HttpPost]
        public IActionResult Edit(LoaiSp loai)
        {

            if (ModelState.IsValid)
            {
                db.Update(loai);
                db.SaveChanges();
                return RedirectToAction("index");
            }
            return View(loai);
        }
        [Route("Delete")]
        [HttpGet]
        public IActionResult Delete(int maloai)
        {
            try
            {
                var loai = db.LoaiSps.SingleOrDefault(x=>x.MaLoai == maloai);
                var danhmucsanpham = db.DboDanhMucSps.SingleOrDefault(x => x.MaLoai == maloai);
                if (danhmucsanpham != null)
                {
                    TempData["thongbao"] = "Không thể xóa sản phẩm này";
                    return View("index");
                }
                db.LoaiSps.Remove(loai);
                db.SaveChanges();
                TempData["thongbao"] = "Xóa Loại sản phẩm thành công";
                return RedirectToAction("index");
            }
            catch
            {
                TempData["thongbao"] = "Không thể xóa sản phẩm này";
                return RedirectToAction("index");
            }

        }
    }
}
