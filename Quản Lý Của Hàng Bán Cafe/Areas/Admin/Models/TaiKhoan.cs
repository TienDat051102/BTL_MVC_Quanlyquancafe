namespace Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Models
{
    public class TaiKhoan
    {

    }
    public class LayChiTiet
    {
        public string UsernName { get; set; } = null!;

        public string? Password { get; set; }
        public int MaNv { get; set; }

        public string? TenNhanVien { get; set; }

        public DateTime? NgaySinh { get; set; }

        public string? Sdt { get; set; }

        public string? DiaChi { get; set; }

        public string? ChucVu { get; set; }

        public string? AnhDaiDien { get; set; }

        public string? GhiChu { get; set; }
    }
    public class laychitietkh
    {
        public string UsernName { get; set; } = null!;

        public int MaKh { get; set; }

        public string? UserName { get; set; }

        public string? TenKh { get; set; }

        public DateTime? NgaySinh { get; set; }

        public string? Sdt { get; set; }

        public string? DiaChi { get; set; }

        public int? DiemTl { get; set; }

        public string? GhiChu { get; set; }
    }
}
