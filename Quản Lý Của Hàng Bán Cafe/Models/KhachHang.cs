using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class KhachHang
{
    public int MaKh { get; set; }

    public string? UserName { get; set; }

    public string? TenKh { get; set; }

    public DateTime? NgaySinh { get; set; }

    public string? Sdt { get; set; }

    public string? DiaChi { get; set; }

    public int? DiemTl { get; set; }

    public string? GhiChu { get; set; }

    public virtual ICollection<HoaDonBan> HoaDonBans { get; set; } = new List<HoaDonBan>();

    public virtual User? UserNameNavigation { get; set; }
}
