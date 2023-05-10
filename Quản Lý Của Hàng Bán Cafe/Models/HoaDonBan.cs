using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class HoaDonBan
{
    public int MaHoaDon { get; set; }

    public DateTime? NgayLap { get; set; }

    public int? MaKh { get; set; }

    public int? MaNv { get; set; }

    public int? MaBan { get; set; }

    public double? GiamGia { get; set; }

    public string? PhuongThucTt { get; set; }

    public string? GhiChu { get; set; }

    public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; } = new List<ChiTietHoaDon>();

    public virtual Ban? MaBanNavigation { get; set; }

    public virtual KhachHang? MaKhNavigation { get; set; }

    public virtual NhanVien? MaNvNavigation { get; set; }
}
