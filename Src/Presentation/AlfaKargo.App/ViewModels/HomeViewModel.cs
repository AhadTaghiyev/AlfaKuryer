using System;
using AlfaKuryer.Application.Dtos.HelpDtos;
using AlfaKuryer.Application.Dtos.RateDtos;
using AlfaKuryer.Application.Dtos.SlideDtos;

namespace AlfaKargo.App.ViewModels
{
	public record HomeViewModel
	{

        public IEnumerable<HelpGetDto> helpGetDtos { get; set; }
		public IEnumerable<RateGetDto> rateGetDtos { get; set; }
        public IEnumerable<SlideGetDto> slideGetDtos { get; set; }
        public HomeViewModel()
        {
            this.helpGetDtos = new HashSet<HelpGetDto>();
            this.rateGetDtos = new HashSet<RateGetDto>();
            this.slideGetDtos = new HashSet<SlideGetDto>();
        }
    }
}

