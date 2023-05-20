using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Domain.Entities.Base;
using AlfaKuryer.Persistance.Context;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace AlfaKuryer.Persistance.Repositories.ReadRepositories
{
    public class ReadRepository<T> : IReadRepository<T> where T : BaseEntity, new()
    {
        private readonly AlfaKuryerDbContext _context;
        public ReadRepository(AlfaKuryerDbContext context) => _context = context;
        public DbSet<T> Table => _context.Set<T>();

        public async Task<T> GetAsync(Expression<Func<T, bool>> expression, bool IsTracking, bool isrelation, params string[] Includes)
        {
            IQueryable<T> query = Table.Where(expression);

            if (!isrelation)
            {
                if (IsTracking)
                    query = query.AsNoTrackingWithIdentityResolution();
            }
            else
            {
                if (IsTracking)
                    query = query.AsNoTracking();
            }


            if (Includes != null)
            {
                foreach (string include in Includes)
                {
                    query = query.Include(include);
                }
            }

            return await query.FirstOrDefaultAsync();
        }

        public async Task<IQueryable<T>> GetAllAsync(Expression<Func<T, bool>> expression,bool isTracking, bool isRelation, string[] Includes)
        {
            IQueryable<T> query = Table.Where(expression);

            if (!isRelation)
            {
                if (isTracking)
                    query = query.AsNoTrackingWithIdentityResolution();
            }
            else
            {
                if (isTracking)
                    query = query.AsNoTracking();
            }

            if (Includes != null)
            {
                foreach (string include in Includes)
                {
                    query = query.Include(include);
                }
            }
            return query;
        }

        public IQueryable<T> GetQuery(Expression<Func<T, bool>> expression, bool IsTracking, bool isrelation, params string[] Includes)
        {
            IQueryable<T> query = Table.Where(expression);

            if (!isrelation)
            {
                if (IsTracking)
                    query = query.AsNoTrackingWithIdentityResolution();
            }
            else
            {
                if (IsTracking)
                    query = query.AsNoTracking();
            }


            if (Includes != null)
            {
                foreach (string include in Includes)
                {
                    query = query.Include(include);
                }
            }

            return  query;
        }
    }
}
