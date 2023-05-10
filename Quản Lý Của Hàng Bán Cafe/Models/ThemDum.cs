using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class ThemDum
{
    public string MaLuongDa { get; set; } = null!;

    public double? MucDa { get; set; }

    public virtual ICollection<ChiTietSanPham> ChiTietSanPhams { get; set; } = new List<ChiTietSanPham>();
}
