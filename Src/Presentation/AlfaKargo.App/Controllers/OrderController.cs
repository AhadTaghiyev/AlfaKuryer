using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AlfaKuryer.Application.Dtos.OrderDtos;
using AlfaKuryer.Application.Services.CityServices;
using AlfaKuryer.Application.Services.DistrictServices;
using AlfaKuryer.Application.Services.IdentityServices;
using AlfaKuryer.Application.Services.OrderServices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AlfaKargo.App.Controllers
{
    [Authorize(Roles ="Company,User")]
    public class OrderController : Controller
    {
        private readonly IOrderService _orderService;
        private readonly ICityService _cityService;
        private readonly IDistrictService _districtService;
        private readonly IIdentityService _identityService;

        public OrderController(IOrderService orderService, ICityService cityService, IDistrictService districtService, IIdentityService identityService)
        {
            _orderService = orderService;
            _cityService = cityService;
            _districtService = districtService;
            _identityService = identityService;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _orderService.GetAllByCustomer());
        }
        public async Task<IActionResult> PayConfirm(int id)
        {
            await _orderService.Payed(id);
            TempData["verify"] = "verify";
            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> Detail(int id)
        {
            return View(await _orderService.GetOrderById(id));
        }
        public async Task<IActionResult> History()
        {
            return View(await _orderService.GetAllByCustomerHistory());
        }

        public async Task<IActionResult> Track(int id)
        {
            return View(await _orderService.GetOrderById(id));
        }
        public async Task<IActionResult> CreateOrder()
        {
            ViewBag.Cities = await _cityService.GetAll();
            ViewBag.Districts = await _districtService.GetAll();
            ViewBag.Adresses = await _identityService.GetAdress();
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrder(OrderPostDto postDto)
        {

            if (postDto.IsFast && postDto.OrderFromCityId != postDto.OrderToCityId)
            {

                TempData["verify"] = "verify";
                ViewBag.Cities = await _cityService.GetAll();
                ViewBag.Districts = await _districtService.GetAll();
                ViewBag.Adresses = await _identityService.GetAdress();
                return View(postDto);
            }


            if (!ModelState.IsValid)
            {
                ViewBag.Cities = await _cityService.GetAll();
                ViewBag.Districts = await _districtService.GetAll();
                ViewBag.Adresses = await _identityService.GetAdress();
                var errors = ModelState["IsFast"].Errors;

                return View(postDto);
            }


            string result=await _orderService.CreateOrder(postDto);

            if (result.Contains("https"))
            {
                return Redirect(result);
            }


            if (!string.IsNullOrWhiteSpace(result))
            {
                string message = result == "PaymentError" ? "Ödəniş zamanı xəta baş verdi" : "Məlumatlar bölməsinə daxil olaraq qeydiyyatı tamamlayın";

                ViewBag.Cities = await _cityService.GetAll();
                ViewBag.Districts = await _districtService.GetAll();
                ViewBag.Adresses = await _identityService.GetAdress();
                ModelState.AddModelError("",result);
                return View(postDto);
            }

            TempData["verify"] = "verify";
            return RedirectToAction(nameof(Index));
        }
    }
}

