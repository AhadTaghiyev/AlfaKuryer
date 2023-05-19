using Microsoft.AspNetCore.Mvc;

namespace AlfaKargo.App.Controllers
{
    public class NewsController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
