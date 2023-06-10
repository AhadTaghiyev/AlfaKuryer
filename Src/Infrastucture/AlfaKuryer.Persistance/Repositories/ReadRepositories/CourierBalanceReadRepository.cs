using System;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;

namespace AlfaKuryer.Persistance.Repositories.ReadRepositories
{
    public class CourierBalanceReadRepository : ReadRepository<CourierBalance>, ICourierBalanceReadRepository
    {
        public CourierBalanceReadRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}

