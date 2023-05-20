

using AlfaKuryer.Application.Dtos.HelpDtos;
using AlfaKuryer.Application.Dtos.SettingDtos;

namespace AlfaKuryer.Application.Services.HelpServices
{
    public interface IHelpService
    {
        public Task Create(HelpPostDto postDto);
        public Task Update(int id, HelpPostDto postDto);
        public Task Remove(int id);
        public Task<IEnumerable<HelpGetDto>> GetAll();
        public Task<HelpGetDto> Get(int id);
        public Task<HelpGetManageDto> GetManage(int id);
    }
}
