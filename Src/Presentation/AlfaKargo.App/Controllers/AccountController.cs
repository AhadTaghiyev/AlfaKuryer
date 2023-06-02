using AlfaKuryer.Application.Dtos.CustomerDtos;
using AlfaKuryer.Application.Dtos.IdentityDtos;
using AlfaKuryer.Application.Services.IdentityServices;
using AlfaKuryer.Domain.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace AlfaKargo.App.Controllers
{
    public class AccountController : Controller
    {
        private readonly IIdentityService _identityService;

        public AccountController(IIdentityService identityService)
        {
            _identityService = identityService;
        }

        public async Task<IActionResult> Login()
        {
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> Register(ModelStateDictionary?modelstate)
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(RegisterDto dto)
        {
            if (!ModelState.IsValid)
            {
                return View(dto);
            }

            string result=await _identityService.Register(dto);
            if (result.Length > 0)
            {
                ModelState.AddModelError("",result);
                return View(dto);
            }
            TempData["verify"] = "verify";
            return RedirectToAction("Index","Home");
        }
        
        public async Task<IActionResult> VerfiyEmail(string email,string token)
        {
            await _identityService.Verify(email,token);
            return RedirectToAction("Index", "Home");
        }
        public async Task<IActionResult> SignOut()
        {
            await _identityService.SignOut();
            return RedirectToAction("index","home");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginDto dto)
        {
            var result = await _identityService.Signin(dto);
            if (result.Length > 0)
            {
                ModelState.AddModelError("",result);
                return View();
            }
            return RedirectToAction("index", "home");
        }

        public async Task<IActionResult> ResetPassword(string email,string token)
        {
            ResetPasswordDto passwordDto = new ResetPasswordDto
            {
                Email = email,
                Token = token
            };
            return View(passwordDto);
        }
        [HttpPost]
       
        public async Task<IActionResult> ResetPassword(ResetPasswordDto passwordDto)
        {
            if (!ModelState.IsValid)
            {
                return View(passwordDto);
            }
           var result= await _identityService.ResetPassword(passwordDto);
            if (result.Length > 0)
            {
                ModelState.AddModelError("",result);
            }

            return RedirectToAction(nameof(Login));
        }

        [HttpPost]
        public async Task<IActionResult> ForgetPassword(string email)
        {
            var result=await _identityService.ForgetPassword(email);

            if (result.Length > 0)
            {
                return Json(new { status = 404, message = result });
            }

            return Json(new {status=200});
        }

    }
}
