

using System.Reflection.Emit;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Domain.Entities.Base;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace AlfaKuryer.Persistance.Context
{
    public class AlfaKuryerDbContext : IdentityDbContext<ApplicationUser>
    {
        public AlfaKuryerDbContext(DbContextOptions<AlfaKuryerDbContext> options) : base(options) { }

        public DbSet<Setting> Settings { get; }
        public DbSet<Help> Helps { get; }
        public DbSet<HelpLanguage> HelpLanguages { get; }
        public DbSet<City> Cities { get; }
        public DbSet<District> Districts { get; }
        public DbSet<Rate> Rates { get; }
        public DbSet<Slide> Slides { get; }
        public DbSet<News> News { get; }
        public DbSet<NewsLanguage> NewsLanguages { get; }
        public DbSet<Message> Messages { get; }
        public DbSet<ApplicationUserDistrict> ApplicationUserDistricts { get; }
        public DbSet<Order> Orders { get; }
        public DbSet<PriceForOrder> PriceForOrders{get;}

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<Order>()
         .HasOne(o => o.OrderFromCity)
         .WithMany()
         .HasForeignKey(o => o.OrderFromCityId);

            builder.Entity<Order>()
                .HasOne(o => o.OrderFromDistrict)
                .WithMany()
                .HasForeignKey(o => o.OrderFromDistrictId);

            builder.Entity<Order>()
                .HasOne(o => o.OrderToCity)
                .WithMany()
                .HasForeignKey(o => o.OrderToCityId);

            builder.Entity<Order>()
                .HasOne(o => o.OrderToDistrict)
                .WithMany()
                .HasForeignKey(o => o.OrderToDistrictId);
            builder.Entity<Order>()
       .HasOne(o => o.Customer)
       .WithMany()
       .HasForeignKey(o => o.CustomerId);

            builder.Entity<Order>()
                .HasOne(o => o.Courier)
                .WithMany()
                .HasForeignKey(o => o.CourierId);
            base.OnModelCreating(builder);

            builder.Entity<Order>()
        .HasOne(o => o.ForeignCourier)
        .WithMany()
        .HasForeignKey(o => o.ForeignCourierId);
        }


        public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
        {
            foreach (var entry in ChangeTracker.Entries<BaseEntity>())
            {
                switch (entry.State)
                {
                    case EntityState.Added:
                        entry.Entity.CreatedAt = DateTime.UtcNow.AddHours(4);
                        break;
                    case EntityState.Modified:
                        entry.Entity.UpdatedAt = DateTime.UtcNow.AddHours(4);
                        break;
                }
            }
            return base.SaveChangesAsync(cancellationToken);
        }
    }
}
