using System;
using System.Linq.Expressions;
using AlfaKuryer.Application.Dtos.IdentityDtos;
using AlfaKuryer.Application.Dtos.MessageDto;
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


        public IdentityService(UserManager<ApplicationUser> userManager, IHttpContextAccessor httpContextAccessor, SignInManager<ApplicationUser> signManager, AlfaKuryerDbContext context)
        {
            _userManager = userManager;
            _httpContextAccessor = httpContextAccessor;
            _signManager = signManager;
            _context = context;
        }

        public async Task<string> Register(RegisterDto dto)
        {

            ApplicationUser user = new ApplicationUser()
            {
                UserName = dto.Email,
                Surname = dto.Surname,
                Name = dto.Name,
                Status = true,
                Email = dto.Email,
                PhoneNumber=dto.PhoneNumber,
                Role=dto.Role
               

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
            var token = await _userManager.GenerateEmailConfirmationTokenAsync(user);
            string link = await GenerateLink(user, "/Account/VerfiyEmail",token);
            await AddReque(user.Email,link, user.Name);
            if(user.Role== "Courier")
            {
                foreach (var item in dto.Ids)
                {
                    ApplicationUserDistrict applicationUserDistrict = new ApplicationUserDistrict
                    {
                        ApplicationUser=user,
                        DistrictId=item
                    };
                   await  _context.AddAsync(applicationUserDistrict);
                }
              await  _context.SaveChangesAsync();
            }
              
            return "";
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

        public async Task Verify(string email, string token)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (user != null)
            {
                await _userManager.ConfirmEmailAsync(user, token);
                await _signManager.SignInAsync(user, true);
            }
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
                return "Emailinizə daxil olaraq hesabınızı təsdiqləyin";
            }
            var result = await _signManager.PasswordSignInAsync(user,dto.Password,true,false);
            if (!result.Succeeded)
            {
                
                if (!result.IsLockedOut)
                {
                    return "Email və ya şifrə yalnışdır";
                }
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
            user.Citizen = dto.Citizen;
            user.CityId = dto.CityId;
            user.CompanyTin = user.CompanyTin;
            user.DocumentNo = dto.DocumentNo;
            user.Email = user.Email;
            user.Name = dto.Name;
            user.Surname = dto.Surname;
            user.UserName = dto.Email;
            if (user.Role == "User" || user.Role == "Company")
            {
              await  _signManager.SignInAsync(user,true);
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
    }
}

