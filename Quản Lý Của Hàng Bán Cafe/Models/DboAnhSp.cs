using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class DboAnhSp
{
    public int MaSp { get; set; }

    public string TenFileAnh { get; set; } = null!;

    public string? ViTri { get; set; }

    public virtual DboDanhMucSp MaSpNavigation { get; set; } = null!;
}
