using System;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;
using MessageScheduler.Data.Repositories.WriteRepositories;

namespace AlfaKuryer.Persistance.Repositories.WriteRepositories
{
    public class CassirBalanceWriteRepository : WriteRepository<CassirBalance>, ICassirBalanceWriteRepository
    {
        public CassirBalanceWriteRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}

