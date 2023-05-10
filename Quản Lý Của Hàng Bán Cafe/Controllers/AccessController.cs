
using Quản_Lý_Của_Hàng_Bán_Cafe.Data;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Identity.Client.Kerberos;
using Microsoft.AspNetCore.Http;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Controllers
{
    public class AccessController : Controller
    {
 
        Btlweb02Context db = new Btlweb02Context();
        [HttpGet]
        public IActionResult Login()
        {
            if (HttpContext.Session.GetString("UserName") == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("index", "Home");
            }
        }
        [HttpPost]
        public IActionResult Login(User user)
        {
            try
            {
                if (HttpContext.Session.GetString("UserName") == null)
                {

                    var _user = db.Users.Where(x => x.UsernName.Equals(user.UsernName) && x.Password.Equals(user.Password)).FirstOrDefault();
                    var kt = _user.LoaiUser.Trim();
                    if (_user != null && kt== "KH".ToString())
                    {
                        HttpContext.Session.SetString("UserName", _user.UsernName.ToString());

                        return RedirectToAction("index", "Home");

                    }
                    else
                    {
                        return Redirect("/admin/index");
                        //return RedirectToAction("index", "Home", new { area = "admin" });
                    }

                }
                return View();
            }
            catch
            {
                return View();
            }

        }
        [HttpGet]
        public IActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult DangKy(ThemTaiKhoan taikhoan)
        {
            try
            {
                var user = db.Users.SingleOrDefault(x => x.UsernName == taikhoan.UserName);
                var khachhang = db.KhachHangs.SingleOrDefault(x => x.TenKh == taikhoan.TenKh);

                if (user == null && khachhang == null && taikhoan.Password == taikhoan.CheckPassword)
                {
                    var _user = new User
                    {
                        UsernName = taikhoan.UserName,
                        Password = taikhoan.Password,
                        LoaiUser = "KH",
                    };
                    db.Users.Add(_user);
                    db.SaveChanges();
                    var _khachhang = new KhachHang
                    {
                        TenKh = taikhoan.TenKh,
                        UserName = _user.UsernName,
                        Sdt = taikhoan.Sdt,
                    };
                    db.KhachHangs.Add(_khachhang);
                    db.SaveChanges();

                    return RedirectToAction("Login");
                }
                return View(taikhoan);
            }
            catch
            {
                return View(taikhoan);
            }
          

        }
        [HttpGet]
        public IActionResult QuenMatKhau()
        {
            return View();
        }
        [HttpPost]
        public IActionResult QuenMatKhau(QuenMatKhau taikhoan)
        {
            try
            {
                var kh = db.KhachHangs.SingleOrDefault(x => x.Sdt == taikhoan.Sdt && x.UserName == taikhoan.UserName);
                var _user = db.Users.SingleOrDefault(x=>x.UsernName == taikhoan.UserName);
                var kt = _user.LoaiUser.Trim();
                if (kh != null && kt == "KH".ToString() && taikhoan.Password == taikhoan.CheckPassword)
                {
                    _user.Password = taikhoan.Password;
                    db.SaveChanges();
                    return RedirectToAction("login");
                }
                return View(taikhoan);
            }
            catch
            {
                return View(taikhoan);
            }
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            HttpContext.Session.Remove("UserName");
            return RedirectToAction("Login", "Access");
        }
    }
}
