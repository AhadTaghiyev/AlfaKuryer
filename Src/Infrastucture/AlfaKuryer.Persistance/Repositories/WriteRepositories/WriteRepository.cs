
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Domain.Entities.Base;
using AlfaKuryer.Persistance.Context;
using Microsoft.EntityFrameworkCore;

namespace MessageScheduler.Data.Repositories.WriteRepositories
{
    public class WriteRepository<T> : IWriteRepository<T> where T : BaseEntity, new()
    {
        private readonly AlfaKuryerDbContext _context;
        public WriteRepository(AlfaKuryerDbContext context) => _context = context;

        public DbSet<T> Table => _context.Set<T>();

        public async Task AddAsync(T entity)
        {
            await _context.AddAsync(entity);
        }

        public int Save()
        {
           return  _context.SaveChanges();
        }

        public async Task<int> SaveAsync()
        {
          return await _context.SaveChangesAsync();
        }

        public async Task UpdateAsync(T entity)
        {
            _context.Update(entity);
        }
    }
}
