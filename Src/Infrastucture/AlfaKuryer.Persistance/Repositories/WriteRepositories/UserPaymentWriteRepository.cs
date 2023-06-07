using System;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;
using MessageScheduler.Data.Repositories.WriteRepositories;

namespace AlfaKuryer.Persistance.Repositories.WriteRepositories
{
    public class UserPaymentWriteRepository : WriteRepository<UserPayment>, IUserPaymentWriteRepository
    {
        public UserPaymentWriteRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}

