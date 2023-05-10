using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class ChiTietSanPham
{
    public int MaChiTietSp { get; set; }

    public int? MaSp { get; set; }

    public string? MaLuongDa { get; set; }

    public string? MaTopPing { get; set; }

    public string? MaSize { get; set; }

    public string? HinhAnh { get; set; }

    public decimal? DonGiaBan { get; set; }

    public double? GiamGia { get; set; }

    public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; } = new List<ChiTietHoaDon>();

    public virtual ICollection<DboAnhChiTietSp> DboAnhChiTietSps { get; set; } = new List<DboAnhChiTietSp>();

    public virtual ThemDum? MaLuongDaNavigation { get; set; }

    public virtual Size? MaSizeNavigation { get; set; }

    public virtual DboDanhMucSp? MaSpNavigation { get; set; }

    public virtual ThemDo? MaTopPingNavigation { get; set; }
}
