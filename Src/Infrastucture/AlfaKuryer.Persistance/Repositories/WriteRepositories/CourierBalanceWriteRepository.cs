using System;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;
using MessageScheduler.Data.Repositories.WriteRepositories;

namespace AlfaKuryer.Persistance.Repositories.WriteRepositories
{
    public class CourierBalanceWriteRepository : WriteRepository<CourierBalance>, ICourierBalanceWriteRepository
    {
        public CourierBalanceWriteRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}

