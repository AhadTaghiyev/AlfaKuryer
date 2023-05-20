using System;
using AlfaKuryer.Application.Dtos;
using AlfaKuryer.Application.Dtos.RateDtos;
using AlfaKuryer.Application.Dtos.SettingDtos;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Application.Services.RateServices;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.CustomExceptions;
using AutoMapper;

namespace AlfaKuryer.Persistance.Services
{
    
    public class RateService : IRateService
    {
        private readonly IRateReadRepository _rateReadRepository;
        private readonly IRateWriteRepository _rateWriteRepository;
        private readonly IMapper _mapper;

        public RateService(IRateReadRepository rateReadRepository, IRateWriteRepository rateWriteRepository, IMapper mapper)
        {
            _rateReadRepository = rateReadRepository;
            _rateWriteRepository = rateWriteRepository;
            _mapper = mapper;
        }

        public async Task Create(RatePostDto postDto)
        {
            Rate rate = _mapper.Map<Rate>(postDto);
            await _rateWriteRepository.AddAsync(rate);
            await _rateWriteRepository.SaveAsync();
        }

        public async Task<RateGetDto> Get(int id)
        {
            Rate rate = await _rateReadRepository.GetAsync(x=>!x.IsDeleted&&x.Id==id,false,false);
            if (rate == null)
                throw new ItemNotFound("Rate Not Found");

           return _mapper.Map<RateGetDto>(rate);
        }

        public async Task<IEnumerable<RateGetDto>> GetAll()
        {
            var query =await _rateReadRepository.GetAllAsync(x=>!x.IsDeleted,false,false);

            IEnumerable<RateGetDto> getDtos = new HashSet<RateGetDto>();

            getDtos = query.Select(x=>new RateGetDto { From=x.From,To=x.To,Price=x.Price,Id=x.Id,}).ToHashSet<RateGetDto>();
            return getDtos;
        }

        public async Task Remove(int id)
        {
            Rate rate = await _rateReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id,true,false);
            if (rate == null)
                throw new ItemNotFound("Rate Not Found");

            rate.IsDeleted = true;
            await _rateWriteRepository.UpdateAsync(rate);
            await _rateWriteRepository.SaveAsync();
        }

        public async Task Update(int id, RatePostDto postDto)
        {
            Rate rate = await _rateReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id, true, false);
            if (rate == null)
                throw new ItemNotFound("Rate Not Found");

            rate.From = postDto.From;
            rate.To = postDto.To;
            rate.Price = postDto.Price;
            await _rateWriteRepository.UpdateAsync(rate);
            await _rateWriteRepository.SaveAsync();
        }
    }
}

