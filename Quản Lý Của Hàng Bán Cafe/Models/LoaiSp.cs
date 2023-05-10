using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class LoaiSp
{
    public int MaLoai { get; set; }

    public string? TenLoai { get; set; }

    public virtual ICollection<DboDanhMucSp> DboDanhMucSps { get; set; } = new List<DboDanhMucSp>();
}
