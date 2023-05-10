using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class HangHoa
{
    public string MaHh { get; set; } = null!;

    public string? TenHh { get; set; }

    public double? SoLuongCon { get; set; }

    public virtual ICollection<ChiTietHoaDonNhap> ChiTietHoaDonNhaps { get; set; } = new List<ChiTietHoaDonNhap>();

    public virtual ICollection<CongThucMon> CongThucMons { get; set; } = new List<CongThucMon>();
}
