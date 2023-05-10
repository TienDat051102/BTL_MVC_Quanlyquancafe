using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class NhanVien
{
    public int MaNv { get; set; }

    public string? Username { get; set; }

    public string? TenNhanVien { get; set; }

    public DateTime? NgaySinh { get; set; }

    public string? Sdt { get; set; }

    public string? DiaChi { get; set; }

    public string? ChucVu { get; set; }

    public string? AnhDaiDien { get; set; }

    public string? GhiChu { get; set; }

    public virtual ICollection<BangLuongNv> BangLuongNvs { get; set; } = new List<BangLuongNv>();

    public virtual ICollection<HoaDonBan> HoaDonBans { get; set; } = new List<HoaDonBan>();

    public virtual User? UsernameNavigation { get; set; }
}
