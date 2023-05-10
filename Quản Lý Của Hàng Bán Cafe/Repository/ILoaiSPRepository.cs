using Quản_Lý_Của_Hàng_Bán_Cafe.Models;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Repository
{
    public interface ILoaiSPRepository
    {
        LoaiSp Add(LoaiSp loaiSp);
        LoaiSp Update(LoaiSp loaiSp);
        LoaiSp Delete(LoaiSp maloaiSp);
        LoaiSp GeLoaiSp(LoaiSp maloaiSp);
        IEnumerable<LoaiSp> GetAllLoaiSp();
    }
}
