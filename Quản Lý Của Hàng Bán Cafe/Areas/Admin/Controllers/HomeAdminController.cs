using Microsoft.AspNetCore.Mvc;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin/")]
    [Route("admin/homeadmin")]
    
    public class HomeAdminController : Controller
    {
        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {
            return View();
        }
        
    }
}
