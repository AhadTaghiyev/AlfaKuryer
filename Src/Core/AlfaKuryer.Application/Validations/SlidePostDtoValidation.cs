using System;
using AlfaKuryer.Application.Dtos.SlideDtos;
using AlfaKuryer.Application.FileControlls;
using FluentValidation;
using Microsoft.EntityFrameworkCore;

namespace AlfaKuryer.Application.Validations
{
	public class SlidePostDtoValidation:AbstractValidator<SlidePostDto>
	{
		public SlidePostDtoValidation()
		{
            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.formFIle != null)
                {
                    if (!ImageControll.IsImageOkay(x.formFIle))
                    {
                        context.AddFailure("formFIle", "Əlavə etdiyiniz fayıl şəkil formantında olmalıdır");
                    }
                    else if (!ImageControll.İsSizeOk(x.formFIle, 2))
                    {
                        context.AddFailure("formFIle", "Əlavə etdiyiniz fayıl ölçüsü maximum 2-mb olmalıdır");
                    }
                }
            });
        }
	}
}

