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
            RuleFor(x => x.Name).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.Role != "User")
                {
                    if (string.IsNullOrWhiteSpace(x.Surname))
                    {
                        context.AddFailure("Surname", "Bos buraxila bilmez");
                    }
                }
            });
            RuleFor(x => x).Custom((x, context) =>
            {
                Regex regex = new Regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}(\\.[a-zA-Z]{2,})?$");

                if (!regex.IsMatch(x.Email))
                {
                    context.AddFailure("Email", "Düzgün formatda email əlavə edin");
                }

            });
            RuleFor(x => x.Password).Custom((x, context) =>
            {
                if (string.IsNullOrWhiteSpace(x))
                {
                    if (x.Length < 8)
                    {
                        context.AddFailure("Parol uzunluğu minimum 8 olmalıdır.");
                    }
                }
            });

        
            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.Role != "User" && x.Role != "Company" && x.Role != "Courier" && x.Role != "Admin" && x.Role != "SuperAdmin")
                {
                    context.AddFailure("Bütün hüquqlar alfaex tərəfindən qorunur");
                }
            });
        }
	}
}

