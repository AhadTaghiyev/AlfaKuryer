using System;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;

namespace AlfaKuryer.Persistance.Repositories.ReadRepositories
{
    public class CityReadRepository : ReadRepository<City>, ICityReadRepository
    {
        public CityReadRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}

