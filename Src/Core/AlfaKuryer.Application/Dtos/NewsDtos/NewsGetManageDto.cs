using System;
using AlfaKuryer.Domain.Entities;

namespace AlfaKuryer.Application.Dtos.NewsDtos
{
	public record NewsGetManageDto
	{
	    public int Id { get; set; }
        public string Image { get; set; }
        public string? TitleAz { get; set; }
        public string? DescriptionAz { get; set; }

        public string? TitleEn { get; set; }
        public string? DescriptionEn { get; set; }

        public string? TitleRu { get; set; }
        public string? DescriptionRu { get; set; }
    }
}

