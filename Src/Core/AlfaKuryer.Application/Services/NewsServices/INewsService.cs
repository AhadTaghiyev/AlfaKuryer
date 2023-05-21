
using AlfaKuryer.Application.Dtos.NewsDtos;

namespace AlfaKuryer.Application.Services.NewsServices
{
    public interface INewsService
    {
        public Task Create(NewsPostDto postDto);
        public Task Update(int id, NewsPostDto postDto);
        public Task Remove(int id);
        public Task<IEnumerable<NewsGetDto>> GetAll();
        public Task<NewsGetDto> Get(int id);
        public Task<NewsGetManageDto> GetManage(int id);
    }
}
