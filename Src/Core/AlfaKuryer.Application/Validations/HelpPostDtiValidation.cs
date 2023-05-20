using System;
using AlfaKuryer.Application.Dtos.HelpDtos;
using FluentValidation;

namespace AlfaKuryer.Application.Validations
{
	public class HelpPostDtiValidation:AbstractValidator<HelpPostDto>
	{
		public HelpPostDtiValidation()
		{
            RuleFor(x => x.TitleAz).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.TitleEn).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.TitleRu).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.DescriptionAz).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.DescriptionEn).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.DescriptionRu).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
        }
	}
}

