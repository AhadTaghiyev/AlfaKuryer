using System;
using System.Text.RegularExpressions;
using AlfaKuryer.Application.Dtos.IdentityDtos;
using FluentValidation;

namespace AlfaKuryer.Application.Validations
{
	public class UserUpdateDtoValidation:AbstractValidator<UpdateDto>
	{
		public UserUpdateDtoValidation()
		{
   
            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.Birthday >= DateTime.Now.AddYears(16))
                {
                    context.AddFailure("Birthday","Yaş 16-nın altında olmamalıdır");
                }
            });
        }
	}
}

