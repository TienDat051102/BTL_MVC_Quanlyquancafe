using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class ChiTietHoaDon
{
    public int MaHoaDon { get; set; }

    public int MaChiTietSp { get; set; }

    public int? SoLuong { get; set; }

    public decimal? DonGiaBan { get; set; }

    public decimal? TongTienHd { get; set; }

    public virtual ChiTietSanPham MaChiTietSpNavigation { get; set; } = null!;

    public virtual HoaDonBan MaHoaDonNavigation { get; set; } = null!;
}
