using System;
namespace AlfaKuryer.Application.Dtos.CustomerDtos
{
	public class CustomerPostDto
	{
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Email { get; set; }
        public DateTime BirthDate { get; set; }
        public string DocumentNumber { get; set; }
        public string Citizen { get; set; }
        public string Fin { get; set; }
        public string Password { get; set; }
        public string PasswordVerify { get; set; }
        public string Phonenumber { get; set; }

    }
}

