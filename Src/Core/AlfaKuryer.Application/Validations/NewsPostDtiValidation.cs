using System;
using AlfaKuryer.Application.Dtos.NewsDtos;
using AlfaKuryer.Application.FileControlls;
using FluentValidation;

namespace AlfaKuryer.Application.Validations
{
	public class NewsPostDtiValidation:AbstractValidator<NewsPostDto>
	{
		public NewsPostDtiValidation()
		{
            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.FormFile != null)
                {
                    if (!ImageControll.IsImageOkay(x.FormFile))
                    {
                        context.AddFailure("FormFile", "Əlavə etdiyiniz fayıl şəkil formantında olmalıdır");
                    }
                    else if (!ImageControll.İsSizeOk(x.FormFile, 2))
                    {
                        context.AddFailure("FormFile", "Əlavə etdiyiniz fayıl ölçüsü maximum 2-mb olmalıdır");
                    }
                }
            });
            RuleFor(x => x.TitleAz).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.TitleEn).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.TitleRu).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.DescriptionAz).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.DescriptionEn).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.DescriptionRu).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
        }
	}
}

