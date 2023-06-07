using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKuryer.Domain.Entities
{
	public class Rate:BaseEntity
	{
		public string From { get; set; }
		public string To { get; set; }
		public string DeliveryMethod { get; set; }
		public double Price { get; set; }
	}
}

