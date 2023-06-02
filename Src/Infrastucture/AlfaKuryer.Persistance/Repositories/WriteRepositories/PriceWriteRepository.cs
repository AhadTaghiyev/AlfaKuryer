using System;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;
using MessageScheduler.Data.Repositories.WriteRepositories;

namespace AlfaKuryer.Persistance.Repositories.WriteRepositories
{
    public class PriceWriteRepository : WriteRepository<PriceForOrder>, IPriceWriteRepository
    {
        public PriceWriteRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}

