using System;
using AlfaKuryer.Application.Dtos.BaseUserDto;
using AlfaKuryer.Application.Dtos.CustomerDtos;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace AlfaKuryer.Application.Services.CustomerService
{
	public interface ICustomerService
	{
		public Task Register(CustomerPostDto postDto, ModelStateDictionary modelState);
		public Task LogOut();
		public Task Login(LoginDto loginDto, ModelStateDictionary modelState);
		public Task<IEnumerable<CustomerGetDto>> GetCustomers();


    }
}

