using AlfaKuryer.Application.Repositories;
using AlfaKuryer.Domain.Entities.Base;
using System.Linq.Expressions;

 namespace AlfaKuryer.Application.Repositories.ReadRepositories
{
    public interface IReadRepository<T> : IRepository<T> where T : BaseEntity, new()
    {
        public Task<IQueryable<T>> GetAllAsync(Expression<Func<T, bool>> expression,bool isTracking,bool isReslation, params string[] Includes);
        public Task<T> GetAsync(Expression<Func<T, bool>> expression,bool IsTracking, bool isrelation, params string[] Includes);
        public IQueryable<T> GetQuery(Expression<Func<T, bool>> expression,bool IsTracking, bool isrelation, params string[] Includes);

    }
}
