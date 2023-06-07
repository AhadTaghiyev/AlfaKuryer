using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AlfaKuryer.Application.Services.OrderServices;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AlfaKargo.App.areas.manage.Controllers
{
    [Area("manage")]
    public class OrderController : Controller
    {
        private readonly IOrderService _serice;

        public OrderController(IOrderService serice)
        {
            _serice = serice;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _serice.GetAll());
        }

        public async Task<IActionResult> Storage()
        {
            return View(await _serice.GetInStorage());
        }

        public async Task<IActionResult> OutStorage(int id)
        {
            await _serice.OutStorage(id);
            return RedirectToAction(nameof(Storage));
        }
        

        public async Task<IActionResult> Detail(int id)
        {
            return View(await _serice.GetOrderById(id));
        }
    }
}

