using Quản_Lý_Của_Hàng_Bán_Cafe.Models;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Repository
{
    public class LoaiSPRepository : ILoaiSPRepository
    {
        private readonly Btlweb02Context context;
        public LoaiSPRepository(Btlweb02Context _context)
        {
            context = _context;
        }
        public LoaiSp Add(LoaiSp loaiSp)
        {
            throw new NotImplementedException();
        }

        public LoaiSp Delete(LoaiSp maloaiSp)
        {
            throw new NotImplementedException();
        }

        public LoaiSp GeLoaiSp(LoaiSp maloaiSp)
        {
            return context.LoaiSps.Find(maloaiSp);
        }

        public IEnumerable<LoaiSp> GetAllLoaiSp()
        {
            return context.LoaiSps;
        }

        public LoaiSp Update(LoaiSp loaiSp)
        {
            throw new NotImplementedException();
        }
    }
}
