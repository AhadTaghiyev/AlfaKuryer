using System;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;

namespace AlfaKuryer.Persistance.Repositories.ReadRepositories
{
    public class AdressReadRepository : ReadRepository<Adress>, IAdressReadRepository
    {
        public AdressReadRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}

