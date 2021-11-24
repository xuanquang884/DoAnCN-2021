using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace WebTimKiemPhongTro.Models
{
    public partial class WebDataContext : DbContext
    {
        public WebDataContext()
            : base("name=WebDataContext")
        {
        }

        public virtual DbSet<AccountAdmin> AccountAdmin { get; set; }
        public virtual DbSet<AspNetUsers> AspNetUsers { get; set; }
        public virtual DbSet<GiaoDich> GiaoDich { get; set; }
        public virtual DbSet<Loai> Loai { get; set; }
        public virtual DbSet<TinDang> TinDang { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AspNetUsers>()
                .HasMany(e => e.GiaoDich)
                .WithOptional(e => e.AspNetUsers)
                .HasForeignKey(e => e.MaUser);

            modelBuilder.Entity<AspNetUsers>()
                .HasMany(e => e.TinDang)
                .WithRequired(e => e.AspNetUsers)
                .HasForeignKey(e => e.MaNguoiDang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Loai>()
                .HasMany(e => e.TinDang)
                .WithOptional(e => e.Loai)
                .HasForeignKey(e => e.LoaiTin);
        }
    }
}
