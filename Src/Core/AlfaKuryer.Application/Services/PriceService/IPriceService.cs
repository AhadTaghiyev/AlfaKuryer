using System;
using AlfaKuryer.Application.Dtos.PriceDtos;

namespace AlfaKuryer.Application.Services.PriceService
{
	public interface IPriceService
	{
		public Task Update(int id,PricePostDto dto);
		public Task<IEnumerable<PriceGetDto>> GetAll();
		public Task<PriceGetDto> Get(int id);
	}
}

