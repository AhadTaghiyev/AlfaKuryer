using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKuryer.Domain.Entities
{
	public class CourierBalance:BaseEntity
	{
	   public double CouruyerSalary { get; set; }
		public double OrderPrice { get; set; }
	   public int OrderNumber { get; set; }
	   public string ApplicationUserId { get; set; }
		public ApplicationUser ApplicationUser { get; set; }
		public bool IsCash { get; set; }
		public bool IsFast { get; set; }
    }
}

