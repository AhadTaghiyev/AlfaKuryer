using AlfaKuryer.Domain.Entities.Base;
using System.Linq.Expressions;

namespace AlfaKuryer.Application.Repositories.WriteRepositories
{ 
    public interface IWriteRepository<T>:IRepository<T> where T : BaseEntity,new()
    {
        public Task AddAsync(T entity);
        public Task UpdateAsync(T entity);
        public Task<int> SaveAsync();
        public int Save();
    }
}
