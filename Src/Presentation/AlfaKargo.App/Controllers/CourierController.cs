using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AlfaKuryer.Application.Services.OrderServices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AlfaKargo.App.Controllers
{
    [Authorize(Roles ="Courier")]
    public class CourierController : Controller
    {
        private readonly IOrderService _orderService;

        public CourierController(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _orderService.GetOrderAccepted());
        }

        public async Task<IActionResult> Accept()
        {
            return View(await _orderService.GetOrderForAccept());
        }
        public async Task<IActionResult> History()
        {
            return View(await _orderService.GetAllByCourierHistory());
        }
    
        public async Task<IActionResult> AcceptOrder(int id)
        {
            await _orderService.Accept(id);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> CurierOnRoadForTake(int id)
        {
            await _orderService.CurierOnRoadForTake(id);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> CourierArriveForTake(int id)
        {
            await _orderService.CourierArriveForTake(id);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> CourierTaked(int id)
        {
            await _orderService.CourierTaked(id);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> InStorage(int id)
        {
            await _orderService.InStorage(id);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> InForeignCity(int id)
        {
            await _orderService.AchiveForeignCity(id);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> OnRoad(int id)
        {
            await _orderService.OnRoad(id);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> CourierArrived(int id)
        {
            await _orderService.CourierArrived(id);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> Delivered(int id)
        {
            await _orderService.Delivered(id);
            return RedirectToAction(nameof(Index));
        }




    }
}

