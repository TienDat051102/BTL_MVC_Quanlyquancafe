using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models.Authentication
{
	public class Authentication:ActionFilterAttribute
	{
		//kiểm tra nếu bằng null thì chạy vào trang Access login cái nào cần login thì đưa Authentiacation
		public override void OnActionExecuting(ActionExecutingContext context)
		{
			if (context.HttpContext.Session.GetString("UserName") == null)
			{
				context.Result = new RedirectToRouteResult(
					new RouteValueDictionary
					{
						{"Controller","Access" },
						{"Action","Login"}
					});
			}
		}
		
	}
}
