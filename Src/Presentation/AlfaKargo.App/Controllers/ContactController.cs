using Microsoft.AspNetCore.Mvc;

namespace AlfaKargo.App.Controllers
{
    public class ContactController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
