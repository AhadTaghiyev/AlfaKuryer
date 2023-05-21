using System;
namespace AlfaKuryer.Domain.Entities
{
	public class Courier: ApplicationUser
    {
	  public string Surname { get; set; }
	  public int? DistrictId { get; set; }
		public District District { get; set; }
		public City City { get; set; }
		public int? CityId { get; set; }
	}
}

