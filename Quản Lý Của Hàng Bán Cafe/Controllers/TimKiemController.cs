using Quản_Lý_Của_Hàng_Bán_Cafe.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class TimKiemController : ControllerBase
	{
        [HttpGet]
        public List<DboDanhMucSp> getSptensp(string ten)
        {
            Btlweb02Context dbCustomer = new Btlweb02Context();
            List<DboDanhMucSp> t = new List<DboDanhMucSp>();
            t = dbCustomer.DboDanhMucSps.Where(x => x.TenSp.Contains(ten)).ToList();
            return t;
        }
    }
}
