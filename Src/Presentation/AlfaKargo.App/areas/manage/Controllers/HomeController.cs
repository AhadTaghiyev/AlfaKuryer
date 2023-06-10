using Microsoft.AspNetCore.Authorization;
using System.Data;
using Microsoft.AspNetCore.Mvc;

namespace AlfaKargo.App.areas.manage.Controllers
{
    [Area("manage")]
    [Authorize(Roles = "Admin,SuperAdmin,Cassir")]
    public class HomeController : Controller
    {
        public async Task<IActionResult> Index()
        {
            return View();
        }
    }
}