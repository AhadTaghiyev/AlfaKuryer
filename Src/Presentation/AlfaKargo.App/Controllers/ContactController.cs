using AlfaKuryer.Application.Dtos.MessageDto;
using AlfaKuryer.Application.Services.MessageService;
using AlfaKuryer.Application.Services.SettingServices;
using AlfaKuryer.Persistance.Services;
using Microsoft.AspNetCore.Mvc;

namespace AlfaKargo.App.Controllers
{
    public class ContactController : Controller
    {
        private readonly ISettingService _settingService;
        private readonly IMessageService _messafeService;


        public ContactController(ISettingService settingService, IMessageService messafeService)
        {
            _settingService = settingService;
            _messafeService = messafeService;
        }

        public async Task<IActionResult> Index()
        {
            
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Send(MessagePostDto postDto)
        {
            if (string.IsNullOrEmpty(postDto.FullName)|| string.IsNullOrEmpty(postDto.PhoneNumber) || string.IsNullOrEmpty(postDto.Email) || string.IsNullOrEmpty(postDto.Subject) || string.IsNullOrEmpty(postDto.Content))
            {
                return Json("Xanaları düzgün doldurduqdan əmin olun");
            }

            await _messafeService.Create(postDto);

            return Json(new { status = 200 });
        }

        
    }
}
