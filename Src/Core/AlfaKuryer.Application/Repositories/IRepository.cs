using AlfaKuryer.Domain.Entities.Base;
using Microsoft.EntityFrameworkCore;

namespace AlfaKuryer.Application.Repositories
{
    public interface IRepository<T> where T : BaseEntity, new()
    {
        DbSet<T> Table { get; }
    }
}
