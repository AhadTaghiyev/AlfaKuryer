using System;
using AlfaKuryer.Application.Dtos.OrderDtos;
using FluentValidation;

namespace AlfaKuryer.Application.Validations
{
	public class OrderPostDtoValidation:AbstractValidator<OrderPostDto>
	{
		public OrderPostDtoValidation()
		{
			RuleFor(x => x.OrderFromCityId).GreaterThan(0).NotEmpty().NotNull();
			RuleFor(x => x.FromAdress).NotNull().NotEmpty();
			RuleFor(x => x.ToAdress).NotNull().NotEmpty();
			RuleFor(x => x.ToPhoneNumber).NotNull().NotEmpty();
        }
	}
}

