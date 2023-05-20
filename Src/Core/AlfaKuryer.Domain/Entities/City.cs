using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKuryer.Domain.Entities
{
	public class City:BaseEntity
	{
	   public string Name { get; set; }
		public List<District> Districts { get; set; }
	}
}

