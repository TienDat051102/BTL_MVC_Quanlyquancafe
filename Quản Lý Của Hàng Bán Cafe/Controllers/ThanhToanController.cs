using Quản_Lý_Của_Hàng_Bán_Cafe.Helpers;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models.cart;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Controllers
{
    public class ThanhToanController : Controller
    {
        private readonly Btlweb02Context _context;
        public ThanhToanController(Btlweb02Context context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var user = HttpContext.Session.GetString("UserName");
            var kh = _context.KhachHangs.SingleOrDefault(x => x.UserName == user);
            return View(kh);
        }
        [HttpPost]
        public IActionResult Index(KhachHang khachhang)
        {
            var cart = HttpContext.Session.Get<List<cartItem>>("GioHang");
            var user = HttpContext.Session.GetString("UserName");
            var kh = _context.KhachHangs.SingleOrDefault(x => x.UserName == user);
            var congthucmon = _context.CongThucMons.ToList();
            if (khachhang.DiaChi == null)
            {
                ModelState.AddModelError("", "Địa chỉ không được để trống");
            }
            if (kh != null)
            {
                kh.Sdt = khachhang.Sdt;
                kh.DiaChi = khachhang.DiaChi;
                _context.Update(kh);
                _context.SaveChanges();
            }
            if (ModelState.IsValid)
            {
                //khởi tạo hóa đơn
                var hoadon = new HoaDonBan()
                {
                    MaBan = 1,
                    NgayLap = DateTime.Now,
                    MaKh = kh.MaKh,
                    MaNv = 3,
                    GhiChu = null,
                    PhuongThucTt = "CK",
                    GiamGia = null,
                };
               
                _context.HoaDonBans.Add(hoadon);
                _context.SaveChanges();
                foreach (var item in cart)
                {
                    foreach (var item2 in congthucmon)
                    {
                        if (item2.MaSp == item.MaSp)
                        {

                            var hanghoa = _context.HangHoas.Find(item2.MaHh);
                            if (item2.SoLuongCanDung * item.SoLuong > hanghoa.SoLuongCon)
                            {
                                @TempData["thongbao"] = "Số lượng trong kho không đủ để làm món";
                                _context.HoaDonBans.Remove(hoadon);
                                _context.SaveChanges();
                                return View("index");
                            }
                            else
                            {
                                hanghoa.SoLuongCon -= item2.SoLuongCanDung * item.SoLuong * 1.00;
                                _context.HangHoas.Update(hanghoa);
                                _context.SaveChanges();
                            }
                        }

                    }
                    var chiTiet = new ChiTietSanPham
                    {
                    MaChiTietSp = new(),
                    MaSp = item.MaSp,
                    MaLuongDa = item.MaLuongDa,
                    MaTopPing = item.MaTopPing,
                    MaSize = item.MaSize,
                    HinhAnh = null,
                    GiamGia = null,
                    DonGiaBan = (decimal?)item.GiaBan,
                    };
        
                    _context.Add(chiTiet);
                    _context.SaveChanges();

                    ChiTietHoaDon chitiethoadon = new ChiTietHoaDon();
                    chitiethoadon.MaChiTietSp = chiTiet.MaChiTietSp;
                    chitiethoadon.MaHoaDon = hoadon.MaHoaDon;
                    chitiethoadon.SoLuong = item.SoLuong;
                    chitiethoadon.DonGiaBan = (decimal?)item.GiaBan;
                    chitiethoadon.TongTienHd = (decimal?)item.ThanhTien;
                    _context.Add(chitiethoadon);
                    _context.SaveChanges();
                }
               
                HttpContext.Session.Remove("GioHang");
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
    }
}
