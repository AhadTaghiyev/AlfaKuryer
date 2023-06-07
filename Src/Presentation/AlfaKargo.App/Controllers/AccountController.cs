using AlfaKargo.App.ViewModels;
using AlfaKargo.App.ViewModels;
using AlfaKuryer.Application.Dtos.CustomerDtos;
using AlfaKuryer.Application.Dtos.IdentityDtos;
using AlfaKuryer.Application.Services.IdentityServices;
using AlfaKuryer.Domain.Entities;
using Microsoft.AspNetCore.Authorization;
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
            if (result == "otp")
            {
                return RedirectToAction(nameof(VerifyOtp));
            }
            if (result.Length > 0)
            {
                ModelState.AddModelError("",result);
                return View(dto);
            }
            

            TempData["verify"] = "verify";
            return RedirectToAction("Index","Home");
        }

        public async Task<IActionResult> VerifyOtp()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> VerifyOtp(OtpDto dto)
        {
            var result = await _identityService.VerifyOtp(dto.Otp);
            if (!string.IsNullOrWhiteSpace(result))
            {
                ModelState.AddModelError("",result);
                return View();
            }
            return RedirectToAction("update","account");
        }

        public async Task<IActionResult> VerfiyEmail(string email,string token)
        {
            await _identityService.VerifyEmail(email,token);
            return RedirectToAction("update", "account");
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
            if (result == "C")
            {
                return RedirectToAction("Index","Courier");
            }

            if (result.Length > 0)
            {
                ModelState.AddModelError("",result);
                return View();
            }
            

            return RedirectToAction("update", "account");
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
        [Authorize(Roles = "User,Courier,Company")]
        public async Task<IActionResult> Update()
        {
            UpdateVewModel<UpdateDto, ApplicationUser> updateVewModel = new UpdateVewModel<UpdateDto, ApplicationUser>();

            updateVewModel.GetDto = await _identityService.GetByUserName();
            return View(updateVewModel);
        }

        [HttpPost]
        [Authorize(Roles = "User,Courier,Company")]
        public async Task<IActionResult> Update(UpdateVewModel<UpdateDto, ApplicationUser> updateVewModel)
        {
            if (!ModelState.IsValid)
            {
                updateVewModel.GetDto = await _identityService.GetByUserName();
                return View(updateVewModel);
            }
            await _identityService.Update(updateVewModel.PostDto);
            return RedirectToAction(nameof(Update));
        }
        




    }
}
