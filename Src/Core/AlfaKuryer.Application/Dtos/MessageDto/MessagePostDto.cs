using System;
namespace AlfaKuryer.Application.Dtos.MessageDto
{
	public record MessagePostDto
	{
        public string FullName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Subject { get; set; }
        public string Content { get; set; }
    }
}

