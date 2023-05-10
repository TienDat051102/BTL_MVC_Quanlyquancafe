namespace Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Models
{
    public class HoaDonChiTiet
    {
        public int MaHoaDon { get; set; }

        public DateTime? NgayLap { get; set; }

        public string? PhuongThucTt { get; set; }
        public string? TenKh { get; set; }
        public string? Sdtkh { get; set; }

        public string? DiaChi { get; set; }
        public string? TenNhanVien { get; set; }
        public string? Sdtnv { get; set; }
        public decimal? TongTienHD { get; set; }
    }
}
