using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKuryer.Domain.Entities
{
	public class ApplicationUserDistrict : BaseEntity
	{
		public string ApplicationUserId { get; set; }
		public ApplicationUser ApplicationUser { get; set; }
		public int DistrictId { get; set; }
		public District District { get; set; }
    }
}

