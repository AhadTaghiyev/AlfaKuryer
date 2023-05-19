using AlfaKuryer.Application.Dtos.SettingDtos;
using AlfaKuryer.Domain.Entities;
using AutoMapper;

namespace AlfaKuryer.Application.Profiles
{
    public class MapProfile : Profile
    {
        public MapProfile()
        {
            CreateMap<SettingPostDto, Setting>();
            CreateMap<Setting, SettingGetDto>();
        }
    }
}
