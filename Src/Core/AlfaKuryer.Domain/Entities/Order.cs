using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKuryer.Domain.Entities
{
	public class Order:BaseEntity
	{
        public string? CustomerId { get; set; } // Assuming this is the foreign key to ApplicationUser for customer
        public ApplicationUser? Customer { get; set; } // Navigation property to ApplicationUser for customer

        public string? CourierId { get; set; } // Assuming this is the foreign key to ApplicationUser for courier
        public ApplicationUser? Courier { get; set; }
        public string? FromFullName { get; set; }
        public string? FromPhoneNumber { get; set; }

        public string? ForeignCourierId { get; set; } // Assuming this is the foreign key to ApplicationUser for foreign courier
        public ApplicationUser? ForeignCourier { get; set; }
        public string ToPhoneNumber { get; set; }
        public string ToAdress { get; set; }
        public string FromAdress { get; set; }

        public City? OrderFromCity { get; set; }
        public District? OrderFromDistrict { get; set; }
        public City OrderToCity { get; set; }
        public District? OrderToDistrict { get; set; }
        public string ToFullname { get; set; }
        public int? OrderFromCityId { get; set; }
        public int? OrderFromDistrictId { get; set; }
        public int OrderToCityId { get; set; }
        public int? OrderToDistrictId { get; set; }
        public double Price { get; set; }
        public double Kq { get; set; }
        public int PackageCount { get; set; }
        public bool IsInCity { get; set; }
        public bool IsAccepted { get; set; }
        public bool IsCourierOnRoad { get; set; }
        public bool IsCourierArriveForTake { get; set; }
        public bool IsCourierTaked { get; set; }
        public bool IsInStorage { get; set; }
        public bool IsOutStorage { get; set; }
        public bool IsOnroadToForeignCity { get; set; }
        public bool IsForeignCourierAccepted { get; set; }
        public bool IsInForeignCity { get; set; }
        public bool IsOnRoad { get; set; }
        public bool IsCourierArrive { get; set; }
        public bool IsDelivered { get; set; }
        public bool IsCash { get; set; }
        public bool IsFast { get; set; }
        public bool IsPaid { get; set; }
        public bool OrderFromCassir { get; set; }
        public List<CourierBalance> CourierBalances { get; set; }
    }
}

