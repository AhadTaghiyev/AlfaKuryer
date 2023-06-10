using System;
namespace AlfaKuryer.Application.Dtos.OrderDtos
{
	public class OrderPostDto
	{
		public string? CustomerId { get; set; }
		public double Kq { get; set; }
        public string ToPhoneNumber { get; set; }
        public string ToAdress { get; set; }
        public string FromAdress { get; set; }
        public int OrderFromCityId { get; set; }
        public int? OrderFromDistrictId { get; set; }
        public int OrderToCityId { get; set; }
        public int? OrderToDistrictId { get; set; }
        public int PackageCount { get; set; }
        public string ToFullName { get; set; }
        public bool IsFast { get; set; }
        public string Payment { get; set; }
        public string? FromFullName { get; set; }
        public string? FromPhoneNumber { get; set; }
    }
}

