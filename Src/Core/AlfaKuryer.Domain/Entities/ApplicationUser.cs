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
  
    }
}
