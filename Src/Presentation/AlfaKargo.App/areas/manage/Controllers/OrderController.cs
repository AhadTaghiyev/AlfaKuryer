using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using AlfaKuryer.Application.Dtos.OrderDtos;
using AlfaKuryer.Application.Services.CityServices;
using AlfaKuryer.Application.Services.DistrictServices;
using AlfaKuryer.Application.Services.OrderServices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AlfaKargo.App.areas.manage.Controllers
{
    [Area("manage")]
    public class OrderController : Controller
    {
        private readonly IOrderService _serice;
        private readonly ICityService _cityService;
        private readonly IDistrictService _districtService;
        public OrderController(IOrderService serice, ICityService cityService, IDistrictService districtService)
        {
            _serice = serice;
            _cityService = cityService;
            _districtService = districtService;
        }
        [Authorize(Roles = "Admin,SuperAdmin,Cassir")]
        public async Task<IActionResult> Index()
        {
            return View(await _serice.GetAll());
        }
        [Authorize(Roles = "Admin,SuperAdmin,Cassir")]
        public async Task<IActionResult> Storage()
        {
            return View(await _serice.GetInStorage());
        }
        [Authorize(Roles = "Cassir")]
        public async Task<IActionResult> Create()
        {
            ViewBag.Cities = await _cityService.GetAll();
            ViewBag.Districts = await _districtService.GetAll();
            return View();
        }
        [HttpPost]
        [Authorize(Roles = "Cassir")]
        public async Task<IActionResult> Create(OrderPostDtoStorage dto)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Cities = await _cityService.GetAll();
                ViewBag.Districts = await _districtService.GetAll();
                return View(dto);
            }
           var result= await _serice.CreateOrderInStorage(dto);
            return RedirectToAction(nameof(Storage));
        }
        [Authorize(Roles = "Admin,SuperAdmin,Cassir")]
        public async Task<IActionResult> OutStorage(int id)
        {
            await _serice.OutStorage(id);
            return RedirectToAction(nameof(Storage));
        }

        [Authorize(Roles = "Admin,SuperAdmin,Cassir")]
        public async Task<IActionResult> Detail(int id)
        {
            return View(await _serice.GetOrderById(id));
        }
        [Authorize(Roles = "Admin,SuperAdmin,Cassir")]
        public async Task<IActionResult> CopmanyOrders(string UserId)
        {
            return View(await _serice.GetAllByCompany());
        }
    }
}

