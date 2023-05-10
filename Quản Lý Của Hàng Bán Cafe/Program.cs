using Microsoft.EntityFrameworkCore;
using Quản_Lý_Của_Hàng_Bán_Cafe.Models;
using Quản_Lý_Của_Hàng_Bán_Cafe.Repository;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
var connecttionString = builder.Configuration.GetConnectionString("Btlweb02Context");
builder.Services.AddDbContext<Btlweb02Context>(x => x.UseSqlServer(connecttionString));

builder.Services.AddScoped<ILoaiSPRepository, LoaiSPRepository>();
builder.Services.AddSession();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();
app.UseSession();

app.MapControllerRoute(
    name: "default",
     //pattern: "{controller=Home}/{action=Index}/{id?}");
     pattern: "{controller=Home}/{action=TrangChu}/{id?}");

app.Run();
