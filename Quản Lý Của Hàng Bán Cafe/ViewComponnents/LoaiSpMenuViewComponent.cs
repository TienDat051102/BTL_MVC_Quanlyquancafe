using Quản_Lý_Của_Hàng_Bán_Cafe.Repository;
using Microsoft.AspNetCore.Mvc;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.ViewComponnents
{
    public class LoaiSpMenuViewComponent : ViewComponent
    {
        private readonly ILoaiSPRepository _loaiSpRepository;
        public LoaiSpMenuViewComponent(ILoaiSPRepository loaiSpRepository)
        {
            _loaiSpRepository = loaiSpRepository;
        }
        public IViewComponentResult Invoke()
        {
            var loaisps = _loaiSpRepository.GetAllLoaiSp().OrderBy(x => x.TenLoai);
            return View(loaisps);
        }
    }
}
