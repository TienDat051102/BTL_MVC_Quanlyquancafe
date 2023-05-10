using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class ChiTietHoaDonNhap
{
    public int MaHoaDonNhap { get; set; }

    public string MaHh { get; set; } = null!;

    public decimal? DonGiaNhap { get; set; }

    public double? SoLuongNhap { get; set; }

    public decimal? TongTien { get; set; }

    public virtual HangHoa MaHhNavigation { get; set; } = null!;

    public virtual HoaDonNhap MaHoaDonNhapNavigation { get; set; } = null!;
}
