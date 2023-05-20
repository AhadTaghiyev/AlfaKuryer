
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;

namespace MessageScheduler.Data.Repositories.WriteRepositories
{
    public class HelpWriteRepository:WriteRepository<Help>, IHelpWriteRepository
    {
        public HelpWriteRepository(AlfaKuryerDbContext context):base(context) { }
    }
}
