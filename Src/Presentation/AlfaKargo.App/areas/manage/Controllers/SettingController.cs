using System.Data;
using AlfaKargo.App.areas.ViewModels;
using AlfaKuryer.Application.Dtos.SettingDtos;
using AlfaKuryer.Application.Services.SettingServices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace AlfaKargo.App.Areas.manage.Controllers
{
    [Area("manage")]
    [Authorize(Roles = "Admin,SuperAdmin")]
    public class SettingController : Controller
    {
        private readonly ISettingService _settingService;

        public SettingController(ISettingService settingService)
        {
            _settingService = settingService;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _settingService.Get());
        }

        [HttpGet]
        public async Task<IActionResult> Update()
        {
            UpdateVewModel<SettingPostDto, SettingGetDto> updateVewModel = new();
            updateVewModel.GetDto = await _settingService.Get();
            return View(updateVewModel);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(UpdateVewModel<SettingPostDto, SettingGetDto> updateVewModel )
        {
            if (!ModelState.IsValid)
            {
                updateVewModel.GetDto = await _settingService.Get();
                return View(updateVewModel);
            }
            await _settingService.Update(updateVewModel.PostDto);
            return RedirectToAction(nameof(Index));
        }
    }
}