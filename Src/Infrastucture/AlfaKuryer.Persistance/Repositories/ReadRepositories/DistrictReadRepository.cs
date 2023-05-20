using System;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;

namespace AlfaKuryer.Persistance.Repositories.ReadRepositories
{
	

     public class DistrictReadRepository : ReadRepository<District>, IDistrictReadRepository
    {
        public DistrictReadRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}

