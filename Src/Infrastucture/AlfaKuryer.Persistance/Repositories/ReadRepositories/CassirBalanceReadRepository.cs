using System;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;

namespace AlfaKuryer.Persistance.Repositories.ReadRepositories
{
    public class CassirBalanceReadRepository : ReadRepository<CassirBalance>, ICassirBalanceReadRepository
    {
        public CassirBalanceReadRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}

