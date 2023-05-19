

using AlfaKuryer.Application.Dtos.SettingDtos;
using FluentValidation;
using AlfaKuryer.Application;
using AlfaKuryer.Application.FileControlls;

namespace AlfaKuryer.Application.Validations
{
    public class SettingPostDtoValidation:AbstractValidator<SettingPostDto>
    {
        public SettingPostDtoValidation()
        {
            RuleFor(x => x).Custom((x, context) =>
            {
                if(x.FormFile!=null)
                {
                    if (!ImageControll.IsImageOkay(x.FormFile))
                    {
                        context.AddFailure("FormFile","Əlavə etdiyiniz fayıl şəkil formantında olmalıdır");
                    }else if (!ImageControll.İsSizeOk(x.FormFile,2))
                    {
                        context.AddFailure("FormFile", "Əlavə etdiyiniz fayıl ölçüsü maximum 2-mb olmalıdır");
                    }
                }
            });

            RuleFor(x => x.Adress).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.PhoneNumber1).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.PhoneNumber2).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.FaceBookLink).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.InstgaramLink).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
            RuleFor(x => x.YoutubeLink).NotNull().NotEmpty().MinimumLength(3).WithMessage("Bos buraxila bilmez");
        }
    }
}
