using System;
namespace AlfaKuryer.Application.Dtos.DistrictDtos
{
	public record DistrictGetDto
	{
		public int Id { get; set; }
		public string Name { get; set; }
		public int CityId { get; set; }
	}
}

