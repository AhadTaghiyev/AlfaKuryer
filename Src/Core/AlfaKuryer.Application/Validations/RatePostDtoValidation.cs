using System;
using AlfaKuryer.Application.Dtos.RateDtos;
using FluentValidation;

namespace AlfaKuryer.Application.Validations
{
	public class RatePostDtoValidation:AbstractValidator<RatePostDto>
    {
		public RatePostDtoValidation()
		{
            RuleFor(x => x.From).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.To).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.Price).NotNull().NotEmpty().GreaterThan(0).WithMessage("Bos buraxila bilmez");
        }
	}
}

