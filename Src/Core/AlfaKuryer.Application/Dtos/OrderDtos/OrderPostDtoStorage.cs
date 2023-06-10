using System;
namespace AlfaKuryer.Application.Dtos.OrderDtos
{
	public class OrderPostDtoStorage
    {
		public string? CustomerId { get; set; }
		public double Kq { get; set; }
        public string ToPhoneNumber { get; set; }
        public string ToAdress { get; set; }
        public int OrderToCityId { get; set; }
        public int? OrderToDistrictId { get; set; }
        public int PackageCount { get; set; }
        public string ToFullName { get; set; }
        public string Payment { get; set; }
        public string? FromFullName { get; set; }
        public string? FromPhoneNumber { get; set; }
    }
}

