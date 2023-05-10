using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class CongThucMon
{
    public int MaSp { get; set; }

    public string MaHh { get; set; } = null!;

    public double? SoLuongCanDung { get; set; }

    public virtual HangHoa MaHhNavigation { get; set; } = null!;

    public virtual DboDanhMucSp MaSpNavigation { get; set; } = null!;
}
