using System;
using AlfaKuryer.Application.Services.MessageService;
using Microsoft.AspNetCore.Mvc;

namespace AlfaKargo.App.areas.manage.Controllers
{
    [Area("manage")]
	public class MessageController: Controller
    {
		private readonly IMessageService _service;

        public MessageController(IMessageService service)
        {
            _service = service;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _service.GetAll());
        }
    }
}

