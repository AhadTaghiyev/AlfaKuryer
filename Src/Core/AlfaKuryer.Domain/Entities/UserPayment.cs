using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKuryer.Domain.Entities
{
	public class UserPayment:BaseEntity
	{

        public string CustomerId { get; set; }
        public int OrderNumber { get; set; }
        public string StatusId { get; set; }
        public double TotalPrice { get; set; }
        public DateTime DateTime { get; set; }
        public bool IsPay { get; set; }
    }
}

