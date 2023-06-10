using System;
using System.Text.RegularExpressions;
using AlfaKuryer.Application.Dtos.IdentityDtos;
using AlfaKuryer.Application.Dtos.RateDtos;
using FluentValidation;

namespace AlfaKuryer.Application.Validations
{
	public class RegisterDtoValidation : AbstractValidator<RegisterDto>
    {
        public RegisterDtoValidation()
        {
            RuleFor(x => x.Name).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.Role=="User")
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
            RuleFor(x => x).Custom((x, context) =>
            {
                Regex regex = new Regex(@"^(994)(51|50|55|77|10|70|60|90|99)\d{7}$");


                if (!regex.IsMatch(x.PhoneCode+x.PhoneNumber))
                {
                    context.AddFailure("PhoneNumber", "Düzgün formatda telefon əlavə edin");
                }

            });
            RuleFor(x => x.Password).NotEmpty().NotNull().MinimumLength(8).WithMessage("minium uzunluq 8 olmalıdır");

            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.Password != x.VerifyPassword)
                {
                    context.AddFailure("VerifyPassword","Şifrənizi təsdiqləyin");
                }
            });
            RuleFor(x => x).Custom((x, context) =>
            {
                if(x.IsAgree==false)
                    context.AddFailure("Razılaşmanı qəbul edin");

            });
            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.Role != "User" && x.Role != "Company" && x.Role != "Courier" && x.Role != "Admin" && x.Role != "SuperAdmin"&&x.Role!="Cassir")
                {
                    context.AddFailure("Bütün hüquqlar alfaex tərəfindən qorunur");
                }
            });
            RuleFor(x => x).Custom((x, context) =>
            {
                if(x.Role== "Courier")
                {
                    if (x.Ids == null || x.Ids.Count() == 0)
                    {
                        context.AddFailure("Rayon seçimi məcburidir");
                    }
                }
            });

            RuleFor(x => x).Custom((x, context) =>
            {
                if (x.Role == "User")
                {
                    if (x.Method != "email" && x.Method != "phone")
                    {
                        context.AddFailure("Bütün hüquqlar alfaex tərəfindən qorunur");
                    }
                }
            });
        }
		
	}
}

