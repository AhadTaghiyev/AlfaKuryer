using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using AlfaKargo.App.areas.ViewModels;
using AlfaKuryer.Application.Dtos.IdentityDtos;
using AlfaKuryer.Application.Services.CityServices;
using AlfaKuryer.Application.Services.DistrictServices;
using AlfaKuryer.Application.Services.IdentityServices;
using AlfaKuryer.Persistance.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AlfaKargo.App.areas.manage.Controllers
{
    [Area("manage")]
    public class AccountController : Controller
    {
        private readonly IIdentityService _identity;
        private readonly ICityService _cityservice;
        private readonly IDistrictService _districtservice;
        private readonly RoleManager<IdentityRole> _roleManager;

        public AccountController(IIdentityService identity, ICityService cityservice, IDistrictService districtservice, RoleManager<IdentityRole> roleManager)
        {
            _identity = identity;
            _cityservice = cityservice;
            _districtservice = districtservice;
            _roleManager = roleManager;
        }
  
        public async Task<IActionResult> Login()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(LoginDto  login)
        {
            var result=await _identity.SigninAdmin(login);

            if (!string.IsNullOrWhiteSpace(result))
            {
                return View();
            }
            return RedirectToAction("Index","Home");
        }

        [Authorize(Roles = "Admin,SuperAdmin")]
        public async Task<IActionResult> Admins()
        {
            return View(await _identity.GetUsers(x => x.Role == "Admin" || x.Role == "SuperAdmin" && x.Status == true));
        }
        [Authorize(Roles = "Admin,SuperAdmin")]
        public async Task<IActionResult> Couriers()
        {
            return View(await _identity.GetUsers(x => x.Role == "Courier" && x.Status == true));
        }
        [Authorize(Roles = "Admin,SuperAdmin")]
        public async Task<IActionResult> Companies()
        {
            return View(await _identity.GetUsers(x => x.Role == "Company" && x.Status == true));
        }
        [Authorize(Roles = "Admin,SuperAdmin")]
        public async Task<IActionResult> Cassirs()
        {
            return View(await _identity.GetUsers(x => x.Role == "Cassir" && x.Status == true));
        }
        [Authorize(Roles = "Admin,SuperAdmin")]
        public async Task<IActionResult> Users()
        {
            return View(await _identity.GetUsers(x => x.Role == "User" && x.Status == true));
        }
        [Authorize(Roles = "Admin,SuperAdmin")]
        public async Task<IActionResult> CreateAdmin()
        {
            ViewBag.Roles = _roleManager.Roles.Where(x=>x.Name=="Admin"||x.Name=="SuperAdmin").ToList();
            return View();
        }
        [Authorize(Roles = "Admin,SuperAdmin")]
        [HttpPost]
        public async Task<IActionResult> CreateAdmin(RegisterDto dto)
        {

            if (!ModelState.IsValid) {
                ViewBag.Roles = _roleManager.Roles.Where(x => x.Name == "Admin" || x.Name == "SuperAdmin").ToList();
                return View(dto); }
            string result = await _identity.Register(dto);
            if (result.Length > 0)
            {
                ViewBag.Roles = _roleManager.Roles.Where(x => x.Name == "Admin" || x.Name == "SuperAdmin").ToList();
                ModelState.AddModelError("", result);
                return View(dto);
            }
            return Redirect(nameof(Admins));
        }
        [Authorize(Roles = "Admin,SuperAdmin")]
        public async Task<IActionResult> CreateCourier()
        {
            ViewBag.Cities = await _cityservice.GetAll();
            ViewBag.Districts = await _districtservice.GetAll();
            return View();
        }
        [Authorize(Roles = "Admin,SuperAdmin")]
        [HttpPost]
        public async Task<IActionResult> CreateCourier(RegisterDto dto)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Cities = await _cityservice.GetAll();
                ViewBag.Districts = await _districtservice.GetAll();
                return View(dto);
            };
            string result = await _identity.Register(dto);
            if (result.Length > 0)
            {
                ViewBag.Cities = await _cityservice.GetAll();
                ViewBag.Districts = await _districtservice.GetAll();
                ModelState.AddModelError("", result);
                return View(dto);
            }
            return Redirect(nameof(Couriers));
        }
        [Authorize(Roles = "Admin,SuperAdmin")]
        public async Task<IActionResult> CreateCassir()
        {
            ViewBag.Cities = await _cityservice.GetAll();
            ViewBag.Districts = await _districtservice.GetAll();
            return View();
        }
        [HttpPost]
        [Authorize(Roles = "Admin,SuperAdmin")]
        public async Task<IActionResult> CreateCassir(RegisterDto dto)
        {
            if (!ModelState.IsValid)
            {
                return View(dto);
            };
            string result = await _identity.Register(dto);
            if (result.Length > 0)
            {
                ModelState.AddModelError("", result);
                return View(dto);
            }
            return Redirect(nameof(Cassirs));
        }
        [Authorize(Roles = "Admin,SuperAdmin")]
        public async Task<IActionResult> DeleteConfirmed(string UserId)
        {
            await _identity.ChangeStatus(UserId);
            return Redirect(Request.Headers["Referer"].ToString());
        }
        [Authorize(Roles = "Admin,SuperAdmin")]
        public async Task<IActionResult> CourierUpdate()
        {
            ViewBag.Cities = await _cityservice.GetAll();
            ViewBag.Districts = await _districtservice.GetAll();
            return View();
        }
        [Authorize(Roles = "Admin,SuperAdmin")]
        public async Task<IActionResult> SendMessage()
        {
            return View();
        }
        [HttpPost]
        [Authorize(Roles = "Admin,SuperAdmin")]
        public async Task<IActionResult> SendMessage(SendMailToUsers sendMailTo)
        {
            await _identity.SendMessageToAllUsers(sendMailTo);
            return RedirectToAction("index","home");
        }
        [Authorize(Roles = "Admin,SuperAdmin")]

        public async Task<IActionResult> CourierSalary(string UserId)
        {
            return View(await _identity.GetSalaries(UserId));
        }
         [Authorize(Roles = "Admin,SuperAdmin")]
        public async Task<IActionResult> CassirBalance(string UserId)
        {
            return View(await _identity.GetCassirBalance(UserId));
        }
        

    }
}

