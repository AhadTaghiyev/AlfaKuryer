using System;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;

namespace AlfaKuryer.Persistance.Repositories.ReadRepositories
{
    public class PriceReadRepository : ReadRepository<PriceForOrder>, IPriceReadRepository
    {
        public PriceReadRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}

