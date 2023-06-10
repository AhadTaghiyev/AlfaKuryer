using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using AlfaKargo.App.areas.ViewModels;
using AlfaKuryer.Application.Dtos.DistrictDtos;
using AlfaKuryer.Application.Services.CityServices;
using AlfaKuryer.Application.Services.DistrictServices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AlfaKargo.App.areas.manage.Controllers
{
    [Area("manage")]
    [Authorize(Roles = "Admin,SuperAdmin")]
    public class DistrictController : Controller
    {
        private readonly IDistrictService _service;
        private readonly ICityService _cityService;

        public DistrictController(IDistrictService service, ICityService cityService)
        {
            _service = service;
            _cityService = cityService;
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
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(DistrictPostDto postDto)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Cities = await _cityService.GetAll();
                return View();
            }

            await _service.Create(postDto);
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Update(int id)
        {
            UpdateVewModel<DistrictPostDto, DistrictGetDto> vewModel = new();
            vewModel.GetDto = await _service.Get(id);
            ViewBag.Cities = await _cityService.GetAll();
            return View(vewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, UpdateVewModel<DistrictPostDto, DistrictGetDto> vewModel)
        {
            if (!ModelState.IsValid)
            {
                vewModel.GetDto = await _service.Get(id);
                ViewBag.Cities = await _cityService.GetAll();
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

