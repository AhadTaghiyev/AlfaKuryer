using System;
using System.Linq.Expressions;
using AlfaKuryer.Application.Dtos.AdresDtos;
using AlfaKuryer.Application.Dtos.IdentityDtos;
using AlfaKuryer.Application.Dtos.MessageDto;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Application.Services.IdentityServices;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Infrastucture.BackgorundJobs;
using AlfaKuryer.Infrastucture.ExtornerlServices;
using AlfaKuryer.Persistance.Context;
using AlfaKuryer.Persistance.CustomExceptions;
using AlfaKuryer.Persistance.Extentions;
using Hangfire;
using Microsoft.AspNetCore.Hosting.Server;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace AlfaKuryer.Persistance.Services
{
    public class IdentityService : IIdentityService
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IConfiguration _config;
        private readonly SignInManager<ApplicationUser> _signManager;
        private readonly AlfaKuryerDbContext _context;
        private readonly IAdressWriteRepository _adressWrite;
        private readonly IAdressReadRepository _adressRead;
        private static readonly Random random = new Random();


        public IdentityService(UserManager<ApplicationUser> userManager, IHttpContextAccessor httpContextAccessor, SignInManager<ApplicationUser> signManager, AlfaKuryerDbContext context, IAdressWriteRepository adressWrite, IAdressReadRepository adressRead)
        {
            _userManager = userManager;
            _httpContextAccessor = httpContextAccessor;
            _signManager = signManager;
            _context = context;
            _adressWrite = adressWrite;
            _adressRead = adressRead;
        }
        private string GenerateUniqueNumber()
        {
            string uniqueNumber = DateTime.Now.Ticks.ToString();
            uniqueNumber += new Random().Next(10000000, 99999999).ToString();
            uniqueNumber = uniqueNumber.Substring(uniqueNumber.Length - 8);
            return uniqueNumber;
        }

        public async Task<string> Register(RegisterDto dto)
        {
            
            ApplicationUser user = new ApplicationUser()
            {
                UserName ="A"+GenerateUniqueNumber(),
                Surname = dto.Surname,
                Name = dto.Name,
                Status = true,
                Email = dto.Email,
                PhoneNumber=dto.PhoneCode+dto.PhoneNumber,
                Role=dto.Role,
                MessgaeBy=dto.Method=="email"?true:false
            };
            if (user.Role == "Admin" || user.Role == "SuperAdmin" || user.Role == "Courier")
            {
                user.EmailConfirmed = true;
            }
            var result=await _userManager.CreateAsync(user,dto.Password);
            if (!result.Succeeded)
            {
                foreach (var item in result.Errors)
                {
                    if (item.Code == "PasswordTooShort")
                        return "Parolun uzunluğu en az 6 karakter olmalıdır.";
                    else if (item.Code == "DuplicateUserName")
                        return "Email artıq mövcuddur";

                    return item.Description;
                }
            }
            await _userManager.AddToRoleAsync(user,dto.Role);

            if (user.Role == "Courier")
            {
                foreach (var item in dto.Ids)
                {
                    ApplicationUserDistrict applicationUserDistrict = new ApplicationUserDistrict
                    {
                        ApplicationUser = user,
                        DistrictId = item
                    };
                    await _context.AddAsync(applicationUserDistrict);
                }
                await _context.SaveChangesAsync();
                return "";
            }

            if (user.MessgaeBy==true&&!user.EmailConfirmed)
            {
                var token = await _userManager.GenerateEmailConfirmationTokenAsync(user);
                string link = await GenerateLink(user, "/Account/VerfiyEmail", token);
                await AddReque(user.Email, link, user.Name);
            }
            else
            {
                if (!user.EmailConfirmed)
                {
                    var otpCode = GenerateOTP(8);
                    user.OtpCode = otpCode;
                    await _userManager.UpdateAsync(user);
                    Expression<Action> sendExpression = () => SmsService.Send($"Tesdiqleme kodu:{otpCode}", dto.PhoneCode + dto.PhoneNumber);
                    await MessageJob.SedMessage(sendExpression);
                    return "otp";
                }
            }
            return "";
        }

        private static string GenerateOTP(int length)
        {
            const string allowedChars = "0123456789";
            char[] chars = new char[length];

            for (int i = 0; i < length; i++)
            {
                chars[i] = allowedChars[random.Next(allowedChars.Length)];
            }

            return new string(chars);
        }

        private async Task<string> GenerateLink(ApplicationUser user,string url,string token)
        {
            // Get the current HttpContext
            var context = _httpContextAccessor.HttpContext;

            // Build the email verification URL
            var link = context.GetConfirmationLink(user.Email, token, url);
            return link;
        }
        private async Task AddReque(string to,string link,string name)
        {

            MailService mail = new MailService(_config);
            Expression<Action> sendExpression = () => mail.Send(to,link,name);
            await MessageJob.SedMessage(sendExpression);
        }

        public async Task VerifyEmail(string email, string token)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (user != null)
            {
                await _userManager.ConfirmEmailAsync(user, token);
                await _signManager.SignInAsync(user, true);
            }
        }

        public async Task<string> VerifyOtp(string otp)
        {
            if (string.IsNullOrWhiteSpace(otp))
            {
                return "Otp code boş ola bilməz";
            }
            var user = await _userManager.Users.Where(x=>x.OtpCode==otp).FirstOrDefaultAsync();

            if (user == null)
            {
                return "otp yalnışdır";
            }

            user.OtpCode = null;
            user.EmailConfirmed = true;
            await _userManager.UpdateAsync(user);
            await _signManager.SignInAsync(user,true);
            return "";
        }
        public async Task SignOut()
        {
            await _signManager.SignOutAsync();
        }

        

        public async Task<string> Signin(LoginDto dto)
        {
            if (string.IsNullOrWhiteSpace(dto.Email) || string.IsNullOrWhiteSpace(dto.Password))
            {
                return "Email və ya şifrə boş ola bilməz";
            }

            var user=await _userManager.FindByEmailAsync(dto.Email);

            if (user == null || user.Status == false)
            {
                return "Email və ya şifrə yalnışdır";
            }
            if (!user.EmailConfirmed)
            {
                return "Hesabınız təsdiqləyin";
            }
         

            var result = await _signManager.PasswordSignInAsync(user,dto.Password,true,false);
            if (!result.Succeeded)
            {
                
                if (!result.IsLockedOut)
                {
                    return "Email və ya şifrə yalnışdır";
                }
            }
            if (user.Role == "Courier")
            {
                return "C";
            }
            return "";
        }

        public async Task<string> ForgetPassword(string email)
        {
            if (string.IsNullOrWhiteSpace(email))
                return "email daxil edin";

            var user = await _userManager.FindByEmailAsync(email);

            if (user == null||user.Status==false)
                return "İstifadəçi tapılmadı";

            var token = await _userManager.GeneratePasswordResetTokenAsync(user);
            string link = await GenerateLink(user, "/Account/ResetPassword",token);
            await AddReque(user.Email, link, user.Name);
            return "";
        }

        public async Task<string> ResetPassword(ResetPasswordDto dto)
        {
            if (string.IsNullOrWhiteSpace(dto.Email))
                return "email daxil edin";

            var user = await _userManager.FindByEmailAsync(dto.Email);

            if (user == null || user.Status == false)
                return "İstifadəçi tapılmadı";

           var result= await _userManager.ResetPasswordAsync(user, dto.Token, dto.Password);
            if (!result.Succeeded)
            {
                foreach (var item in result.Errors)
                {
                    return item.Description;
                }
            }
            return "";
        }
        public async Task<List<ApplicationUser>> GetUsers(Expression<Func<ApplicationUser,bool>> expression)
        {
            var users = _userManager.Users.Where(expression).ToList();
            return users;
        }

        public async Task ChangeStatus(string id)
        {
            var user = await _userManager.FindByIdAsync(id);

            if (user == null)
                throw new ItemNotFound("Item not found");

            user.Status = false;
            await _userManager.UpdateAsync(user);
        }

        public async Task<string> Update(string id,UpdateDto dto)
        {
            var user = await _userManager.FindByIdAsync(id);

            if (user == null)
                throw new ItemNotFound("Item not foud");

            user.Birthday = dto.Birthday;
            user.CompanyTin = user.CompanyTin;
            user.DocumentNo = dto.DocumentNo;
            user.Identification = dto.Identification;

            if (dto.Adress != null && dto.Adress.Count() > 0)
            {
                foreach (var item in dto.Adress)
                {
                    Adress adress = new Adress
                    {
                        UserAdres = item,
                        ApplicationUser = user
                    };
                    await _adressWrite.AddAsync(adress);
                }
            }
            await _userManager.UpdateAsync(user);
       
            if (user.Role == "User" || user.Role == "Company")
            {
              await  _signManager.SignInAsync(user,true);
            }
            return "";
        }


        public async Task<string> Update(UpdateDto dto)
        {
            string userName = _httpContextAccessor?.HttpContext?.User?.Identity.Name;
            var user = await _userManager.Users.Where(x => x.UserName == userName).Include(x => x.Adresses.Where(x=>!x.IsDeleted)).FirstOrDefaultAsync();

            if (user == null)
                throw new ItemNotFound("Item not foud");

            user.Birthday = dto.Birthday;
            user.CompanyTin = user.CompanyTin;
            user.DocumentNo = dto.DocumentNo;
            user.Identification = dto.Identification;
            user.Citizen = dto.Citizen;
            user.AccountIsCompleet = true;
            foreach (var item in user.Adresses)
            {
                item.IsDeleted = true;
                await _adressWrite.UpdateAsync(item);
            }

            if (dto.Adress != null && dto.Adress.Count() > 0)
            {
                foreach (var item in dto.Adress)
                {
                    Adress adress = new Adress
                    {
                        UserAdres = item,
                        ApplicationUser = user
                    };
                    await _adressWrite.AddAsync(adress);
                }
                await _adressWrite.SaveAsync();
            }
            
            await _userManager.UpdateAsync(user);

            if (user.Role == "User" || user.Role == "Company")
            {
                await _signManager.SignInAsync(user, true);
            }
            return "";
        }

        public async Task<UserGetDto> Get(string id)
        {
            var user = await _userManager.FindByIdAsync(id);

            if (user == null)
                throw new ItemNotFound("Item not foud");

            return null;
        }
        public async Task<ApplicationUser> GetByUserName()
        {
            string userName = _httpContextAccessor?.HttpContext?.User?.Identity.Name;
            var user = await _userManager.Users.Where(x=>x.UserName== userName).Include(x=>x.Adresses.Where(x => !x.IsDeleted)).FirstOrDefaultAsync();

            if (user == null)
                throw new ItemNotFound("Item not foud");

            return user;
        }

        public async Task SendMessageToAllUsers(SendMailToUsers sendMailTo)
        {
            MessageJob messageJob = new MessageJob(_userManager,_config);

          
                await MessageJob.SendAll(()=> messageJob.SendMessageAllUsers(sendMailTo.Subject, sendMailTo.Mail));
        }

        public async Task<IEnumerable<AdressGetDto>> GetAdress()
        {
            string userName = _httpContextAccessor.HttpContext.User.Identity.Name;
            var user =await _userManager.Users.Where(x=>x.UserName==userName).Include(x=>x.Adresses.Where(x=>!x.IsDeleted)).FirstOrDefaultAsync();

            IEnumerable<AdressGetDto> adresses = new HashSet<AdressGetDto>();
            adresses = user.Adresses.Select(x => new AdressGetDto { UserAdres = x.UserAdres }).ToList();
            return adresses;

        }

        
        
     
    }
}

