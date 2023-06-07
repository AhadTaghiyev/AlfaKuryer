using System;
using System.Linq.Expressions;
using AlfaKuryer.Application.Dtos.AdresDtos;
using AlfaKuryer.Application.Dtos.IdentityDtos;
using AlfaKuryer.Domain.Entities;

namespace AlfaKuryer.Application.Services.IdentityServices
{
	public interface IIdentityService
	{
		public Task<string> Register(RegisterDto dto);
		public Task VerifyEmail(string email, string token);
		public Task SignOut();
		public Task<string> Signin(LoginDto dto);
		public  Task<string> ForgetPassword(string email);
		public Task<string> ResetPassword(ResetPasswordDto dto);
		public  Task<List<ApplicationUser>> GetUsers(Expression<Func<ApplicationUser, bool>> expression);
		public Task ChangeStatus(string id);
		public Task<string> Update(string id,UpdateDto dto);
		public Task<string> VerifyOtp(string otp);
		public  Task SendMessageToAllUsers(SendMailToUsers sendMailTo);
		public Task<ApplicationUser> GetByUserName();
        public Task<UserGetDto> Get(string id);
		public  Task<string> Update(UpdateDto dto);
		public  Task<IEnumerable<AdressGetDto>> GetAdress();
    }
}

