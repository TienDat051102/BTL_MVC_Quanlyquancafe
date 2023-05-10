using Quản_Lý_Của_Hàng_Bán_Cafe.Models;
using Microsoft.AspNetCore.Mvc;
using Quản_Lý_Của_Hàng_Bán_Cafe.Helpers;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models.cart;
using System.Drawing;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models.Authentication;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Controllers
{
    public class CartController : Controller
    {
        private readonly Btlweb02Context _context;
        public CartController(Btlweb02Context context)
        {
            _context = context;
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
        [Authentication]
        public IActionResult Index()
        {
            return View(Carts);
        }

        public IActionResult AddToCart(int id, int SoLuong, string MucDa, string Size, string TenTopPing)
        {
            var myCart = Carts;
            //var item = myCart.SingleOrDefault(x => x.MaSp == id);
            //var kiemtra = myCart.SingleOrDefault(x=>x.MucDa== MucDa && x.LoaiSize ==Size && x.TenLoaiTopPing==TenTopPing);
            var kiemtratong = myCart.SingleOrDefault(x => x.MaSp == id && x.MaLuongDa == MucDa && x.MaSize == Size && x.MaTopPing == TenTopPing);
            if (kiemtratong == null)//chưa có
            {
                var hanghoa = _context.DboDanhMucSps.SingleOrDefault(x => x.MaSp == id);
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
        [Route("/Carts/remove")]
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

        public ActionResult CleanCart()
        {
            HttpContext.Session.Remove("GioHang");
            return RedirectToAction("Index");

        }

    }
}
