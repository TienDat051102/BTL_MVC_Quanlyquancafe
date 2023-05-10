namespace Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Models
{
    public class NhapHang
    {
        public string MaHh { get; set; } = null!;

        public string? TenHh { get; set; }
        public decimal? DonGiaNhap { get; set; }

        public double? SoLuongNhap { get; set; }

        public decimal? TongTien { get; set; }
    }
}
