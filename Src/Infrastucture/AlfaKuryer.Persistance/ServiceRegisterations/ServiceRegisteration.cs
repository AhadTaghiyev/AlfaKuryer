

using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Application.Services.CityServices;
using AlfaKuryer.Application.Services.DistrictServices;
using AlfaKuryer.Application.Services.HelpServices;
using AlfaKuryer.Application.Services.IdentityServices;
using AlfaKuryer.Application.Services.MessageService;
using AlfaKuryer.Application.Services.NewsServices;
using AlfaKuryer.Application.Services.OrderServices;
using AlfaKuryer.Application.Services.PaymentServices;
using AlfaKuryer.Application.Services.PriceService;
using AlfaKuryer.Application.Services.RateServices;
using AlfaKuryer.Application.Services.SettingServices;
using AlfaKuryer.Application.Services.SlideService;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;
using AlfaKuryer.Persistance.Repositories.ReadRepositories;
using AlfaKuryer.Persistance.Repositories.WriteRepositories;
using AlfaKuryer.Persistance.Services;
using Hangfire;
using Hangfire.MySql.Core;
using MessageScheduler.Data.Repositories.ReadRepositories;
using MessageScheduler.Data.Repositories.WriteRepositories;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace AlfaKuryer.Persistance.ServiceRegisterations
{
    public static class ServiceRegisteration
    {
        public static void AddPersistenceRegistration(this IServiceCollection services, IConfiguration config)
        {
            string con = config.GetConnectionString("Default");
            services.AddDbContext<AlfaKuryerDbContext>(option =>
            {
                option.UseMySQL(con);
            });
            #region Settings
            services.AddScoped<ISettingReadRepository, SettingReadRepository>();
            services.AddScoped<ISettingWriteRepository, SettingWriteRepository>();
            services.AddScoped<ISettingService, SettingService>();
            #endregion
            #region Rates
            services.AddScoped<IRateReadRepository, RateReadRepository>();
            services.AddScoped<IRateWriteRepository, RateWriteRepository>();
            services.AddScoped<IRateService, RateService>();
            #endregion
            #region Helps
            services.AddScoped<IHelpReadRepository, HelpReadRepository>();
            services.AddScoped<IHelpWriteRepository, HelpWriteRepository>();
            services.AddScoped<IHelpService, HelpService>();
            #endregion
            #region Cities
            services.AddScoped<ICityReadRepository, CityReadRepository>();
            services.AddScoped<ICityWriteRepository, CityWriteRepository>();
            services.AddScoped<ICityService, CityService>();
            #endregion
            #region Districts
            services.AddScoped<IDistrictReadRepository, DistrictReadRepository>();
            services.AddScoped<IDistrictWriteRepository, DistrictWriteRepository>();
            services.AddScoped<IDistrictService, DistrictService>();
            #endregion
            #region Slides
            services.AddScoped<ISlideReadRepository, SlideReadRepository>();
            services.AddScoped<ISlideWriteRepository, SlideWriteRepository>();
            services.AddScoped<ISlideService, SlideService>();
            #endregion
            #region News
            services.AddScoped<INewsReadRepository, NewsReadRepository>();
            services.AddScoped<INewsWriteRepository, NewsWriteRepository>();
            services.AddScoped<INewsService, NewsService>();
            #endregion

            #region News
            services.AddScoped<IMessageReadRepository, MessageReadRepository>();
            services.AddScoped<IMessageWriteRepository, MessageWriteRepository>();
            services.AddScoped<IMessageService, MessageService>();
          
            #endregion
            #region Users

            services.AddIdentity<ApplicationUser, IdentityRole>(opt =>
            {
                opt.SignIn.RequireConfirmedEmail = true;
                opt.User.RequireUniqueEmail = false;
                opt.Lockout.AllowedForNewUsers = true;
                opt.Lockout.MaxFailedAccessAttempts = 5;
                opt.Password.RequireNonAlphanumeric = false;
                opt.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(5);
            })
          .AddEntityFrameworkStores<AlfaKuryerDbContext>()
          .AddDefaultTokenProviders();
            services.AddScoped<IIdentityService,IdentityService>();

            #endregion
            services.AddHttpContextAccessor();

            #region Hangfire
            services.AddHangfire(config =>
            {

                config.UseStorage(new MySqlStorage(con,
                    new MySqlStorageOptions
                    {
                        TablePrefix = "Hangfire" // Specify a custom table prefix if desired
                    }));
            });

            services.AddHangfireServer();
            #endregion
            #region Price
            services.AddScoped<IPriceReadRepository, PriceReadRepository>();
            services.AddScoped<IPriceWriteRepository, PriceWriteRepository>();
            services.AddScoped<IPriceService,PriceService>();
            #endregion
            #region Order
            services.AddScoped<IOrderReadRepository, OrderReadRepository>();
            services.AddScoped<IOrderWriteRepository, OrderWriteRepository>();
            services.AddScoped<IOrderService, OrderService>();
            #endregion

            #region Adress
            services.AddScoped<IAdressReadRepository, AdressReadRepository>();
            services.AddScoped<IAdressWriteRepository, AdressWriteRepository>();
            #endregion
            #region Adress
            services.AddScoped<IUserPaymentReadRepository, UserPaymentReadRepository>();
            services.AddScoped<IUserPaymentWriteRepository, UserPaymentWriteRepository>();
            services.AddTransient<IPaymentService, PaymentService>();
            #endregion
            #region CourierBalance
            services.AddScoped<ICourierBalanceReadRepository, CourierBalanceReadRepository>();
            services.AddScoped<ICourierBalanceWriteRepository, CourierBalanceWriteRepository>();
            #endregion
            #region CassirBalance
            services.AddScoped<ICassirBalanceReadRepository, CassirBalanceReadRepository>();
            services.AddScoped<ICassirBalanceWriteRepository, CassirBalanceWriteRepository>();
            #endregion
        }
    }
}
