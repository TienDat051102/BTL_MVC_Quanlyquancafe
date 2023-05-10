using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class DboDanhMucSp
{
    public int MaSp { get; set; }

    public int? MaLoai { get; set; }

    public string? AnhDaiDien { get; set; }

    public string? TenSp { get; set; }

    public decimal? GiaBanCaoNhat { get; set; }

    public string? GioiThieuSp { get; set; }

    public decimal? GiaBanNhoNhat { get; set; }

    public virtual ICollection<ChiTietSanPham> ChiTietSanPhams { get; set; } = new List<ChiTietSanPham>();

    public virtual ICollection<CongThucMon> CongThucMons { get; set; } = new List<CongThucMon>();

    public virtual ICollection<DboAnhSp> DboAnhSps { get; set; } = new List<DboAnhSp>();

    public virtual LoaiSp? MaLoaiNavigation { get; set; }
}
