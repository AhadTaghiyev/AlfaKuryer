using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AlfaKargo.App.areas.ViewModels;
using AlfaKuryer.Application.Dtos.SlideDtos;
using AlfaKuryer.Application.Services.CityServices;
using AlfaKuryer.Application.Services.DistrictServices;
using AlfaKuryer.Application.Services.SlideService;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AlfaKargo.App.areas.manage.Controllers
{
    [Area("manage")]
    public class SlideController : Controller
    {
        private readonly ISlideService _service;
        private readonly ICityService _cityService;
        private readonly IDistrictService _districtService;

        public SlideController(ISlideService service, ICityService cityService, IDistrictService districtService)
        {
            _service = service;
            _cityService = cityService;
            _districtService = districtService;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            return View(await _service.GetAll());
        }

        [HttpGet]
        public async Task<IActionResult> Create()
        {
            ViewBag.Cities = await _cityService.GetAll();
            ViewBag.Districts = await _districtService.GetAll();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(SlidePostDto postDto)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Cities = await _cityService.GetAll();
                ViewBag.Districts = await _districtService.GetAll();
                return View();
            }

            await _service.Create(postDto);
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Update(int id)
        {
            UpdateVewModel<SlidePostDto, SlideGetDto> vewModel = new();
            vewModel.GetDto = await _service.Get(id);
            ViewBag.Cities = await _cityService.GetAll();
            ViewBag.Districts = await _districtService.GetAll();
            return View(vewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, UpdateVewModel<SlidePostDto, SlideGetDto> vewModel)
        {
            if (!ModelState.IsValid)
            {
                vewModel.GetDto = await _service.Get(id);
                ViewBag.Cities = await _cityService.GetAll();
                ViewBag.Districts = await _districtService.GetAll();
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

