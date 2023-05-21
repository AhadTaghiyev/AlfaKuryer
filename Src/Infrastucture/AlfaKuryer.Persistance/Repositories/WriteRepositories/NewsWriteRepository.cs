
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;

namespace MessageScheduler.Data.Repositories.WriteRepositories
{
    public class NewsWriteRepository:WriteRepository<News>, INewsWriteRepository
    {
        public NewsWriteRepository(AlfaKuryerDbContext context):base(context) { }
    }
}
