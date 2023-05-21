using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKuryer.Domain.Entities
{
    public class Message:BaseEntity
    {
        public string FullName { get; set;}
        public string Email { get; set;}
        public string PhoneNumber { get; set;}
        public string Subject { get; set; }
        public string Content { get; set; }
    }
}

