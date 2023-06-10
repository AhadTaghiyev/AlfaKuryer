using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using AlfaKargo.App.areas.ViewModels;
using AlfaKuryer.Application.Dtos.RateDtos;
using AlfaKuryer.Application.Services.CityServices;
using AlfaKuryer.Application.Services.DistrictServices;
using AlfaKuryer.Application.Services.RateServices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Org.BouncyCastle.Asn1.X509;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AlfaKargo.App.areas.manage.Controllers
{
    [Area("manage")]
    [Authorize(Roles = "Admin,SuperAdmin")]
    public class RateController : Controller
    {
        private readonly IRateService _service;
        private readonly ICityService _cityService;
        private readonly IDistrictService _districtService;

        public RateController(IRateService service, ICityService cityService, IDistrictService districtService)
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
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(RatePostDto postDto)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            await _service.Create(postDto);
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Update(int id)
        {
            UpdateVewModel<RatePostDto, RateGetDto> vewModel = new();
            vewModel.GetDto = await _service.Get(id);
            return View(vewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id,UpdateVewModel<RatePostDto, RateGetDto> vewModel)
        {
            if (!ModelState.IsValid)
            {
                vewModel.GetDto = await _service.Get(id);
                return View(vewModel);
            }
            await _service.Update(id,vewModel.PostDto);
            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            await _service.Remove(id);
            return RedirectToAction(nameof(Index));
        }

    }
}

