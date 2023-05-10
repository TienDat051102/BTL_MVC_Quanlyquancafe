using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class ThemDo
{
    public string MaTopPing { get; set; } = null!;

    public string? TenLoaiTopPing { get; set; }

    public int? GiaTopping { get; set; }

    public virtual ICollection<ChiTietSanPham> ChiTietSanPhams { get; set; } = new List<ChiTietSanPham>();
}
