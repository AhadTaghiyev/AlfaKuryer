using System;
namespace AlfaKuryer.Application.Dtos.CustomerDtos
{
	public class CustomerGetDto
	{
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Email { get; set; }
        public DateTime BirthDate { get; set; }
        public string DocumentNumber { get; set; }
        public string Fin { get; set; }
    }
}

