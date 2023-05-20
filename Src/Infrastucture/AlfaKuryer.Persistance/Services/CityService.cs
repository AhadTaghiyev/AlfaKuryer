using System;
using AlfaKuryer.Application.Dtos.CItyDtos;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Application.Services.CityServices;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.CustomExceptions;
using AutoMapper;

namespace AlfaKuryer.Persistance.Services
{
    public class CityService : ICityService
    {
        private readonly ICityReadRepository _CityReadRepository;
        private readonly ICityWriteRepository _CityWriteRepository;
        private readonly IMapper _mapper;

        public CityService(ICityReadRepository CityReadRepository, ICityWriteRepository CityWriteRepository, IMapper mapper)
        {
            _CityReadRepository = CityReadRepository;
            _CityWriteRepository = CityWriteRepository;
            _mapper = mapper;
        }

        public async Task Create(CityPostDto postDto)
        {
            City City = _mapper.Map<City>(postDto);
            await _CityWriteRepository.AddAsync(City);
            await _CityWriteRepository.SaveAsync();
        }

        public async Task<CityGetDto> Get(int id)
        {
            City City = await _CityReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id, false, false);
            if (City == null)
                throw new ItemNotFound("City Not Found");

            return _mapper.Map<CityGetDto>(City);
        }

        public async Task<IEnumerable<CityGetDto>> GetAll()
        {
            var query = await _CityReadRepository.GetAllAsync(x => !x.IsDeleted, false, false);

            IEnumerable<CityGetDto> getDtos = new HashSet<CityGetDto>();

            getDtos = query.Select(x => new CityGetDto { Name = x.Name,Id=x.Id }).ToHashSet<CityGetDto>();
            return getDtos;
        }

        public async Task Remove(int id)
        {
            City City = await _CityReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id, true, false);
            if (City == null)
                throw new ItemNotFound("City Not Found");

            City.IsDeleted = true;
            await _CityWriteRepository.UpdateAsync(City);
            await _CityWriteRepository.SaveAsync();
        }

        public async Task Update(int id, CityPostDto postDto)
        {
            City City = await _CityReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id, true, false);
            if (City == null)
                throw new ItemNotFound("City Not Found");

            City.Name = postDto.Name;
            await _CityWriteRepository.UpdateAsync(City);
            await _CityWriteRepository.SaveAsync();
        }
    }

}