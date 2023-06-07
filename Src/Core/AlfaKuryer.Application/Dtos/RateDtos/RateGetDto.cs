using System;
namespace AlfaKuryer.Application.Dtos.RateDtos
{
	public record RateGetDto
	{
	    public int Id { get; set; }
        public string From { get; set; }
        public string To { get; set; }
        public string DeliveryMethod { get; set; }
        public double Price { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }
}

