using Azure;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Nest;
using Quản_Lý_Của_Hàng_Bán_Cafe.Helpers;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models.Authentication;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models.cart;
using X.PagedList;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Controllers
{
    [Area("admin")]
    //[Route("admin/")]
    [Route("admin/GianHang")]
    public class GianHangController : Controller
    {
        Btlweb02Context db = new Btlweb02Context();
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
        public IActionResult ThemSanPham(int id)
        {
            var sp = db.DboDanhMucSps.SingleOrDefault(x => x.MaSp == id);
            if(sp!= null)
            {
                ViewBag.MaLuongDa = new SelectList(db.ThemDa.ToList(), "MaLuongDa", "MucDa");
                ViewBag.MaSize = new SelectList(db.Sizes.ToList(), "MaSize", "LoaiSize");
                ViewBag.MaTopPing = new SelectList(db.ThemDos.ToList(), "MaTopPing", "TenLoaiTopPing");
                return View(sp);
            }
            return RedirectToAction("index");
        }
        public List<cartItem> Carts
        {
            get
            {
                var data = HttpContext.Session.Get<List<cartItem>>("GioHang");
                if (data == null)
                {
                    data = new List<cartItem>();
                }
                return data;
            }
        }
        [Route("GioHang")]
        public IActionResult GioHang()
        {
            return View(Carts);
        }
        [Route("AddToCart")]
        public IActionResult AddToCart(int id, int SoLuong, string MucDa, string Size, string TenTopPing)
        {
            var myCart = Carts;
            //var item = myCart.SingleOrDefault(x => x.MaSp == id);
            //var kiemtra = myCart.SingleOrDefault(x=>x.MucDa== MucDa && x.LoaiSize ==Size && x.TenLoaiTopPing==TenTopPing);
            var kiemtratong = myCart.SingleOrDefault(x => x.MaSp == id && x.MaLuongDa == MucDa && x.MaSize == Size && x.MaTopPing == TenTopPing);
            if (kiemtratong == null)//chưa có
            {
                var hanghoa = db.DboDanhMucSps.SingleOrDefault(x => x.MaSp == id);
                kiemtratong = new cartItem
                {
                    MaSp = id,
                    TenSp = hanghoa.TenSp,
                    GiaBan = (double)hanghoa.GiaBanNhoNhat.Value,
                    SoLuong = SoLuong,
                    MaLuongDa = MucDa,
                    MaSize = Size,
                    MaTopPing = TenTopPing,
                    AnhDaiDien = hanghoa.AnhDaiDien,
                };
                myCart.Add(kiemtratong);
            }
            else
            {
                kiemtratong.SoLuong += SoLuong;
            }
            HttpContext.Session.Set("GioHang", myCart);
            return RedirectToAction("index");
        }
        [HttpDelete("{id}")]
        [Route("Remove")]
        public ActionResult Remove(int id)
        {
            try
            {
                List<cartItem> gioHang = Carts;
                var cart = gioHang.SingleOrDefault(x => x.MaSp == id);
                if (cart != null)
                {
                    gioHang.Remove(cart);
                }
                HttpContext.Session.Set<List<cartItem>>("GioHang", gioHang);
                return RedirectToAction("index");
            }
            catch
            {
                return RedirectToAction("index");
            }


        }
        [Route("CleanCart")]
        public ActionResult CleanCart()
        {
            HttpContext.Session.Remove("GioHang");
            return RedirectToAction("Index");
        }
        [Route("ThanhToan")]
        [HttpGet]
        public ActionResult ThanhToan()
        {

            var cart = HttpContext.Session.Get<List<cartItem>>("GioHang");
            if(cart != null)
            {
                ViewBag.MaKH = new SelectList(db.KhachHangs.ToList(), "MaKh", "TenKh");
                ViewBag.MaNv = new SelectList(db.NhanViens.ToList(), "MaNv", "TenNhanVien");
                ViewBag.MaBan = new SelectList(db.Bans.ToList(), "MaBan", "MaBan");
                return View();
            }
            return RedirectToAction("GioHang");
        }
        [Route("ThanhToan")]
        [HttpPost]
        public ActionResult ThanhToan(HoaDonBan hoadon)
        {
            var cart = HttpContext.Session.Get<List<cartItem>>("GioHang");
            var congthucmon = db.CongThucMons.ToList();
            if (ModelState.IsValid)
            {
                var _hoadon = new HoaDonBan()
                {
                    MaBan = hoadon.MaBan,
                    NgayLap = DateTime.Now,
                    MaKh = hoadon.MaKh,
                    MaNv = hoadon.MaNv,
                    GhiChu = null,
                    PhuongThucTt = "TM",
                    GiamGia =null,
                };
                db.HoaDonBans.Add(_hoadon);
                db.SaveChanges();
                foreach(var item in cart)
                {
                    foreach (var item2 in congthucmon)
                    {
                        if (item2.MaSp == item.MaSp)
                        {

                            var hanghoa = db.HangHoas.Find(item2.MaHh);
                            if (item2.SoLuongCanDung*item.SoLuong > hanghoa.SoLuongCon)
                            {
                                @TempData["thongbao"] = "Số lượng trong kho không đủ để làm món";
                                db.HoaDonBans.Remove(_hoadon);
                                db.SaveChanges();
                                return View();
                            }
                            else
                            {
                                hanghoa.SoLuongCon -= item2.SoLuongCanDung * item.SoLuong*1.00;
                                db.HangHoas.Update(hanghoa);
                                db.SaveChanges();
                            }
                        }

                    }
                    var chitiet = new ChiTietSanPham()
                    {
                        MaSp = item.MaSp,
                        MaLuongDa = item.MaLuongDa,
                        MaTopPing = item.MaTopPing,
                        MaSize = item.MaSize,
                        HinhAnh = null,
                        GiamGia = null,
                        DonGiaBan = (decimal?)item.GiaBan,
                    };
                    db.ChiTietSanPhams.Add(chitiet);
                    db.SaveChanges();
                    var chitiethoadon = new ChiTietHoaDon()
                    {
                        MaChiTietSp = chitiet.MaChiTietSp,
                        MaHoaDon = _hoadon.MaHoaDon,
                        SoLuong = item.SoLuong,
                        DonGiaBan = (decimal?)item.GiaBan,
                        TongTienHd = (decimal?)item.ThanhTien
                    };
                  
                    db.ChiTietHoaDons.Add(chitiethoadon);
                    db.SaveChanges();
                }
        
                HttpContext.Session.Remove("GioHang");
                return RedirectToAction("Index");
            }
            return View();
        }

    }
}
