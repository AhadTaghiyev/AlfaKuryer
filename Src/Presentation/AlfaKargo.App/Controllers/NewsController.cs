using AlfaKuryer.Application.Dtos.NewsDtos;
using AlfaKuryer.Application.Dtos.SettingDtos;
using AlfaKuryer.Application.Services.NewsServices;
using Microsoft.AspNetCore.Mvc;

namespace AlfaKargo.App.Controllers
{
    public class NewsController : Controller
    {
        private readonly INewsService _service;
        public NewsController(INewsService service)
        {
            _service = service;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _service.GetAll());
        }
 
        public async Task<IActionResult> Detail(string title ,int id)
        {
            NewsGetDto newsGetDto = await _service.Get(id);
           
            return View(newsGetDto);
        }
    }
}
