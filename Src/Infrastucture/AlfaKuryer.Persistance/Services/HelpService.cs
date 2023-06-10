using System;
using System.Linq;
using System.Reflection.Metadata;
using AlfaKuryer.Application.Dtos.HelpDtos;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Services.HelpServices;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Domain.Entities.Base;
using AlfaKuryer.Persistance.CustomExceptions;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Localization;
using Microsoft.EntityFrameworkCore;

namespace AlfaKuryer.Persistance.Services
{
	public class HelpService:IHelpService
	{
        private readonly IHelpReadRepository _read;
        private readonly IHelpWriteRepository _write;
        private readonly IMapper _mapper;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public HelpService(IHelpReadRepository read, IHelpWriteRepository write, IMapper mapper, IHttpContextAccessor httpContextAccessor)
        {
            _read = read;
            _write = write;
            _mapper = mapper;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task Create(HelpPostDto postDto)
        {
            Help help = new();
            help.HelpLanguages = new();
            help.HelpLanguages.Add(new HelpLanguage
            {
                Title = postDto.TitleAz,
                Description = postDto.DescriptionAz,
                Code = "az-AZ"
            });
            help.HelpLanguages.Add(new HelpLanguage
            {
                Title = postDto.TitleEn,
                Description = postDto.DescriptionEn,
                Code = "en-US"
            });
            help.HelpLanguages.Add(new HelpLanguage
            {
                Title = postDto.TitleRu,
                Description = postDto.DescriptionRu,
                Code = "ru-RU"
            });

            await _write.AddAsync(help);
            await _write.SaveAsync();
        }

        public async Task<HelpGetDto> Get(int id)
        {
            var currentCulture = _httpContextAccessor.HttpContext?.Features.Get<IRequestCultureFeature>()?.RequestCulture.Culture;

            var query = _read.GetQuery(x=>!x.IsDeleted&&x.Id==id,false,true, "HelpLanguages");
            Help help = await query.FirstOrDefaultAsync();

            if (help == null)
                throw new ItemNotFound("Help not found");

            HelpGetDto helpGetDto = new HelpGetDto
            {
                Id = help.Id,
                Title = help.HelpLanguages.FirstOrDefault(x=>x.Code==currentCulture.Name).Title,
                Description = help.HelpLanguages.FirstOrDefault(x=>x.Code==currentCulture.Name).Description
            };
            return helpGetDto;
        }

        public async Task<IEnumerable<HelpGetDto>> GetAll()
        {
            var currentCulture = _httpContextAccessor.HttpContext?.Features.Get<IRequestCultureFeature>()?.RequestCulture.Culture;

            var query = _read.GetQuery(x => !x.IsDeleted&&x.HelpLanguages.Any(x=>x.Code==currentCulture.Name), false, true, "HelpLanguages");

            IEnumerable<Help> helps =await query.ToListAsync();

            
           

            IEnumerable<HelpGetDto> helpGetDtos = helps.Select(x => new HelpGetDto
            {
                Id=x.Id,
                Title = x.HelpLanguages.FirstOrDefault(x => x.Code == currentCulture.Name).Title,
                Description = x.HelpLanguages.FirstOrDefault(x => x.Code == currentCulture.Name).Description
            });

            return helpGetDtos;
        }

        public async  Task<HelpGetManageDto> GetManage(int id)
        {
          

            Help help =await  _read.GetQuery(x => !x.IsDeleted && x.Id == id, false, true, "HelpLanguages").FirstOrDefaultAsync();
          

            if (help == null)
                throw new ItemNotFound("Help not found");

            HelpGetManageDto helpGetManageDto = new HelpGetManageDto();

            helpGetManageDto.DescriptionAz = help.HelpLanguages?.FirstOrDefault(x => x.Code == "az-AZ")?.Description;
            helpGetManageDto.DescriptionEn = help.HelpLanguages?.FirstOrDefault(x => x.Code == "en-US")?.Description;
            helpGetManageDto.DescriptionRu = help.HelpLanguages?.FirstOrDefault(x => x.Code == "ru-RU")?.Description;
            helpGetManageDto.TitleAz = help.HelpLanguages?.FirstOrDefault(x => x.Code == "az-AZ")?.Title;
            helpGetManageDto.TitleEn = help.HelpLanguages?.FirstOrDefault(x => x.Code == "en-Us")?.Title;
            helpGetManageDto.TitleRu = help.HelpLanguages?.FirstOrDefault(x => x.Code == "ru-RU")?.Title;
            
            return helpGetManageDto;
        }

        public async Task Remove(int id)
        {
            Help help = await _read.GetQuery(x => !x.IsDeleted && x.Id == id, true, true).FirstOrDefaultAsync();


            if (help == null)
                throw new ItemNotFound("Help not found");

            help.IsDeleted = true;
            await _write.UpdateAsync(help);
            await _write.SaveAsync();

        }

        public async Task Update(int id, HelpPostDto postDto)
        {
            Help help = await _read.GetQuery(x => !x.IsDeleted && x.Id == id, true, true, "HelpLanguages").FirstOrDefaultAsync();


            if (help == null)
                throw new ItemNotFound("Help not found");

            help.HelpLanguages.FirstOrDefault(x => x.Code == "az-AZ").Description = postDto.DescriptionAz;
            help.HelpLanguages.FirstOrDefault(x => x.Code == "ru-RU").Description = postDto.DescriptionRu;
            help.HelpLanguages.FirstOrDefault(x => x.Code == "en-US").Description = postDto.DescriptionEn;
            help.HelpLanguages.FirstOrDefault(x => x.Code == "az-AZ").Title = postDto.TitleAz;
            help.HelpLanguages.FirstOrDefault(x => x.Code == "ru-RU").Title = postDto.TitleRu;
            help.HelpLanguages.FirstOrDefault(x => x.Code == "en-US").Title = postDto.TitleEn;

            await _write.UpdateAsync(help);
            await _write.SaveAsync();
        }
    }
}

