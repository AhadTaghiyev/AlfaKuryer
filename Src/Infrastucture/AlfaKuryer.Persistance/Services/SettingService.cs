

using AlfaKuryer.Application.Dtos.SettingDtos;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Services.SettingServices;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Helper;
using AutoMapper;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace AlfaKuryer.Persistance.Services
{
    public class SettingService : ISettingService
    {
        private readonly ISettingReadRepository _settingReadRepository;
        private readonly ISettingWriteRepository _settingWriteRepository;
        private readonly IMapper _mapper;
        private readonly IWebHostEnvironment _env;

        public SettingService(ISettingReadRepository settingReadRepository, ISettingWriteRepository settingWriteRepository, IMapper mapper, IWebHostEnvironment env)
        {
            _settingReadRepository = settingReadRepository;
            _settingWriteRepository = settingWriteRepository;
            _mapper = mapper;
            _env = env;
        }
        public async Task Update(SettingPostDto settingPostDto)
        {
            Setting setting =await _settingReadRepository.GetAsync(x=>!x.IsDeleted,true,false);

            if (setting == null)
                setting = new();

            setting.Adress = settingPostDto.Adress;
            setting.Email = settingPostDto.Email;
            setting.FaceBookLink = settingPostDto.FaceBookLink;
            setting.YoutubeLink = settingPostDto.YoutubeLink;
            setting.InstgaramLink = settingPostDto.InstgaramLink;
            setting.PhoneNumber1 = settingPostDto.PhoneNumber1;
            setting.PhoneNumber2 = settingPostDto.PhoneNumber2;

            if (settingPostDto.FormFile != null)
            {
                setting.Logo = settingPostDto.FormFile.SaveImage(_env.WebRootPath,"assets/imgs/Logo/");
            }
            await _settingWriteRepository.UpdateAsync(setting);
            await _settingWriteRepository.SaveAsync();
        }

        public async Task<SettingGetDto> Get()
        {
            SettingGetDto getDto = 
            
                  _mapper.Map<SettingGetDto>(await _settingReadRepository.GetAsync(x => !x.IsDeleted, false, false));
          
             
            return getDto;
        }
    }
}
