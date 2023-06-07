using System;
using AlfaKuryer.Domain.Entities;

namespace AlfaKuryer.Application.Dtos.IdentityDtos
{
	public class UpdateDto
	{
		public List<string> Adress { get; set; }
        public DateTime Birthday { get; set; }
        public string? Citizen { get; set; }
        public string? DocumentNo { get; set; }
        public string? Identification { get; set; }
        public string? CompanyTin { get; set; }
    }
}

