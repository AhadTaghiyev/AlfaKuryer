using System;
using AlfaKuryer.Application.Dtos.SlideDtos;

namespace AlfaKuryer.Application.Services.SlideService
{
	public interface ISlideService
	{
            public Task Create(SlidePostDto postDto);
            public Task Update(int id, SlidePostDto postDto);
            public Task Remove(int id);
            public Task<IEnumerable<SlideGetDto>> GetAll();
            public Task<SlideGetDto> Get(int id);
	
	}
}

