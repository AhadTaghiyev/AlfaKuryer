using AlfaKuryer.Application.Dtos.CItyDtos;
using AlfaKuryer.Application.Dtos.DistrictDtos;
using AlfaKuryer.Application.Dtos.HelpDtos;
using AlfaKuryer.Application.Dtos.MessageDto;
using AlfaKuryer.Application.Dtos.OrderDtos;
using AlfaKuryer.Application.Dtos.PriceDtos;
using AlfaKuryer.Application.Dtos.RateDtos;
using AlfaKuryer.Application.Dtos.SettingDtos;
using AlfaKuryer.Application.Dtos.SlideDtos;
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
            CreateMap<RatePostDto, Rate>();
            CreateMap<Rate, RateGetDto>();
            CreateMap<Help, HelpGetManageDto>();
            CreateMap<HelpPostDto, Help>();
            CreateMap<City, CityGetDto>();
            CreateMap<CityPostDto, City>();
            CreateMap<District, DistrictGetDto>();
            CreateMap<DistrictPostDto, District>();
            CreateMap<SlidePostDto, Slide>();
            CreateMap<Slide, SlideGetDto>();
            CreateMap<Message, MessageGetDto>();
            CreateMap<MessagePostDto, Message>();
            CreateMap<PricePostDto, PriceForOrder>();
            CreateMap<PriceForOrder, PriceGetDto>();
            CreateMap<Order, OrderGetDto>();
            CreateMap<OrderPostDto, Order>();
        }
    }
}
