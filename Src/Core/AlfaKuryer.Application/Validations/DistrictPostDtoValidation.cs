using System;
using AlfaKuryer.Application.Dtos.DistrictDtos;
using AlfaKuryer.Domain.Entities;
using FluentValidation;

namespace AlfaKuryer.Application.Validations
{
	public class DistrictPostDtoValidation:AbstractValidator<DistrictPostDto>
	{
		public DistrictPostDtoValidation()
		{
			RuleFor(x => x.Name).NotNull().NotEmpty().WithMessage("Bos buraxila bilmez");
			RuleFor(x => x.CityId).NotNull().NotEmpty().GreaterThan(0).WithMessage("Bos buraxila bilmez");
        }
	}
}

