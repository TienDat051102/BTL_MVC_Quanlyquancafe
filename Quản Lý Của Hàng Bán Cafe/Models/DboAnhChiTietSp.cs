using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class DboAnhChiTietSp
{
    public int MaChiTietSp { get; set; }

    public string TenFileAnh { get; set; } = null!;

    public virtual ChiTietSanPham MaChiTietSpNavigation { get; set; } = null!;
}
