using System;
using AlfaKuryer.Application.Dtos.RateDtos;

namespace AlfaKuryer.Application.Services.RateServices
{
	public interface IRateService
	{
		public Task Create(RatePostDto postDto);
		public Task Update(int id,RatePostDto postDto);
		public Task Remove(int id);
		public Task<IEnumerable<RateGetDto>> GetAll();
		public Task<RateGetDto> Get(int id);

    }
}

