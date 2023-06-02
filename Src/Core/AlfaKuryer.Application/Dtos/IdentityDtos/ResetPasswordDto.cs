using System;
namespace AlfaKuryer.Application.Dtos.IdentityDtos
{
	public class ResetPasswordDto
	{
		public string Email { get; set; }
		public string Token { get; set; }
		public string Password { get; set; }
		public string VerifyPassword { get; set; }
	}
}

