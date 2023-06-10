using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKuryer.Domain.Entities
{
	public class CassirBalance:BaseEntity
	{
       public int OrderNumber { get; set; }
        public ApplicationUser ApplicationUser { get; set; }
        public string ApplicationUserId { get; set; }
        public bool IsCash { get; set; }
        public bool IsFast { get; set; }
        public double OrderPrice { get; set; }
    }
}

