using System;
namespace AlfaKuryer.Application.Dtos.IdentityDtos
{
	public class RegisterDto
	{
		public string? Name { get; set; }
		public string? Surname { get; set; }
		public string? Email { get; set; }

		public string Password { get; set; }
		public string VerifyPassword { get; set; }
		public bool? IsCompany { get; set; }
		public string? Role { get; set; }
		public bool IsAgree { get; set; }
		public string? PhoneCode { get; set;}
		public string? PhoneNumber{get;set;}
		public int? CityId { get; set; }
		public List<int>? Ids { get; set; }
		public string? Method { get; set; }
		public double? CourierSimpleSalary { get; set; }
        public double? CourierFastleSalary { get; set; }



    }
}

