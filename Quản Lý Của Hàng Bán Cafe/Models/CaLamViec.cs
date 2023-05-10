using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class CaLamViec
{
    public int MaClv { get; set; }

    public string? TenClv { get; set; }

    public int? SoGioLv { get; set; }

    public decimal? TienLuongTheoCa { get; set; }

    public virtual ICollection<BangLuongNv> BangLuongNvs { get; set; } = new List<BangLuongNv>();
}
