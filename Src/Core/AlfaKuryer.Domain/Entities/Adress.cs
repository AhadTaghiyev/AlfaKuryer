using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKuryer.Domain.Entities
{
	public class Adress:BaseEntity
	{
		public string UserAdres { get; set; }
		public ApplicationUser ApplicationUser { get; set; }

    }
}

