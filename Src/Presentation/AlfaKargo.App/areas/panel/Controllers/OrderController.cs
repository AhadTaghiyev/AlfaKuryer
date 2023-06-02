using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AlfaKuryer.Application.Dtos.OrderDtos;
using AlfaKuryer.Application.Services.CityServices;
using AlfaKuryer.Application.Services.DistrictServices;
using AlfaKuryer.Application.Services.OrderServices;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AlfaKargo.App.areas.panel.Controllers
{
    [Area("panel")]
    public class OrderController : Controller
    {
        private readonly IOrderService _orderService;
        private readonly ICityService _cityService;
        private readonly IDistrictService _districtService;

        public OrderController(IOrderService orderService, ICityService cityService, IDistrictService districtService)
        {
            _orderService = orderService;
            _cityService = cityService;
            _districtService = districtService;
        }

        public async Task<IActionResult> Index()
        {
            
            return View(await _orderService.GetAllByCustomer());
        }

        public async Task<IActionResult> Create()
        {
            ViewBag.Cities = await _cityService.GetAll();
            ViewBag.Districts = await _districtService.GetAll();
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(OrderPostDto dto)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Cities = await _cityService.GetAll();
                ViewBag.Districts = await _districtService.GetAll();
                return View();
            }
            await _orderService.CreateOrder(dto);
            return RedirectToAction("index","home");
        }
    }
}

