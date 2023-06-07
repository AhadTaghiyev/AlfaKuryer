using System;
using AlfaKuryer.Domain.Entities;

namespace AlfaKuryer.Application.Dtos.OrderDtos
{
	public class OrderGetDto
	{
        public int Id { get; set; }
        public ApplicationUser Customer { get; set; }
        public ApplicationUser Courier { get; set; }
        public string ToPhoneNumber { get; set; }
        public string ToAdress { get; set; }
        public string FromAdress { get; set; }
        public City OrderFromCity { get; set; }
        public District OrderFromDistrict { get; set; }
        public City OrderToCity { get; set; }
        public District OrderToDistrict { get; set; }
        public ApplicationUser? ForeignCourier { get; set; }
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
        public string ToFullName { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool IsFast { get; set; }
        public bool IsCash { get; set; }

    }
}

