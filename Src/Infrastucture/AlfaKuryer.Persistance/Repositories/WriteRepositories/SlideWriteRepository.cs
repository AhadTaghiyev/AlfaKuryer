using System;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;
using MessageScheduler.Data.Repositories.WriteRepositories;

namespace AlfaKuryer.Persistance.Repositories.WriteRepositories
{
    public class SlideWriteRepository : WriteRepository<Slide>, ISlideWriteRepository
    {
        public SlideWriteRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}

