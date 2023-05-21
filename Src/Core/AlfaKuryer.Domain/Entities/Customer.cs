using System;
namespace AlfaKuryer.Domain.Entities
{
    public class Customer : ApplicationUser
    {
        public string Surname { get; set; }
        public DateTime BirthDate { get; set; }
        public string DocumentNumber { get; set; }
        public string Fin { get; set; }
        public string Adress { get; set; }
    }
}

