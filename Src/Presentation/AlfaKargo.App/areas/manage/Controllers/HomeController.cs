using Microsoft.AspNetCore.Mvc;

namespace AlfaKargo.App.areas.manage.Controllers
{
    [Area("manage")]
    public class HomeController : Controller
    {
        public async Task<IActionResult> Index()
        {
            return View();
        }
    }
}