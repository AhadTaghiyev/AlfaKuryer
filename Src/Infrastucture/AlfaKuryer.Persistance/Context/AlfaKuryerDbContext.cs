

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
        public DbSet<District> Districts{get;}
        public DbSet<Rate> Rates { get; }
        public DbSet<Slide> Slides { get; }
        public DbSet<News> News { get;}
        public DbSet<NewsLanguage> NewsLanguages { get; }
        public DbSet<Message> Messages { get; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<ApplicationUser>()
           .HasDiscriminator<string>("UserType")
           .HasValue<Admin>(nameof(Admin))
           .HasValue<Customer>(nameof(Customer))
           .HasValue<Company>(nameof(Company))
           .HasValue<Courier>(nameof(Courier));
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
