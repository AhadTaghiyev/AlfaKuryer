using System;
namespace AlfaKuryer.Application.Dtos.RateDtos
{
	public record RatePostDto
	{
		public string From { get; set; }
		public string To { get; set; }
		public double Price { get; set; }
	}
}

