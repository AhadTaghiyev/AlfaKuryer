using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKuryer.Domain.Entities
{
	public class PriceForOrder:BaseEntity
	{
	  public double Kq { get; set; }
	  public double Price { get; set; }
	  public double UntilKq { get; set; }
	  public double MinPrice { get; set; }
	  public bool Location { get; set; }
	}
}

