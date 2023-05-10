using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class Size
{
    public string MaSize { get; set; } = null!;

    public string? LoaiSize { get; set; }

    public decimal? Giá { get; set; }

    public virtual ICollection<ChiTietSanPham> ChiTietSanPhams { get; set; } = new List<ChiTietSanPham>();
}
