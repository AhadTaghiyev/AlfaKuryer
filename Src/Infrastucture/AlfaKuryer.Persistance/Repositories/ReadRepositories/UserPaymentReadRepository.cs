﻿using System;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;

namespace AlfaKuryer.Persistance.Repositories.ReadRepositories
{
    public class UserPaymentReadRepository : ReadRepository<UserPayment>, IUserPaymentReadRepository
    {
        public UserPaymentReadRepository(AlfaKuryerDbContext context) : base(context) { }
    }
}

