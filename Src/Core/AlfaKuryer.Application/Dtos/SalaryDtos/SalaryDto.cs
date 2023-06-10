using System;
using AlfaKuryer.Domain.Entities;

namespace AlfaKuryer.Application.Dtos.SalaryDtos
{
	public class SalaryDto
	{
		public int Id { get; set; }
        public double CouruyerSalary { get; set; }
        public double OrderPrice { get; set; }
        public int OrderNumber { get; set; }
        public string ApplicationUserId { get; set; }
        public ApplicationUser ApplicationUser { get; set; }
        public bool IsCash { get; set; }
        public bool IsFast { get; set; }
        public DateTime PriceDate { get; set; }
    }
}

