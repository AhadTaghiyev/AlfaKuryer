using System;
using System.Runtime.ConstrainedExecution;
using AlfaKuryer.Application.Dtos.BaseUserDto;
using AlfaKuryer.Application.Dtos.CustomerDtos;
using AlfaKuryer.Application.Services.CustomerService;
using AlfaKuryer.Domain.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace AlfaKuryer.Persistance.Services
{
	public class CustomerService:ICustomerService
	{
		private readonly UserManager<Customer> userManager;
        private readonly SignInManager<Customer> manager;

        public CustomerService(UserManager<Customer> user, SignInManager<Customer> manager)
        {
            this.userManager = user;
            this.manager = manager;
        }

        public async Task<IEnumerable<CustomerGetDto>> GetCustomers()
        {
            IEnumerable<CustomerGetDto> customerGetDtos = new HashSet<CustomerGetDto>();

            customerGetDtos = userManager.Users.Select(x=>new CustomerGetDto
            {
                Surname=x.Surname,BirthDate=x.BirthDate,DocumentNumber=x.DocumentNumber,Email=x.Email,Fin=x.Fin,Name=x.Name,
            });

            return customerGetDtos;
        }

        public async Task Login(LoginDto loginDto, ModelStateDictionary modelState)
        {
            var user = await userManager.FindByEmailAsync(loginDto.Email);
            if (user == null)
                modelState.AddModelError("","istifadəçi adı və ya şifrə yalnışdır");

            await manager.PasswordSignInAsync(user,loginDto.Password,true,true);
        }

        public async Task LogOut()
        {
            await manager.SignOutAsync();
        }

        public Task Register(CustomerPostDto postDto, ModelStateDictionary modelState)
        {
            throw new NotImplementedException();
        }
    }
}

