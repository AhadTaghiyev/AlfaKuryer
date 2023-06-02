using System;
namespace AlfaKuryer.Application.Dtos.PriceDtos
{
	public class PricePostDto
	{
        public double Kq { get; set; }
        public double Price { get; set; }
        public double UntilKq { get; set; }
        public double MinPrice { get; set; }
        public bool Location { get; set; }
    }
}

