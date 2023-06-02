using System;
using AlfaKuryer.Application.Dtos.DistrictDtos;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Application.Services.DistrictServices;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.CustomExceptions;
using AutoMapper;

namespace AlfaKuryer.Persistance.Services
{
    public class DistrictService : IDistrictService
    {
        private readonly IDistrictReadRepository _DistrictReadRepository;
        private readonly IDistrictWriteRepository _DistrictWriteRepository;
        private readonly IMapper _mapper;

        public DistrictService(IDistrictReadRepository DistrictReadRepository, IDistrictWriteRepository DistrictWriteRepository, IMapper mapper)
        {
            _DistrictReadRepository = DistrictReadRepository;
            _DistrictWriteRepository = DistrictWriteRepository;
            _mapper = mapper;
        }

        public async Task Create(DistrictPostDto postDto)
        {
            District District = _mapper.Map<District>(postDto);
            await _DistrictWriteRepository.AddAsync(District);
            await _DistrictWriteRepository.SaveAsync();
        }

        public async Task<DistrictGetDto> Get(int id)
        {
            District District = await _DistrictReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id, false, true);
            if (District == null)
                throw new ItemNotFound("District Not Found");

            return _mapper.Map<DistrictGetDto>(District);
        }

        public async Task<IEnumerable<DistrictGetDto>> GetAll()
        {
            var query = await _DistrictReadRepository.GetAllAsync(x => !x.IsDeleted, false, true);

            IEnumerable<DistrictGetDto> getDtos = new HashSet<DistrictGetDto>();

            getDtos = query.Select(x => new DistrictGetDto { Name = x.Name, CityId=x.CityId, Id =x.Id}).ToHashSet<DistrictGetDto>();
            return getDtos;
        }

        public async Task Remove(int id)
        {
            District District = await _DistrictReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id, true, true);
         
            if (District == null)
                throw new ItemNotFound("District Not Found");

            District.IsDeleted = true;
            await _DistrictWriteRepository.UpdateAsync(District);
            await _DistrictWriteRepository.SaveAsync();
        }

        public async Task Update(int id, DistrictPostDto postDto)
        {
            District District = await _DistrictReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id, true, true);
            if (District == null)
                throw new ItemNotFound("District Not Found");

            District.Name = postDto.Name;
            District.CityId = postDto.CityId;

            await _DistrictWriteRepository.UpdateAsync(District);
            await _DistrictWriteRepository.SaveAsync();
        }
    }
}

