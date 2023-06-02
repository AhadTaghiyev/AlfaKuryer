using System;
using System.Text.RegularExpressions;
using AlfaKuryer.Application.Dtos.IdentityDtos;
using AlfaKuryer.Application.Dtos.RateDtos;
using FluentValidation;

namespace AlfaKuryer.Application.Validations
{
	public class ResetPasswordDtoValidation : AbstractValidator<ResetPasswordDto>
    {
        public ResetPasswordDtoValidation()
        {
            RuleFor(x => x.Password).NotEmpty().NotNull().MinimumLength(8).WithMessage("minium uzunluq 8 olmalıdır");

            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.Password != x.VerifyPassword)
                {
                    context.AddFailure("VerifyPassword","Şifrənizi təsdiqləyin");
                }
            });
       
        }
		
	}
}

