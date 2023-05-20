
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;

namespace MessageScheduler.Data.Repositories.WriteRepositories
{
    public class RateWriteRepository:WriteRepository<Rate>, IRateWriteRepository
    {
        public RateWriteRepository(AlfaKuryerDbContext context):base(context) { }
    }
}
