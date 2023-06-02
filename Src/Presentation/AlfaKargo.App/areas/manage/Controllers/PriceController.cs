using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AlfaKargo.App.areas.ViewModels;
using AlfaKuryer.Application.Dtos.PriceDtos;
using AlfaKuryer.Application.Services.PriceService;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AlfaKargo.App.areas.manage.Controllers
{
    [Area("manage")]
    public class PriceController : Controller
    {
        private readonly IPriceService _service;

        public PriceController(IPriceService service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            return View(await _service.GetAll());
        }


        [HttpGet]
        public async Task<IActionResult> Update(int id)
        {
            UpdateVewModel<PricePostDto, PriceGetDto> vewModel = new();
            vewModel.GetDto = await _service.Get(id);
            return View(vewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, UpdateVewModel<PricePostDto, PriceGetDto> vewModel)
        {
            if (!ModelState.IsValid)
            {
                vewModel.GetDto = await _service.Get(id);
                return View(vewModel);
            }
            await _service.Update(id, vewModel.PostDto);
            return RedirectToAction(nameof(Index));
        }


    }

}

