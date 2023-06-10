using System;
using AlfaKuryer.Application.Dtos.IdentityDtos;
using AlfaKuryer.Domain.Entities;

namespace AlfaKuryer.Application.Dtos.CassirDtos
{
	public class CassirBalanceGetDto
	{
		public int Id { get; set; }
		public int OdrerNumber { get; set; }
        public ApplicationUser ApplicationUser { get; set; }
        public string ApplicationUserId { get; set; }
        public bool IsCash { get; set; }
        public bool IsFast { get; set; }
        public double OrderPrice { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}

