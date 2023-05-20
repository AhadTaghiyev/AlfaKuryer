using System;
using AlfaKuryer.Application.Dtos.DistrictDtos;

namespace AlfaKuryer.Application.Services.DistrictServices
{
    public interface IDistrictService
    {
        public Task Create(DistrictPostDto postDto);
        public Task Update(int id, DistrictPostDto postDto);
        public Task Remove(int id);
        public Task<IEnumerable<DistrictGetDto>> GetAll();
        public Task<DistrictGetDto> Get(int id);
    }
}

