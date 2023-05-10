namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models.cart
{
    public class cartItem
    {
        public int MaSp { get; set; }
        public string? AnhDaiDien { get; set; }
        public string? TenSp { get; set; }
        public double GiaBan { get; set; }
        public int SoLuong { get; set; }
        public string MaLuongDa { get; set; } = null!;
        public string MaSize { get; set; } = null!;
        public string MaTopPing { get; set; } = null!;
        public double ThanhTien => SoLuong * GiaBan;
    }
}
