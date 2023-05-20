using System;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;

namespace AlfaKuryer.Persistance.Repositories.ReadRepositories
{
    public class SlideReadRepository : ReadRepository<Slide>, ISlideReadRepository
    {
        public SlideReadRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}

