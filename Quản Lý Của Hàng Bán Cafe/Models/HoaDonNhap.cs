using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class HoaDonNhap
{
    public int MaHoaDonNhap { get; set; }

    public string? MaNcc { get; set; }

    public int? MaNv { get; set; }

    public DateTime? NgayNhapHang { get; set; }

    public string? GhiChu { get; set; }

    public virtual ICollection<ChiTietHoaDonNhap> ChiTietHoaDonNhaps { get; set; } = new List<ChiTietHoaDonNhap>();

    public virtual NhaCungCap? MaNccNavigation { get; set; }
}
