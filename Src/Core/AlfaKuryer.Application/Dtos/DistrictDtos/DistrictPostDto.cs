using System;
namespace AlfaKuryer.Application.Dtos.DistrictDtos
{
	public record DistrictPostDto
	{
		public string Name { get; set; }
		public int CityId { get; set; }
	}
}

