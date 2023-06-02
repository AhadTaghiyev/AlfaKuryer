using System;
using System.Text.RegularExpressions;
using AlfaKuryer.Application.Dtos.CustomerDtos;
using FluentValidation;

namespace AlfaKuryer.Application.Validations
{
	public class CustomerPostDtoValidation:AbstractValidator<CustomerPostDto>
	{
		public CustomerPostDtoValidation()
		{
            RuleFor(x => x.Name).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.Surname).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.Email).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez").Custom((x, context) =>
            {
                Regex regex = new Regex(@"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

                if (!regex.IsMatch(x))
                    context.AddFailure("düzgün e-poçt ünvanı əlavə edin..");
            });
            RuleFor(x => x.BirthDate).NotNull().NotEmpty().WithMessage("Bos buraxila bilmez").Custom((x,context) =>
            {
                if (DateTime.Now.Day-x.Day<16)
                {
                    context.AddFailure("BirthDate", "yaşınız 16'nın altında ola bilməz");
                }
            });
            RuleFor(x => x.DocumentNumber).NotNull().NotEmpty().MinimumLength(8).MaximumLength(8).WithMessage("uzunluq 8 olmalıdır");
            RuleFor(x => x.Fin).NotNull().NotEmpty().MinimumLength(8).MaximumLength(8).WithMessage("uzunluq 8 olmalıdır");
            RuleFor(x => x.Password).NotNull().NotEmpty().MinimumLength(8).WithMessage("minimum uzunluq 8 olmalıdır");

            RuleFor(x => x.Phonenumber).NotNull().NotEmpty().WithMessage("Bos buraxila bilmez").Custom((x, context) =>
            {
                Regex regex = new Regex(@"^(\+994)?(994)?(51|55|77|70|60|90|99|050|051|055|077|070|060|090|099)\d{7}$");

                if (!regex.IsMatch(x))
                    context.AddFailure("düzgün Mobilnömrə ünvanı əlavə edin..");
            });
            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.Password != x.PasswordVerify)
                {
                    context.AddFailure("Şifrə uyğun deyil");
                }
            });
        
        }
	}
}

