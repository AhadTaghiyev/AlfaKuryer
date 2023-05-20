using System;
using AlfaKuryer.Application.Dtos.CItyDtos;
using FluentValidation;

namespace AlfaKuryer.Application.Validations
{
	public class CityPostDtoValidation:AbstractValidator<CityPostDto>
	{
		public CityPostDtoValidation()
		{
			RuleFor(x => x.Name).NotEmpty().NotNull().WithMessage("Bos buraxila bilmez");
		}
	}
}

