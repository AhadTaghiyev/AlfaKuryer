

using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Domain.Entities.Base;
using Microsoft.EntityFrameworkCore;

namespace AlfaKuryer.Persistance.Context
{
    public class AlfaKuryerDbContext:DbContext
    {
        public AlfaKuryerDbContext(DbContextOptions options):base(options) { }
       
        public DbSet<Setting> Settings { get;}

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
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
