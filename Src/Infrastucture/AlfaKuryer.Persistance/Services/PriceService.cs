using System;
using AlfaKuryer.Application.Dtos.PriceDtos;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Application.Services.PriceService;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.CustomExceptions;
using AutoMapper;

namespace AlfaKuryer.Persistance.Services
{
    public class PriceService : IPriceService
    {
        private readonly IPriceReadRepository _PriceReadRepository;
        private readonly IPriceWriteRepository _PriceWriteRepository;
        private readonly IMapper _mapper;

        public PriceService(IPriceReadRepository PriceReadRepository, IPriceWriteRepository PriceWriteRepository, IMapper mapper)
        {
            _PriceReadRepository = PriceReadRepository;
            _PriceWriteRepository = PriceWriteRepository;
            _mapper = mapper;
        }
        public async Task<PriceGetDto> Get(int id)
        {
            PriceForOrder Price = await _PriceReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id, false, false);
            if (Price == null)
                throw new ItemNotFound("Price Not Found");

            return _mapper.Map<PriceGetDto>(Price);
        }

        public async Task<IEnumerable<PriceGetDto>> GetAll()
        {
            var query = await _PriceReadRepository.GetAllAsync(x => !x.IsDeleted, false, false);

            IEnumerable<PriceGetDto> getDtos = new HashSet<PriceGetDto>();

            getDtos = query.Select(x => new PriceGetDto { Price = x.Price,Id=x.Id,Kq=x.Kq,Location=x.Location,MinPrice=x.MinPrice,UntilKq=x.UntilKq,IsFast=x.IsFast }).ToHashSet<PriceGetDto>();
            return getDtos;
        }

        public async Task Remove(int id)
        {
            PriceForOrder Price = await _PriceReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id, true, false);
            if (Price == null)
                throw new ItemNotFound("Price Not Found");

            Price.IsDeleted = true;
            await _PriceWriteRepository.UpdateAsync(Price);
            await _PriceWriteRepository.SaveAsync();
        }

        public async Task Update(int id,PricePostDto postDto)
        {
            PriceForOrder Price = await _PriceReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id, true, false);
            if (Price == null)
            {
                throw new ItemNotFound("Price Not Found");
         
            }
           

            Price.Price = postDto.Price;
            Price.Kq = postDto.Kq;
            Price.UntilKq = postDto.UntilKq;
            Price.MinPrice = postDto.MinPrice;
           
            await _PriceWriteRepository.UpdateAsync(Price);
            await _PriceWriteRepository.SaveAsync();
        }

    }

}