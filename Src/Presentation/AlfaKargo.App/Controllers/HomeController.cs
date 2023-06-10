using AlfaKargo.App.Models;
using AlfaKargo.App.ViewModels;
using AlfaKuryer.Application.Services.HelpServices;
using AlfaKuryer.Application.Services.RateServices;
using AlfaKuryer.Application.Services.SlideService;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace AlfaKargo.App.Controllers
{
    public class HomeController : Controller
    {
        private readonly IHelpService _helpService;
        private readonly IRateService _rateService;
        private readonly ISlideService _slideService;

        public HomeController(IHelpService helpService, IRateService rateService, ISlideService slideService)
        {
            _helpService = helpService;
            _rateService = rateService;
            _slideService = slideService;
        }

       
    
        public async Task<IActionResult> Index()
        {
            HomeViewModel homeViewModel = new HomeViewModel
            {
                helpGetDtos = await _helpService.GetAll(),
                rateGetDtos = await _rateService.GetAll(),
                slideGetDtos = await _slideService.GetAll()
            };
            return View(homeViewModel);
        }
        public IActionResult ChangeLanguage(string culture)
        {
            Response.Cookies.Append(CookieRequestCultureProvider.DefaultCookieName,
                CookieRequestCultureProvider.MakeCookieValue(new RequestCulture(culture)),
                new CookieOptions() { Expires = DateTimeOffset.UtcNow.AddYears(1) });

            return Redirect(Request.Headers["Referer"].ToString());
        }
        public IActionResult ChangeLanguageJson(string culture)
        {
            Response.Cookies.Append(CookieRequestCultureProvider.DefaultCookieName,
                CookieRequestCultureProvider.MakeCookieValue(new RequestCulture(culture)),
                new CookieOptions() { Expires = DateTimeOffset.UtcNow.AddYears(1) });

            return Json("ok");
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

     
    }
}