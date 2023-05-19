

using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;
using AlfaKuryer.Persistance.Repositories.ReadRepositories;

namespace MessageScheduler.Data.Repositories.ReadRepositories
{
    public class SettingReadRepository:ReadRepository<Setting>,ISettingReadRepository
    {
        public SettingReadRepository(AlfaKuryerDbContext context):base(context) { }
    }
}
