using AlfaKuryer.Application.Services.RateServices;
using Microsoft.AspNetCore.Mvc;

namespace AlfaKargo.App.Controllers
{
    public class RateController : Controller
    {
        private readonly IRateService _service;

        public RateController(IRateService service)
        {
            _service = service;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _service.GetAll());
        }
    }
}
