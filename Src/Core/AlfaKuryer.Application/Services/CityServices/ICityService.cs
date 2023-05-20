

using AlfaKuryer.Application.Dtos.CItyDtos;
using AlfaKuryer.Application.Dtos.SettingDtos;

namespace AlfaKuryer.Application.Services.CityServices
{
    public interface ICityService
    {
        public Task Create(CityPostDto postDto);
        public Task Update(int id, CityPostDto postDto);
        public Task Remove(int id);
        public Task<IEnumerable<CityGetDto>> GetAll();
        public Task<CityGetDto> Get(int id);
    }
}
