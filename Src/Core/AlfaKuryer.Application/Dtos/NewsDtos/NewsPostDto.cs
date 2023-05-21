using System;
using Microsoft.AspNetCore.Http;

namespace AlfaKuryer.Application.Dtos.NewsDtos
{
    public class NewsPostDto
    {
        public IFormFile? FormFile { get; set; }
        public string? TitleAz { get; set; }
        public string? DescriptionAz { get; set; }

        public string? TitleEn { get; set; }
        public string? DescriptionEn { get; set; }

        public string? TitleRu { get; set; }
        public string? DescriptionRu { get; set; }
    }

}

