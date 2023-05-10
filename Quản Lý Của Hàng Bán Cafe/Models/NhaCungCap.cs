using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class NhaCungCap
{
    public string MaNcc { get; set; } = null!;

    public string? TenNcc { get; set; }

    public string? GhiChu { get; set; }

    public string? DiaChi { get; set; }

    public virtual ICollection<HoaDonNhap> HoaDonNhaps { get; set; } = new List<HoaDonNhap>();
}
