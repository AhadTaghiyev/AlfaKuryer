using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AlfaKargo.App.areas.ViewModels;
using AlfaKuryer.Application.Dtos.CItyDtos;
using AlfaKuryer.Application.Services.CityServices;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AlfaKargo.App.areas.manage.Controllers
{
    [Area("manage")]
    public class CityController : Controller
    {
        private readonly ICityService _service;

        public CityController(ICityService service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            return View(await _service.GetAll());
        }

        [HttpGet]
        public async Task<IActionResult> Create() => View();

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(CityPostDto postDto)
        {
            if (!ModelState.IsValid)
                return View();

            await _service.Create(postDto);
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Update(int id)
        {
            UpdateVewModel<CityPostDto, CityGetDto> vewModel = new();
            vewModel.GetDto = await _service.Get(id);
            return View(vewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, UpdateVewModel<CityPostDto, CityGetDto> vewModel)
        {
            if (!ModelState.IsValid)
            {
                vewModel.GetDto = await _service.Get(id);
                return View(vewModel);
            }
            await _service.Update(id, vewModel.PostDto);
            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            await _service.Remove(id);
            return RedirectToAction(nameof(Index));
        }

    }

}

