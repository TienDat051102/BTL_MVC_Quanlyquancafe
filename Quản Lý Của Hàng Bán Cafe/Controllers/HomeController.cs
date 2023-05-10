
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models;
using System.Diagnostics;
using X.PagedList;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models.Authentication;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Controllers
{
    public class HomeController : Controller
    {
        Btlweb02Context db = new Btlweb02Context();

        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
        public IActionResult TrangChu()
        {
            return View();
        }
        
        public IActionResult Index(int? page)
        {
            int pageSize = 6;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var listDanhSachSp = db.DboDanhMucSps.AsNoTracking().OrderBy(x => x.TenSp);
            PagedList<DboDanhMucSp> lst = new PagedList<DboDanhMucSp>(listDanhSachSp, pageNumber, pageSize);
            return View(lst);
        }
        public IActionResult SanPhamTheoLoai(int maloai, int? page)
        {
            int pageSize = 6;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var listDanhSachSp = db.DboDanhMucSps.AsNoTracking().Where(x=>x.MaLoai == maloai).OrderBy(x => x.TenSp);
            PagedList<DboDanhMucSp> lst = new PagedList<DboDanhMucSp>(listDanhSachSp, pageNumber, pageSize);
            ViewBag.maloai = maloai;
            return View(lst);
        }
        [Authentication]
        [HttpGet("{id}")]
        public IActionResult SanPhamChiTiet(int id)
        {
            var sp = db.DboDanhMucSps.SingleOrDefault(x => x.MaSp == id);

            if (sp != null)
            {
                return View(sp);

            }
            return RedirectToAction("index");
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}