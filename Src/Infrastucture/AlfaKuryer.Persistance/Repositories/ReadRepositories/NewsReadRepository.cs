

using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;
using AlfaKuryer.Persistance.Repositories.ReadRepositories;

namespace MessageScheduler.Data.Repositories.ReadRepositories
{
    public class NewsReadRepository : ReadRepository<News>, INewsReadRepository
    {
        public NewsReadRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}
