
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;

namespace MessageScheduler.Data.Repositories.WriteRepositories
{
    public class SettingWriteRepository:WriteRepository<Setting>, ISettingWriteRepository
    {
        public SettingWriteRepository(AlfaKuryerDbContext context):base(context) { }
    }
}
