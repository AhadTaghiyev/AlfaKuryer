

using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;
using AlfaKuryer.Persistance.Repositories.ReadRepositories;

namespace MessageScheduler.Data.Repositories.ReadRepositories
{
    
    public class RateReadRepository : ReadRepository<Rate>, IRateReadRepository
    {
        public RateReadRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}
