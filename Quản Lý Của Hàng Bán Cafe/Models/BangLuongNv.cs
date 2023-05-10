using System;
using System.Collections.Generic;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class BangLuongNv
{
    public int MaNv { get; set; }

    public int Maclv { get; set; }

    public DateTime NgayLam { get; set; }

    public virtual NhanVien MaNvNavigation { get; set; } = null!;

    public virtual CaLamViec MaclvNavigation { get; set; } = null!;
}
