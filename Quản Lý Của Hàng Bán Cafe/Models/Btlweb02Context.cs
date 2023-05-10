using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Quản_Lý_Của_Hàng_Bán_Cafe.Models;

public partial class Btlweb02Context : DbContext
{
    public Btlweb02Context()
    {
    }

    public Btlweb02Context(DbContextOptions<Btlweb02Context> options)
        : base(options)
    {
    }

    public virtual DbSet<Ban> Bans { get; set; }

    public virtual DbSet<BangLuongNv> BangLuongNvs { get; set; }

    public virtual DbSet<CaLamViec> CaLamViecs { get; set; }

    public virtual DbSet<ChiTietHoaDon> ChiTietHoaDons { get; set; }

    public virtual DbSet<ChiTietHoaDonNhap> ChiTietHoaDonNhaps { get; set; }

    public virtual DbSet<ChiTietSanPham> ChiTietSanPhams { get; set; }

    public virtual DbSet<CongThucMon> CongThucMons { get; set; }

    public virtual DbSet<DboAnhChiTietSp> DboAnhChiTietSps { get; set; }

    public virtual DbSet<DboAnhSp> DboAnhSps { get; set; }

    public virtual DbSet<DboDanhMucSp> DboDanhMucSps { get; set; }

    public virtual DbSet<HangHoa> HangHoas { get; set; }

    public virtual DbSet<HoaDonBan> HoaDonBans { get; set; }

    public virtual DbSet<HoaDonNhap> HoaDonNhaps { get; set; }

    public virtual DbSet<KhachHang> KhachHangs { get; set; }

    public virtual DbSet<LoaiSp> LoaiSps { get; set; }

    public virtual DbSet<NhaCungCap> NhaCungCaps { get; set; }

    public virtual DbSet<NhanVien> NhanViens { get; set; }

    public virtual DbSet<Size> Sizes { get; set; }

    public virtual DbSet<ThemDo> ThemDos { get; set; }

    public virtual DbSet<ThemDum> ThemDa { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=DESKTOP-0Q5NETM\\SQLEXPRESS;Initial Catalog=BTLWEB02;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Ban>(entity =>
        {
            entity.HasKey(e => e.MaBan);

            entity.ToTable("Ban");

            entity.Property(e => e.ThuocTinh)
                .HasMaxLength(20)
                .IsFixedLength();
        });

        modelBuilder.Entity<BangLuongNv>(entity =>
        {
            entity.HasKey(e => new { e.MaNv, e.Maclv, e.NgayLam });

            entity.ToTable("BangLuongNV");

            entity.Property(e => e.MaNv).HasColumnName("MaNV");
            entity.Property(e => e.Maclv).HasColumnName("MACLV");
            entity.Property(e => e.NgayLam).HasColumnType("datetime");

            entity.HasOne(d => d.MaNvNavigation).WithMany(p => p.BangLuongNvs)
                .HasForeignKey(d => d.MaNv)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BangLuongNV_NhanVien");

            entity.HasOne(d => d.MaclvNavigation).WithMany(p => p.BangLuongNvs)
                .HasForeignKey(d => d.Maclv)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BangLuongNV_CaLamViec");
        });

        modelBuilder.Entity<CaLamViec>(entity =>
        {
            entity.HasKey(e => e.MaClv).HasName("PK_dbo.CaLamViec");

            entity.ToTable("CaLamViec");

            entity.Property(e => e.MaClv)
                .ValueGeneratedNever()
                .HasColumnName("MaCLV");
            entity.Property(e => e.SoGioLv).HasColumnName("SoGioLV");
            entity.Property(e => e.TenClv)
                .HasMaxLength(10)
                .IsFixedLength()
                .HasColumnName("TenCLV");
            entity.Property(e => e.TienLuongTheoCa).HasColumnType("money");
        });

        modelBuilder.Entity<ChiTietHoaDon>(entity =>
        {
            entity.HasKey(e => new { e.MaHoaDon, e.MaChiTietSp });

            entity.ToTable("ChiTietHoaDon");

            entity.Property(e => e.MaChiTietSp).HasColumnName("MaChiTietSP");
            entity.Property(e => e.DonGiaBan).HasColumnType("money");
            entity.Property(e => e.TongTienHd)
                .HasColumnType("money")
                .HasColumnName("TongTienHD");

            entity.HasOne(d => d.MaChiTietSpNavigation).WithMany(p => p.ChiTietHoaDons)
                .HasForeignKey(d => d.MaChiTietSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChiTietHoaDon_ChiTietSanPham");

            entity.HasOne(d => d.MaHoaDonNavigation).WithMany(p => p.ChiTietHoaDons)
                .HasForeignKey(d => d.MaHoaDon)
                .HasConstraintName("FK_ChiTietHoaDon_HoaDonBan");
        });

        modelBuilder.Entity<ChiTietHoaDonNhap>(entity =>
        {
            entity.HasKey(e => new { e.MaHoaDonNhap, e.MaHh });

            entity.ToTable("ChiTietHoaDonNhap");

            entity.Property(e => e.MaHh)
                .HasMaxLength(20)
                .IsFixedLength()
                .HasColumnName("MaHH");
            entity.Property(e => e.DonGiaNhap).HasColumnType("money");
            entity.Property(e => e.TongTien).HasColumnType("money");

            entity.HasOne(d => d.MaHhNavigation).WithMany(p => p.ChiTietHoaDonNhaps)
                .HasForeignKey(d => d.MaHh)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChiTietHoaDonNhap_HangHoa");

            entity.HasOne(d => d.MaHoaDonNhapNavigation).WithMany(p => p.ChiTietHoaDonNhaps)
                .HasForeignKey(d => d.MaHoaDonNhap)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChiTietHoaDonNhap_HoaDonNhap");
        });

        modelBuilder.Entity<ChiTietSanPham>(entity =>
        {
            entity.HasKey(e => e.MaChiTietSp);

            entity.ToTable("ChiTietSanPham");

            entity.Property(e => e.MaChiTietSp).HasColumnName("MaChiTietSP");
            entity.Property(e => e.DonGiaBan).HasColumnType("money");
            entity.Property(e => e.HinhAnh)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.MaLuongDa)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.MaSize)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.MaSp).HasColumnName("MaSP");
            entity.Property(e => e.MaTopPing)
                .HasMaxLength(10)
                .IsFixedLength();

            entity.HasOne(d => d.MaLuongDaNavigation).WithMany(p => p.ChiTietSanPhams)
                .HasForeignKey(d => d.MaLuongDa)
                .HasConstraintName("FK_ChiTietSanPham_ThemDa");

            entity.HasOne(d => d.MaSizeNavigation).WithMany(p => p.ChiTietSanPhams)
                .HasForeignKey(d => d.MaSize)
                .HasConstraintName("FK_ChiTietSanPham_Size");

            entity.HasOne(d => d.MaSpNavigation).WithMany(p => p.ChiTietSanPhams)
                .HasForeignKey(d => d.MaSp)
                .HasConstraintName("FK_ChiTietSanPham_dbo.DanhMucSp");

            entity.HasOne(d => d.MaTopPingNavigation).WithMany(p => p.ChiTietSanPhams)
                .HasForeignKey(d => d.MaTopPing)
                .HasConstraintName("FK_ChiTietSanPham_ThemDo");
        });

        modelBuilder.Entity<CongThucMon>(entity =>
        {
            entity.HasKey(e => new { e.MaSp, e.MaHh });

            entity.ToTable("CongThucMon");

            entity.Property(e => e.MaSp).HasColumnName("MaSP");
            entity.Property(e => e.MaHh)
                .HasMaxLength(20)
                .IsFixedLength()
                .HasColumnName("MaHH");

            entity.HasOne(d => d.MaHhNavigation).WithMany(p => p.CongThucMons)
                .HasForeignKey(d => d.MaHh)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_CongThucMon_HangHoa");

            entity.HasOne(d => d.MaSpNavigation).WithMany(p => p.CongThucMons)
                .HasForeignKey(d => d.MaSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_CongThucMon_dbo.DanhMucSp");
        });

        modelBuilder.Entity<DboAnhChiTietSp>(entity =>
        {
            entity.HasKey(e => new { e.MaChiTietSp, e.TenFileAnh });

            entity.ToTable("dbo.AnhChiTietSp");

            entity.Property(e => e.MaChiTietSp).HasColumnName("MaChiTietSP");
            entity.Property(e => e.TenFileAnh)
                .HasMaxLength(50)
                .IsFixedLength();

            entity.HasOne(d => d.MaChiTietSpNavigation).WithMany(p => p.DboAnhChiTietSps)
                .HasForeignKey(d => d.MaChiTietSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_dbo.AnhChiTietSp_ChiTietSanPham");
        });

        modelBuilder.Entity<DboAnhSp>(entity =>
        {
            entity.HasKey(e => new { e.MaSp, e.TenFileAnh });

            entity.ToTable("dbo.AnhSp");

            entity.Property(e => e.MaSp).HasColumnName("MaSP");
            entity.Property(e => e.TenFileAnh)
                .HasMaxLength(50)
                .IsFixedLength();
            entity.Property(e => e.ViTri)
                .HasMaxLength(10)
                .IsFixedLength();

            entity.HasOne(d => d.MaSpNavigation).WithMany(p => p.DboAnhSps)
                .HasForeignKey(d => d.MaSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_dbo.AnhSp_dbo.DanhMucSp");
        });

        modelBuilder.Entity<DboDanhMucSp>(entity =>
        {
            entity.HasKey(e => e.MaSp);

            entity.ToTable("dbo.DanhMucSp");

            entity.Property(e => e.MaSp)
                .ValueGeneratedNever()
                .HasColumnName("MaSP");
            entity.Property(e => e.AnhDaiDien)
                .HasMaxLength(50)
                .IsFixedLength();
            entity.Property(e => e.GiaBanCaoNhat).HasColumnType("money");
            entity.Property(e => e.GiaBanNhoNhat).HasColumnType("money");
            entity.Property(e => e.GioiThieuSp)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("GioiThieuSP");
            entity.Property(e => e.TenSp)
                .HasMaxLength(30)
                .IsFixedLength()
                .HasColumnName("TenSP");

            entity.HasOne(d => d.MaLoaiNavigation).WithMany(p => p.DboDanhMucSps)
                .HasForeignKey(d => d.MaLoai)
                .HasConstraintName("FK_dbo.DanhMucSp_LoaiSP");
        });

        modelBuilder.Entity<HangHoa>(entity =>
        {
            entity.HasKey(e => e.MaHh);

            entity.ToTable("HangHoa");

            entity.Property(e => e.MaHh)
                .HasMaxLength(20)
                .IsFixedLength()
                .HasColumnName("MaHH");
            entity.Property(e => e.TenHh)
                .HasMaxLength(30)
                .IsFixedLength()
                .HasColumnName("TenHH");
        });

        modelBuilder.Entity<HoaDonBan>(entity =>
        {
            entity.HasKey(e => e.MaHoaDon);

            entity.ToTable("HoaDonBan");

            entity.Property(e => e.MaKh).HasColumnName("MaKH");
            entity.Property(e => e.MaNv).HasColumnName("MaNV");
            entity.Property(e => e.NgayLap).HasColumnType("datetime");
            entity.Property(e => e.PhuongThucTt)
                .HasMaxLength(10)
                .IsFixedLength()
                .HasColumnName("PhuongThucTT");

            entity.HasOne(d => d.MaBanNavigation).WithMany(p => p.HoaDonBans)
                .HasForeignKey(d => d.MaBan)
                .HasConstraintName("FK_HoaDonBan_Ban");

            entity.HasOne(d => d.MaKhNavigation).WithMany(p => p.HoaDonBans)
                .HasForeignKey(d => d.MaKh)
                .HasConstraintName("FK_HoaDonBan_KhachHang");

            entity.HasOne(d => d.MaNvNavigation).WithMany(p => p.HoaDonBans)
                .HasForeignKey(d => d.MaNv)
                .HasConstraintName("FK_HoaDonBan_NhanVien");
        });

        modelBuilder.Entity<HoaDonNhap>(entity =>
        {
            entity.HasKey(e => e.MaHoaDonNhap);

            entity.ToTable("HoaDonNhap");

            entity.Property(e => e.MaNcc)
                .HasMaxLength(20)
                .IsFixedLength()
                .HasColumnName("MaNCC");
            entity.Property(e => e.MaNv).HasColumnName("MaNV");
            entity.Property(e => e.NgayNhapHang).HasColumnType("datetime");

            entity.HasOne(d => d.MaNccNavigation).WithMany(p => p.HoaDonNhaps)
                .HasForeignKey(d => d.MaNcc)
                .HasConstraintName("FK_HoaDonNhap_NhaCungCap");
        });

        modelBuilder.Entity<KhachHang>(entity =>
        {
            entity.HasKey(e => e.MaKh);

            entity.ToTable("KhachHang");

            entity.Property(e => e.MaKh).HasColumnName("MaKH");
            entity.Property(e => e.DiaChi)
                .HasMaxLength(30)
                .IsFixedLength();
            entity.Property(e => e.DiemTl).HasColumnName("DiemTL");
            entity.Property(e => e.NgaySinh).HasColumnType("datetime");
            entity.Property(e => e.Sdt)
                .HasMaxLength(10)
                .IsFixedLength()
                .HasColumnName("SDT");
            entity.Property(e => e.TenKh)
                .HasMaxLength(30)
                .IsFixedLength()
                .HasColumnName("TenKH");
            entity.Property(e => e.UserName)
                .HasMaxLength(10)
                .IsFixedLength();

            entity.HasOne(d => d.UserNameNavigation).WithMany(p => p.KhachHangs)
                .HasForeignKey(d => d.UserName)
                .HasConstraintName("FK_KhachHang_User");
        });

        modelBuilder.Entity<LoaiSp>(entity =>
        {
            entity.HasKey(e => e.MaLoai);

            entity.ToTable("LoaiSP");

            entity.Property(e => e.MaLoai).ValueGeneratedNever();
            entity.Property(e => e.TenLoai)
                .HasMaxLength(10)
                .IsFixedLength();
        });

        modelBuilder.Entity<NhaCungCap>(entity =>
        {
            entity.HasKey(e => e.MaNcc);

            entity.ToTable("NhaCungCap");

            entity.Property(e => e.MaNcc)
                .HasMaxLength(20)
                .IsFixedLength()
                .HasColumnName("MaNCC");
            entity.Property(e => e.DiaChi)
                .HasMaxLength(50)
                .IsFixedLength();
            entity.Property(e => e.GhiChu)
                .HasMaxLength(500)
                .IsFixedLength();
            entity.Property(e => e.TenNcc)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("TenNCC");
        });

        modelBuilder.Entity<NhanVien>(entity =>
        {
            entity.HasKey(e => e.MaNv);

            entity.ToTable("NhanVien");

            entity.Property(e => e.MaNv).HasColumnName("MaNV");
            entity.Property(e => e.AnhDaiDien)
                .HasMaxLength(20)
                .IsFixedLength();
            entity.Property(e => e.ChucVu)
                .HasMaxLength(20)
                .IsFixedLength();
            entity.Property(e => e.DiaChi)
                .HasMaxLength(30)
                .IsFixedLength();
            entity.Property(e => e.NgaySinh).HasColumnType("datetime");
            entity.Property(e => e.Sdt)
                .HasMaxLength(10)
                .IsFixedLength()
                .HasColumnName("SDT");
            entity.Property(e => e.TenNhanVien)
                .HasMaxLength(30)
                .IsFixedLength();
            entity.Property(e => e.Username)
                .HasMaxLength(10)
                .IsFixedLength();

            entity.HasOne(d => d.UsernameNavigation).WithMany(p => p.NhanViens)
                .HasForeignKey(d => d.Username)
                .HasConstraintName("FK_NhanVien_User");
        });

        modelBuilder.Entity<Size>(entity =>
        {
            entity.HasKey(e => e.MaSize);

            entity.ToTable("Size");

            entity.Property(e => e.MaSize)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.Giá).HasColumnType("money");
            entity.Property(e => e.LoaiSize)
                .HasMaxLength(10)
                .IsFixedLength();
        });

        modelBuilder.Entity<ThemDo>(entity =>
        {
            entity.HasKey(e => e.MaTopPing);

            entity.ToTable("ThemDo");

            entity.Property(e => e.MaTopPing)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.TenLoaiTopPing)
                .HasMaxLength(30)
                .IsFixedLength();
        });

        modelBuilder.Entity<ThemDum>(entity =>
        {
            entity.HasKey(e => e.MaLuongDa);

            entity.Property(e => e.MaLuongDa)
                .HasMaxLength(10)
                .IsFixedLength();
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UsernName);

            entity.ToTable("User");

            entity.Property(e => e.UsernName)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.LoaiUser)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.Password)
                .HasMaxLength(10)
                .IsFixedLength();
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
