using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;

namespace AlfaKuryer.Domain.Entities
{
    public class ApplicationUser :  Microsoft.AspNetCore.Identity.IdentityUser
    {
        public string Name { get; set; }
        public string? Surname { get; set; }
        public DateTime Birthday { get; set; }
        public string? Citizen { get; set; }
        public string? DocumentNo { get; set; }
        public string? Identification { get; set; }
        public string? CompanyTin { get; set; }
        public bool Status { get; set; }
        public string Role { get; set; }
        public string? Adress { get; set; }
        public List<ApplicationUserDistrict> ApplicationUserDistricts { get; set; }
        public int? CityId { get; set; }
        public City City { get; set; }
        public bool? MessgaeBy { get; set;  }
        public string? OtpCode { get; set; }
        public List<Adress> Adresses { get; set; }
        public bool AccountIsCompleet { get; set; }
        public List<Order> Orders { get; set; }
        public  double? CourierSalaryForSimple { get; set; }
        public  double? CourierSalaryForFast { get; set; }
    }
}
