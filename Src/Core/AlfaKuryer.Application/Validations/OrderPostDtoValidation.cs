using System;
using AlfaKuryer.Application.Dtos.OrderDtos;
using FluentValidation;

namespace AlfaKuryer.Application.Validations
{
	public class OrderPostDtoValidation:AbstractValidator<OrderPostDto>
	{
		public OrderPostDtoValidation()
		{
			RuleFor(x => x.OrderFromCityId).GreaterThan(0).NotEmpty().NotNull().WithMessage("Şəhər seçin");
			RuleFor(x => x.FromAdress).NotNull().NotEmpty().WithMessage("Adress boş buraxıla bilməz");
			RuleFor(x => x.ToAdress).NotNull().NotEmpty().WithMessage("Adress boş buraxıla bilməz");
			RuleFor(x => x.ToPhoneNumber).NotNull().NotEmpty().WithMessage("Telefon boş buraxıla bilməz");
			RuleFor(x => x.Kq).NotNull().NotEmpty().WithMessage("boş buraxıla bilməz");
			RuleFor(x => x.ToFullName).NotNull().NotEmpty().WithMessage("boş buraxıla bilməz");
			RuleFor(x => x.PackageCount).NotNull().NotEmpty().WithMessage("boş buraxıla bilməz");
            RuleFor(x => x.Payment).Custom((x, context) =>
			{
				if (x != "Card")
				{
					if(x != "Cash")
					{
                        context.AddFailure("Ödəniş üsulu cart və ya nağd olmalıdır");
                    }
				}
			});
        }
	}
}

