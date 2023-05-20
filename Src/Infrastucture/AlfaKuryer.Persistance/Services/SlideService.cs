using System;
using AlfaKuryer.Application.Dtos.SlideDtos;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Application.Services.SlideService;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.CustomExceptions;
using AlfaKuryer.Persistance.Helper;
using AutoMapper;
using Microsoft.AspNetCore.Hosting;

namespace AlfaKuryer.Persistance.Services
{
    public class SlideService : ISlideService
    {
        private readonly ISlideReadRepository _SlideReadRepository;
        private readonly ISlideWriteRepository _SlideWriteRepository;
        private readonly IMapper _mapper;
        private readonly IWebHostEnvironment _env;

        public SlideService(ISlideReadRepository SlideReadRepository, ISlideWriteRepository SlideWriteRepository, IMapper mapper, IWebHostEnvironment env)
        {
            _SlideReadRepository = SlideReadRepository;
            _SlideWriteRepository = SlideWriteRepository;
            _mapper = mapper;
            _env = env;
        }

        public async Task Create(SlidePostDto postDto)
        {
            Slide Slide = new Slide();
            if (postDto.formFIle != null)
            {
                Slide.Logo = postDto.formFIle.SaveImage(_env.WebRootPath, "assets/imgs/Logo/");
            await _SlideWriteRepository.AddAsync(Slide);
            await _SlideWriteRepository.SaveAsync();
            }
        }

        public async Task<SlideGetDto> Get(int id)
        {
            Slide Slide = await _SlideReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id, false, false);
            if (Slide == null)
                throw new ItemNotFound("Slide Not Found");

            return _mapper.Map<SlideGetDto>(Slide);
        }

        public async Task<IEnumerable<SlideGetDto>> GetAll()
        {
            var query = await _SlideReadRepository.GetAllAsync(x => !x.IsDeleted, false, false);

            IEnumerable<SlideGetDto> getDtos = new HashSet<SlideGetDto>();

            getDtos = query.Select(x => new SlideGetDto { Logo=x.Logo,Id=x.Id }).ToHashSet<SlideGetDto>();
            return getDtos;
        }

        public async Task Remove(int id)
        {
            Slide Slide = await _SlideReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id, true, false);
            if (Slide == null)
                throw new ItemNotFound("Slide Not Found");

            Slide.IsDeleted = true;
            await _SlideWriteRepository.UpdateAsync(Slide);
            await _SlideWriteRepository.SaveAsync();
        }

        public async Task Update(int id, SlidePostDto postDto)
        {
            Slide Slide = await _SlideReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id, true, false);
            if (Slide == null)
                throw new ItemNotFound("Slide Not Found");

            if (postDto.formFIle != null)
            {
                Slide.Logo = postDto.formFIle.SaveImage(_env.WebRootPath, "assest/imgs/stores");
                await _SlideWriteRepository.UpdateAsync(Slide);
                await _SlideWriteRepository.SaveAsync();
            }
        }
    }
}

