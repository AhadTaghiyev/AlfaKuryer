using Microsoft.AspNetCore.Mvc;

namespace AlfaKargo.App.Controllers
{
    public class AboutController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult Agreement()
        {
            return View();
        }
    }
}
