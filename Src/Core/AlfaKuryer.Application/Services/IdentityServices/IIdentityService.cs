using System;
using System.Linq.Expressions;
using AlfaKuryer.Application.Dtos.IdentityDtos;
using AlfaKuryer.Domain.Entities;

namespace AlfaKuryer.Application.Services.IdentityServices
{
	public interface IIdentityService
	{
		public Task<string> Register(RegisterDto dto);
		public Task Verify(string email, string token);
		public Task SignOut();
		public Task<string> Signin(LoginDto dto);
		public  Task<string> ForgetPassword(string email);
		public Task<string> ResetPassword(ResetPasswordDto dto);
		public  Task<List<ApplicationUser>> GetUsers(Expression<Func<ApplicationUser, bool>> expression);
		public Task ChangeStatus(string id);
		public Task<string> Update(string id,UpdateDto dto);

		public Task<UserGetDto> Get(string id);
    }
}

