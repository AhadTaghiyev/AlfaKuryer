using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace AlfaKuryer.Application.Dtos.SettingDtos
{
    public record SettingGetDto
    {
        public int Id { get; set; }
        public string Logo { get; set; }
        public string PhoneNumber1 { get; set; }
        public string PhoneNumber2 { get; set; }
        public string Email { get; set; }
        public string InstgaramLink { get; set; }
        public string FaceBookLink { get; set; }
        public string YoutubeLink { get; set; }
        public string Adress { get; set; }

    }
}
