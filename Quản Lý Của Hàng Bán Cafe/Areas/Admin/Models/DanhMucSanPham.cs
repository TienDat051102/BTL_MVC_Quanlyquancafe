namespace Quản_Lý_Của_Hàng_Bán_Cafe.Areas.Admin.Models
{
    public class DanhMucSanPhamVM
    {
       
        public int? MaLoai { get; set; }

        public string? AnhDaiDien { get; set; }

        public string? TenSp { get; set; }

        public decimal? GiaBanCaoNhat { get; set; }

        public string? GioiThieuSp { get; set; }

        public decimal? GiaBanNhoNhat { get; set; }

    }
    public class DanhMucSanPham : DanhMucSanPhamVM
    {
        public int MaSp { get; set; }
    }
    public class DanhMucSanPhamModel
    {
        public int MaSp { get; set; }
        public string? TenLoai { get; set; }

        //public string? AnhDaiDien { get; set; }

        public string? TenSp { get; set; }

        public decimal? GiaBanNhoNhat { get; set; }
    }
}
