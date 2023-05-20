using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKuryer.Domain.Entities
{
	public class District:BaseEntity
	{
		public string Name { get; set; }
		public int CityId { get; set; }
		public City City { get; set; }
	}
}

