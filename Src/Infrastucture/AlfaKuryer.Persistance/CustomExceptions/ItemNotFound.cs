using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlfaKuryer.Persistance.CustomExceptions
{
    public class ItemNotFound:Exception
    {
        public ItemNotFound(string message):base(message) { }
     
    }
}
