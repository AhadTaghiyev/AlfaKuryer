using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AlfaKuryer.Application.Dtos.IdentityDtos;
using AlfaKuryer.Application.Services.CityServices;
using AlfaKuryer.Application.Services.DistrictServices;
using AlfaKuryer.Application.Services.IdentityServices;
using AlfaKuryer.Persistance.Services;
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
        public async Task<IActionResult> Role()
        {
            await _roleManager.CreateAsync(new IdentityRole { Name="Admin"});
            await _roleManager.CreateAsync(new IdentityRole { Name="SuperAdmin"});
            await _roleManager.CreateAsync(new IdentityRole { Name="Company"});
            await _roleManager.CreateAsync(new IdentityRole { Name="Courier"});
            await _roleManager.CreateAsync(new IdentityRole { Name="User"});
        
            return Json("ok");
        }
    
        public async Task<IActionResult> Admins()
        {
            return View(await _identity.GetUsers(x => x.Role == "Admin" || x.Role == "SuperAdmin" && x.Status == true));
        }
        public async Task<IActionResult> Couriers()
        {
            return View(await _identity.GetUsers(x => x.Role == "Courier" && x.Status == true));
        }
        public async Task<IActionResult> Companies()
        {
            return View(await _identity.GetUsers(x => x.Role == "Company" && x.Status == true));
        }
        public async Task<IActionResult> Users()
        {
            return View(await _identity.GetUsers(x => x.Role == "User" && x.Status == true));
        }
        public async Task<IActionResult> CreateAdmin()
        {
            ViewBag.Roles = _roleManager.Roles.Where(x=>x.Name=="Admin"||x.Name=="SuperAdmin").ToList();
            return View();
        }
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
        public async Task<IActionResult> CreateCourier()
        {
            ViewBag.Cities = await _cityservice.GetAll();
            ViewBag.Districts = await _districtservice.GetAll();
            return View();
        }
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



        public async Task<IActionResult> DeleteConfirmed(string UserId)
        {
            await _identity.ChangeStatus(UserId);
            return Redirect(Request.Headers["Referer"].ToString());
        }
        public async Task<IActionResult> CourierUpdate()
        {
            ViewBag.Cities = await _cityservice.GetAll();
            ViewBag.Districts = await _districtservice.GetAll();
            return View();
        }

        public async Task<IActionResult> SendMessage()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> SendMessage(SendMailToUsers sendMailTo)
        {
            await _identity.SendMessageToAllUsers(sendMailTo);
            return RedirectToAction("index","home");
        }
    }
}

