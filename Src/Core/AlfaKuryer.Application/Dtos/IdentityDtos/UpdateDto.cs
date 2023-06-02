using System;
using AlfaKuryer.Domain.Entities;

namespace AlfaKuryer.Application.Dtos.IdentityDtos
{
	public class UpdateDto
	{
		public string Id { get; set; }
		public string Name { get; set; }
		public string Surname { get; set; }
		public string Email { get; set; }
		public string PhoneNumber { get; set; }
		public string Adress { get; set; }
        public DateTime Birthday { get; set; }
        public bool? Citizen { get; set; }
        public string? DocumentNo { get; set; }
        public string? Identification { get; set; }
        public int? CityId { get; set; }
        public int? DistrictId { get; set; }
        public string? CompanyTin { get; set; }
        public string Role { get; set; }
        public string Password { get; set; }
    }
}

