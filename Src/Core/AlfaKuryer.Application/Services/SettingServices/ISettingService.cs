

using AlfaKuryer.Application.Dtos.SettingDtos;

namespace AlfaKuryer.Application.Services.SettingServices
{
    public interface ISettingService
    {
        public Task Update(SettingPostDto settingPostDto);
        public Task<SettingGetDto> Get();
    }
}
