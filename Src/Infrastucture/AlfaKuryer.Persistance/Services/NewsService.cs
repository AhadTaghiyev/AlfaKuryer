using System;
using System.Linq;
using System.Reflection.Metadata;
using AlfaKuryer.Application.Dtos.NewsDtos;
using AlfaKuryer.Application.Dtos.SettingDtos;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Application.Services.NewsServices;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Domain.Entities.Base;
using AlfaKuryer.Persistance.CustomExceptions;
using AlfaKuryer.Persistance.Helper;
using AutoMapper;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Localization;
using Microsoft.EntityFrameworkCore;

namespace AlfaKuryer.Persistance.Services
{
	public class NewsService:INewsService
	{
        private readonly INewsReadRepository _read;
        private readonly INewsWriteRepository _write;
        private readonly IMapper _mapper;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IWebHostEnvironment _env;

        public NewsService(INewsReadRepository read, INewsWriteRepository write, IMapper mapper, IHttpContextAccessor httpContextAccessor, IWebHostEnvironment env)
        {
            _read = read;
            _write = write;
            _mapper = mapper;
            _httpContextAccessor = httpContextAccessor;
            _env = env;
        }

        public async Task Create(NewsPostDto postDto)
        {
            News News = new();
            if (postDto.FormFile != null)
            {
                News.Image= postDto.FormFile.SaveImage(_env.WebRootPath, "assets/imgs/news/");
            }
            News.NewsLanguages = new();

            News.NewsLanguages.Add(new NewsLanguage
            {
                Title = postDto.TitleAz,
                Description = postDto.DescriptionAz,
                Code = "az-AZ"
            });
            News.NewsLanguages.Add(new NewsLanguage
            {
                Title = postDto.TitleEn,
                Description = postDto.DescriptionEn,
                Code = "en-US"
            });
            News.NewsLanguages.Add(new NewsLanguage
            {
                Title = postDto.TitleRu,
                Description = postDto.DescriptionRu,
                Code = "ru-RU"
            });

            await _write.AddAsync(News);
            await _write.SaveAsync();
        }

        public async Task<NewsGetDto> Get(int id)
        {
            var currentCulture = _httpContextAccessor.HttpContext?.Features.Get<IRequestCultureFeature>()?.RequestCulture.Culture;

            var query = _read.GetQuery(x=>!x.IsDeleted&&x.Id==id,false,true, "NewsLanguages");
            News News = await query.FirstOrDefaultAsync();

            if (News == null)
                throw new ItemNotFound("News not found");

            NewsGetDto NewsGetDto = new NewsGetDto
            {
                Id = News.Id,
                Image=News.Image,
                Title = News.NewsLanguages.FirstOrDefault(x=>x.Code==currentCulture.Name).Title,
                Description = News.NewsLanguages.FirstOrDefault(x=>x.Code==currentCulture.Name).Description,
                CreatedAt=News.CreatedAt
            };
            
            return NewsGetDto;
        }

        public async Task<IEnumerable<NewsGetDto>> GetAll()
        {
            var currentCulture = _httpContextAccessor.HttpContext?.Features.Get<IRequestCultureFeature>()?.RequestCulture.Culture;

            var query = _read.GetQuery(x => !x.IsDeleted&&x.NewsLanguages.Any(x=>x.Code==currentCulture.Name), false, true, "NewsLanguages");

            IEnumerable<News> Newss =await query.ToListAsync();

            
           

            IEnumerable<NewsGetDto> NewsGetDtos = Newss.Select(x => new NewsGetDto
            {
                Id=x.Id,
                Image=x.Image,
                Title = x.NewsLanguages.FirstOrDefault(x => x.Code == currentCulture.Name)?.Title,
                Description = x.NewsLanguages.FirstOrDefault(x => x.Code == currentCulture.Name)?.Description,
                CreatedAt = x.CreatedAt
            });

            return NewsGetDtos;
        }

        public async  Task<NewsGetManageDto> GetManage(int id)
        {
          

            News News =await  _read.GetQuery(x => !x.IsDeleted && x.Id == id, false, true, "NewsLanguages").FirstOrDefaultAsync();
     

            if (News == null)
                throw new ItemNotFound("News not found");

            NewsGetManageDto NewsGetManageDto = new NewsGetManageDto();


            NewsGetManageDto.DescriptionAz = News.NewsLanguages.FirstOrDefault(x => x.Code == "az-AZ")?.Description;
            NewsGetManageDto.DescriptionEn = News.NewsLanguages.FirstOrDefault(x => x.Code == "en-US")?.Description;
            NewsGetManageDto.DescriptionRu = News.NewsLanguages.FirstOrDefault(x => x.Code == "ru-RU")?.Description;
            NewsGetManageDto.TitleAz = News.NewsLanguages.FirstOrDefault(x => x.Code == "az-AZ")?.Title;
            NewsGetManageDto.TitleEn = News.NewsLanguages.FirstOrDefault(x => x.Code == "en-Us")?.Title;
            NewsGetManageDto.TitleRu = News.NewsLanguages.FirstOrDefault(x => x.Code == "ru-RU")?.Title;
            NewsGetManageDto.Image = News.Image;
            
            return NewsGetManageDto;
        }

        public async Task Remove(int id)
        {
            News News = await _read.GetQuery(x => !x.IsDeleted && x.Id == id, true, true).FirstOrDefaultAsync();


            if (News == null)
                throw new ItemNotFound("News not found");

            News.IsDeleted = true;
            await _write.UpdateAsync(News);
            await _write.SaveAsync();

        }

        public async Task Update(int id, NewsPostDto postDto)
        {
            News News = await _read.GetQuery(x => !x.IsDeleted && x.Id == id, true, true, "NewsLanguages").FirstOrDefaultAsync();


            if (News == null)
                throw new ItemNotFound("News not found");

            News.NewsLanguages.FirstOrDefault(x => x.Code == "az-AZ").Description = postDto.DescriptionAz;
            News.NewsLanguages.FirstOrDefault(x => x.Code == "ru-RU").Description = postDto.DescriptionRu;
            News.NewsLanguages.FirstOrDefault(x => x.Code == "en-US").Description = postDto.DescriptionEn;
            News.NewsLanguages.FirstOrDefault(x => x.Code == "az-AZ").Title = postDto.TitleAz;
            News.NewsLanguages.FirstOrDefault(x => x.Code == "ru-RU").Title = postDto.TitleRu;
            News.NewsLanguages.FirstOrDefault(x => x.Code == "en-US").Title = postDto.TitleEn;

            if (postDto.FormFile != null)
            {
                News.Image = postDto.FormFile.SaveImage(_env.WebRootPath, "assets/imgs/news/");
            }

            await _write.UpdateAsync(News);
            await _write.SaveAsync();
        }
    }
}

