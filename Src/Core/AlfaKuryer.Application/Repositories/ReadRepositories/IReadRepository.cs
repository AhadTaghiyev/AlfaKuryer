using AlfaKuryer.Application.Repositories;
using AlfaKuryer.Domain.Entities.Base;
using System.Linq.Expressions;

 namespace AlfaKuryer.Application.Repositories.ReadRepositories
{
    public interface IReadRepository<T> : IRepository<T> where T : BaseEntity, new()
    {
        public Task<IQueryable<T>> GetAllAsync(Expression<Func<T, bool>> expression,bool isTracking,bool isReslation, string[] Includes=null);
        public Task<T> GetAsync(Expression<Func<T, bool>> expression,bool IsTracking, bool isrelation, string[] Includes=null);
    }
}
